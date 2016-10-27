local modpath = minetest.get_modpath("minefix_carts")
dofile(modpath .. "/blocks.lua")

dofile(modpath .. "/crafting.lua")
dofile(modpath .. "/functions.lua")

--
-- Cart entity
--

cart = {
	physical = false,
	collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	visual = "mesh",
	mesh = "minefix_cart.x",
	visual_size = {x=1, y=1},
	textures = {"minefix_cart.png"},

	driver = nil,
	velocity = {x=0, y=0, z=0},
	old_pos = nil,
	old_velocity = nil,
	pre_stop_dir = nil,
	MAX_V = 8, -- Limit of the velocity
}

dofile(modpath .. "/items.lua")

function cart:on_rightclick(clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	if self.driver and clicker == self.driver then
		self.driver = nil
		clicker:set_detach()
	elseif not self.driver then
		self.driver = clicker
		clicker:set_attach(self.object, "", {x=0,y=5,z=0}, {x=0,y=0,z=0})
	end
end

function cart:on_activate(staticdata, dtime_s)
	self.object:set_armor_groups({immortal=1})
	if staticdata then
		local tmp = minetest.deserialize(staticdata)
		if tmp then
			self.velocity = tmp.velocity
		end
		if tmp and tmp.pre_stop_dir then
			self.pre_stop_dir = tmp.pre_stop_dir
		end
	end
	self.old_pos = self.object:getpos()
	self.old_velocity = self.velocity
end

function cart:get_staticdata()
	return minetest.serialize({
		velocity = self.velocity,
		pre_stop_dir = self.pre_stop_dir,
	})
end

-- Remove the cart if holding a tool or accelerate it
function cart:on_punch(puncher, time_from_last_punch, tool_capabilities, direction)
	if not puncher or not puncher:is_player() then
		return
	end

	if puncher:get_player_control().sneak then
		self.object:remove()
		local inv = puncher:get_inventory()
		if minetest.setting_getbool("creative_mode") then
			if not inv:contains_item("main", "minefix_carts:cart") then
				inv:add_item("main", "minefix_carts:cart")
			end
		else
			inv:add_item("main", "minefix_carts:cart")
		end
		return
	end

	if puncher == self.driver then
		return
	end

	local d = cart_func:velocity_to_dir(direction)
	local s = self.velocity
	if time_from_last_punch > tool_capabilities.full_punch_interval then
		time_from_last_punch = tool_capabilities.full_punch_interval
	end
	local f = 4*(time_from_last_punch/tool_capabilities.full_punch_interval)
	local v = {x=s.x+d.x*f, y=s.y, z=s.z+d.z*f}
	if math.abs(v.x) < 6 and math.abs(v.z) < 6 then
		self.velocity = v
	else
		if math.abs(self.velocity.x) < 6 and math.abs(v.x) >= 6 then
			self.velocity.x = 6*cart_func:get_sign(self.velocity.x)
		end
		if math.abs(self.velocity.z) < 6 and math.abs(v.z) >= 6 then
			self.velocity.z = 6*cart_func:get_sign(self.velocity.z)
		end
	end
end

-- Returns the direction as a unit vector
function cart:get_rail_direction(pos, dir)
	local d = cart_func.v3:copy(dir)

	-- Check front
	d.y = 0
	local p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end

	-- Check downhill
	d.y = -1
	p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end

	-- Check uphill
	d.y = 1
	p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end
	d.y = 0

	-- Check left and right
	local view_dir
	local other_dir
	local a

	if d.x == 0 and d.z ~= 0 then
		view_dir = "z"
		other_dir = "x"
		if d.z < 0 then
			a = {1, -1}
		else
			a = {-1, 1}
		end
	elseif d.z == 0 and d.x ~= 0 then
		view_dir = "x"
		other_dir = "z"
		if d.x > 0 then
			a = {1, -1}
		else
			a = {-1, 1}
		end
	else
		return {x=0, y=0, z=0}
	end

	d[view_dir] = 0
	d[other_dir] = a[1]
	p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end
	d.y = -1
	p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end
	d.y = 0
	d[other_dir] = a[2]
	p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end
	d.y = -1
	p = cart_func.v3:add(cart_func.v3:copy(pos), d)
	if cart_func:is_rail(p) then
		return d
	end
	d.y = 0

	return {x=0, y=0, z=0}
end

function cart:calc_rail_direction(pos, vel)
	local velocity = cart_func.v3:copy(vel)
	local p = cart_func.v3:copy(pos)
	if cart_func:is_int(p.x) and cart_func:is_int(p.z) then

		local dir = cart_func:velocity_to_dir(velocity)
		local dir_old = cart_func.v3:copy(dir)

		dir = self:get_rail_direction(cart_func.v3:round(p), dir)

		local v = math.max(math.abs(velocity.x), math.abs(velocity.z))
		velocity = {
			x = v * dir.x,
			y = v * dir.y,
			z = v * dir.z,
		}

		if cart_func.v3:equal(velocity, {x=0, y=0, z=0}) and not cart_func:is_rail(p) then

			-- First try this HACK
			-- Move the cart on the rail if above or under it
			if cart_func:is_rail(cart_func.v3:add(p, {x=0, y=1, z=0})) and vel.y >= 0 then
				p = cart_func.v3:add(p, {x=0, y=1, z=0})
				return self:calc_rail_direction(p, vel)
			end
			if cart_func:is_rail(cart_func.v3:add(p, {x=0, y=-1, z=0})) and vel.y <= 0  then
				p = cart_func.v3:add(p, {x=0, y=-1, z=0})
				return self:calc_rail_direction(p, vel)
			end
			-- Now the HACK gets really dirty
			if cart_func:is_rail(cart_func.v3:add(p, {x=0, y=2, z=0})) and vel.y >= 0 then
				p = cart_func.v3:add(p, {x=0, y=1, z=0})
				return self:calc_rail_direction(p, vel)
			end
			if cart_func:is_rail(cart_func.v3:add(p, {x=0, y=-2, z=0})) and vel.y <= 0 then
				p = cart_func.v3:add(p, {x=0, y=-1, z=0})
				return self:calc_rail_direction(p, vel)
			end

			return {x=0, y=0, z=0}, p
		end

		if not cart_func.v3:equal(dir, dir_old) then
			return velocity, cart_func.v3:round(p)
		end

	end
	return velocity, p
end

function cart:on_step(dtime)

	local pos = self.object:getpos()
	local dir = cart_func:velocity_to_dir(self.velocity)

	if not cart_func.v3:equal(self.velocity, {x=0,y=0,z=0}) then
		self.pre_stop_dir = cart_func:velocity_to_dir(self.velocity)
	end

	-- Stop the cart if the velocity is nearly 0
	-- Only if on a flat railway
	if dir.y == 0 then
		if math.abs(self.velocity.x) < 0.1 and  math.abs(self.velocity.z) < 0.1 then
			-- Start the cart if powered from mesecons
			local a = tonumber(minetest.env:get_meta(pos):get_string("cart_acceleration"))
			if a and a ~= 0 then
				if self.pre_stop_dir and cart_func.v3:equal(self:get_rail_direction(self.object:getpos(), self.pre_stop_dir), self.pre_stop_dir) then
					self.velocity = {
						x = self.pre_stop_dir.x * 0.2,
						y = self.pre_stop_dir.y * 0.2,
						z = self.pre_stop_dir.z * 0.2,
					}
					self.old_velocity = self.velocity
					return
				end
				for _,y in ipairs({0,-1,1}) do
					for _,z in ipairs({1,-1}) do
						if cart_func.v3:equal(self:get_rail_direction(self.object:getpos(), {x=0, y=y, z=z}), {x=0, y=y, z=z}) then
							self.velocity = {
								x = 0,
								y = 0.2*y,
								z = 0.2*z,
							}
							self.old_velocity = self.velocity
							return
						end
					end
					for _,x in ipairs({1,-1}) do
						if cart_func.v3:equal(self:get_rail_direction(self.object:getpos(), {x=x, y=y, z=0}), {x=x, y=y, z=0}) then
							self.velocity = {
								x = 0.2*x,
								y = 0.2*y,
								z = 0,
							}
							self.old_velocity = self.velocity
							return
						end
					end
				end
			end

			self.velocity = {x=0, y=0, z=0}
			self.object:setvelocity(self.velocity)
			self.old_velocity = self.velocity
			self.old_pos = self.object:getpos()
			return
		end
	end

	--
	-- Set the new moving direction
	--

	-- Recalcualte the rails that are passed since the last server step
	local old_dir = cart_func:velocity_to_dir(self.old_velocity)
	if old_dir.x ~= 0 then
		local sign = cart_func:get_sign(pos.x-self.old_pos.x)
		while true do
			if sign ~= cart_func:get_sign(pos.x-self.old_pos.x) or pos.x == self.old_pos.x then
				break
			end
			self.old_pos.x = self.old_pos.x + cart_func:get_sign(pos.x-self.old_pos.x)*0.1
			self.old_pos.y = self.old_pos.y + cart_func:get_sign(pos.x-self.old_pos.x)*0.1*old_dir.y
			self.old_velocity, self.old_pos = self:calc_rail_direction(self.old_pos, self.old_velocity)
			old_dir = cart_func:velocity_to_dir(self.old_velocity)
			if not cart_func.v3:equal(cart_func:velocity_to_dir(self.old_velocity), dir) then
				self.velocity = self.old_velocity
				pos = self.old_pos
				self.object:setpos(self.old_pos)
				break
			end
		end
	elseif old_dir.z ~= 0 then
		local sign = cart_func:get_sign(pos.z-self.old_pos.z)
		while true do
			if sign ~= cart_func:get_sign(pos.z-self.old_pos.z) or pos.z == self.old_pos.z then
				break
			end
			self.old_pos.z = self.old_pos.z + cart_func:get_sign(pos.z-self.old_pos.z)*0.1
			self.old_pos.y = self.old_pos.y + cart_func:get_sign(pos.z-self.old_pos.z)*0.1*old_dir.y
			self.old_velocity, self.old_pos = self:calc_rail_direction(self.old_pos, self.old_velocity)
			old_dir = cart_func:velocity_to_dir(self.old_velocity)
			if not cart_func.v3:equal(cart_func:velocity_to_dir(self.old_velocity), dir) then
				self.velocity = self.old_velocity
				pos = self.old_pos
				self.object:setpos(self.old_pos)
				break
			end
		end
	end

	-- Calculate the new step
	self.velocity, pos = self:calc_rail_direction(pos, self.velocity)
	self.object:setpos(pos)
	dir = cart_func:velocity_to_dir(self.velocity)

	-- Accelerate or decelerate the cart according to the pitch and acceleration of the rail node
	local a = tonumber(minetest.env:get_meta(pos):get_string("cart_acceleration"))
	if not a then
		a = 0
	end
	if self.velocity.y < 0 then
		self.velocity = {
			x = self.velocity.x + (a+0.13)*cart_func:get_sign(self.velocity.x),
			y = self.velocity.y + (a+0.13)*cart_func:get_sign(self.velocity.y),
			z = self.velocity.z + (a+0.13)*cart_func:get_sign(self.velocity.z),
		}
	elseif self.velocity.y > 0 then
		self.velocity = {
			x = self.velocity.x + (a-0.1)*cart_func:get_sign(self.velocity.x),
			y = self.velocity.y + (a-0.1)*cart_func:get_sign(self.velocity.y),
			z = self.velocity.z + (a-0.1)*cart_func:get_sign(self.velocity.z),
		}
	else
		self.velocity = {
			x = self.velocity.x + (a-0.03)*cart_func:get_sign(self.velocity.x),
			y = self.velocity.y + (a-0.03)*cart_func:get_sign(self.velocity.y),
			z = self.velocity.z + (a-0.03)*cart_func:get_sign(self.velocity.z),
		}

		-- Place the cart exactly on top of the rail
		if cart_func:is_rail(cart_func.v3:round(pos)) then
			self.object:setpos({x=pos.x, y=math.floor(pos.y+0.5), z=pos.z})
			pos = self.object:getpos()
		end
	end

	-- Dont switch moving direction
	-- Only if on flat railway
	if dir.y == 0 then
		if cart_func:get_sign(dir.x) ~= cart_func:get_sign(self.velocity.x) then
			self.velocity.x = 0
		end
		if cart_func:get_sign(dir.y) ~= cart_func:get_sign(self.velocity.y) then
			self.velocity.y = 0
		end
		if cart_func:get_sign(dir.z) ~= cart_func:get_sign(self.velocity.z) then
			self.velocity.z = 0
		end
	end

	-- Allow only one moving direction (multiply the other one with 0)
	dir = cart_func:velocity_to_dir(self.velocity)
	self.velocity = {
		x = math.abs(self.velocity.x) * dir.x,
		y = self.velocity.y,
		z = math.abs(self.velocity.z) * dir.z,
	}

	-- Move cart exactly on the rail
	if dir.x ~= 0 and not cart_func:is_int(pos.z) then
		pos.z = math.floor(0.5+pos.z)
		self.object:setpos(pos)
	elseif dir.z ~= 0 and not cart_func:is_int(pos.x) then
		pos.x = math.floor(0.5+pos.x)
		self.object:setpos(pos)
	end

	-- Limit the velocity
	if math.abs(self.velocity.x) > self.MAX_V then
		self.velocity.x = self.MAX_V*cart_func:get_sign(self.velocity.x)
	end
	if math.abs(self.velocity.y) > self.MAX_V then
		self.velocity.y = self.MAX_V*cart_func:get_sign(self.velocity.y)
	end
	if math.abs(self.velocity.z) > self.MAX_V then
		self.velocity.z = self.MAX_V*cart_func:get_sign(self.velocity.z)
	end

	self.object:setvelocity(self.velocity)

	self.old_pos = self.object:getpos()
	self.old_velocity = cart_func.v3:copy(self.velocity)

	if dir.x < 0 then
		self.object:setyaw(math.pi/2)
	elseif dir.x > 0 then
		self.object:setyaw(3*math.pi/2)
	elseif dir.z < 0 then
		self.object:setyaw(math.pi)
	elseif dir.z > 0 then
		self.object:setyaw(0)
	end

	if dir.y == -1 then
		self.object:set_animation({x=1, y=1}, 1, 0)
	elseif dir.y == 1 then
		self.object:set_animation({x=2, y=2}, 1, 0)
	else
		self.object:set_animation({x=0, y=0}, 1, 0)
	end

end
