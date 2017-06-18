local function passable(name)
    local block = minetest.registered_nodes[name]

    return block
        and block.walkable == false
        and block.liquidtype == "none"

end

local droplet = {
    hp_max = 1,
    physical = true,
    weight = 0,
    collisionbox = {0, 0, 0, 0, 0, 0},
    visual = "cube",
    visual_size = {x=0.05, y=0.15},
    textures = {},
    is_visible = true,
    makes_footstep_sound = false,
    automatic_rotate = false,
    spritediv = {x=1, y=1},
    initial_sprite_basepos = {x=0, y=0},

    on_activate = function(self)
        self.object:setsprite({x=0, y=0}, 1, 1, true)
        self.object:setacceleration({x=0, y=-10, z=0})
    end,

    on_step = function(self)
        if self.object:getvelocity().y ~= 0 then
            return
        end

        local position = self.object:getpos()
        position.y = position.y - 0.5

        if not passable(minetest.get_node(position).name) then
            self.object:remove()
            position.y = position.y + 0.5
        end
    end,
}

droplet.textures = {"default_water.png","default_water.png","default_water.png","default_water.png", "default_water.png", "default_water.png"}
minetest.register_entity("liquiddrip:water", table.copy(droplet))

droplet.textures = {"default_lava_source_animated.png","default_lava_source_animated.png","default_lava_source_animated.png","default_lava_source_animated.png", "default_lava_source_animated.png", "default_lava_source_animated.png"}
minetest.register_entity("liquiddrip:lava", table.copy(droplet))

local function create_droplet(position, name)
    local block = minetest.registered_nodes[minetest.get_node{x=position.x, y=position.y +1, z=position.z}.name]
    
    if not block then
        return
    end

    if block.liquidtype == "none" then
        return
    end
 
    if passable(minetest.get_node({x=position.x, y=position.y -1, z=position.z}).name) then
        minetest.add_entity({x=position.x+math.random(0.05, 0.95), z=position.z+math.random(0.05, 0.95), y=position.y-math.random(0.2, 0.8)}, name) -- vary the spawn location a bit
    end
end

minetest.register_abm({
    nodenames = {"group:crumbly", "group:cracky", "group:choppy"},
    neighbors = {"group:water"},
    interval = 2,
    chance = 50,
    catch_up = false,
    action = function(pos)
        create_droplet(pos, "liquiddrip:water")
    end,
})



--Create lava drop

minetest.register_abm({
    nodenames = {"group:crumbly", "group:cracky", "group:choppy"},
    neighbors = {"group:lava"},
    interval = 2,
    chance = 25,
    catch_up = false,
    action = function(pos)
        create_droplet(pos, "liquiddrip:lava")
    end,
})