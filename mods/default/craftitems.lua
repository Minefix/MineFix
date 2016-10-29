-- mods/default/craftitems.lua

local lpp = 14 -- Lines per book's page
local function book_on_use(itemstack, user)
	local player_name = user:get_player_name()
	local data = minetest.deserialize(itemstack:get_metadata())
	local title, text, owner = "", "", player_name
	local page, page_max, lines, string = 1, 1, {}, ""

	if data then
		title = data.title
		text = data.text
		owner = data.owner

		for str in (text .. "\n"):gmatch("([^\n]*)[\n]") do
			lines[#lines+1] = str
		end

		if data.page then
			page = data.page
			page_max = data.page_max

			for i = ((lpp * page) - lpp) + 1, lpp * page do
				if not lines[i] then break end
				string = string .. lines[i] .. "\n"
			end
		end
	end

	local formspec
	if owner == player_name then
		formspec = "size[8,8]" .. default.gui_bg ..
			default.gui_bg_img ..
			"field[0.5,1;7.5,0;title;Title:;" ..
				minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;text;Contents:;" ..
				minetest.formspec_escape(text) .. "]" ..
			"button_exit[2.5,7.5;3,1;save;Save]"
	else
		formspec = "size[8,8]" .. default.gui_bg ..
			default.gui_bg_img ..
			"label[0.5,0.5;by " .. owner .. "]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[0.4,0;7,0.5;title;#FFFF00," .. minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;;" ..
				minetest.formspec_escape(string ~= "" and string or text) .. ";]" ..
			"button[2.4,7.6;0.8,0.8;book_prev;<]" ..
			"label[3.2,7.7;Page " .. page .. " of " .. page_max .. "]" ..
			"button[4.9,7.6;0.8,0.8;book_next;>]"
	end

	minetest.show_formspec(player_name, "default:book", formspec)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "default:book" then
		return
	end

	local inv = player:get_inventory()
	local stack = player:get_wielded_item()

	if fields.save and fields.title ~= "" and fields.text ~= "" then
		local new_stack, data
		if stack:get_name() ~= "default:book_written" then
			local count = stack:get_count()
			if count == 1 then
				stack:set_name("default:book_written")
			else
				stack:set_count(count - 1)
				new_stack = ItemStack("default:book_written")
			end
		else
			data = minetest.deserialize(stack:get_metadata())
		end

		if not data then data = {} end
		data.title = fields.title
		data.text = fields.text
		data.text_len = #data.text
		data.page = 1
		data.page_max = math.ceil((#data.text:gsub("[^\n]", "") + 1) / lpp)
		data.owner = player:get_player_name()
		local data_str = minetest.serialize(data)

		if new_stack then
			new_stack:set_metadata(data_str)
			if inv:room_for_item("main", new_stack) then
				inv:add_item("main", new_stack)
			else
				minetest.add_item(player:getpos(), new_stack)
			end
		else
			stack:set_metadata(data_str)
		end

	elseif fields.book_next or fields.book_prev then
		local data = minetest.deserialize(stack:get_metadata())
		if not data or not data.page then
			return
		end

		if fields.book_next then
			data.page = data.page + 1
			if data.page > data.page_max then
				data.page = 1
			end
		else
			data.page = data.page - 1
			if data.page == 0 then
				data.page = data.page_max
			end
		end

		local data_str = minetest.serialize(data)
		stack:set_metadata(data_str)
		book_on_use(stack, player)
	end

	player:set_wielded_item(stack)
end)

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() ~= "default:book_written" then
		return
	end

	local original
	local index
	for i = 1, player:get_inventory():get_size("craft") do
		if old_craft_grid[i]:get_name() == "default:book_written" then
			original = old_craft_grid[i]
			index = i
		end
	end
	if not original then
		return
	end
	local copymeta = original:get_metadata()
	-- copy of the book held by player's mouse cursor
	itemstack:set_metadata(copymeta)
	-- put the book with metadata back in the craft grid
	craft_inv:set_stack("craft", index, original)
end)

minetest.register_craftitem("default:stick", {
	description = "Stick",
	category = "materials",
	inventory_image = "default_stick.png",
	groups = {stick = 1},
})

minetest.register_craftitem("default:paper", {
	description = "Paper",
	category = "miscellaneous",
	inventory_image = "default_paper.png",
})

minetest.register_craftitem("default:book", {
	description = "Book",
	category = "miscellaneous",
	inventory_image = "default_book.png",
	groups = {book = 1},
	on_use = book_on_use,
})

minetest.register_craftitem("default:book_written", {
	description = "Book With Text",
	category = "miscellaneous",
	inventory_image = "default_book_written.png",
	groups = {book = 1, not_in_creative_inventory = 1},
	stack_max = 1,
	on_use = book_on_use,
})

minetest.register_craftitem("default:coal_lump", {
	description = "Coal Lump",
	category = "materials",
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1}
})

minetest.register_craftitem("default:diamond", {
	description = "Diamond",
	category = "materials",
	inventory_image = "default_diamond.png",
})

minetest.register_craftitem("default:clay_lump", {
	description = "Clay Lump",
	category = "materials",
	inventory_image = "default_clay_lump.png",
})

minetest.register_craftitem("default:gold_ingot", {
	description = "Gold Ingot",
	category = "materials",
	inventory_image = "default_gold_ingot.png"
})

minetest.register_craftitem("default:iron_ingot", {
	description = "Iron Ingot",
	category = "materials",
	inventory_image = "default_iron_ingot.png"
})

minetest.register_craftitem("default:clay_brick", {
	description = "Clay Brick",
	category = "materials",
	inventory_image = "default_clay_brick.png",
})

minetest.register_craftitem("default:flint", {
	description = "Flint",
	category = "materials",
	inventory_image = "default_flint.png"
})

-- Dyes, colors, etc
minetest.register_craftitem("default:dye_black", {
	description = "Ink Sac",
	category = "materials",
	inventory_image = "default_dye_black.png"
})

minetest.register_craftitem("default:dye_blue", {
	description = "Lapis Lazuli",
	category = "materials",
	inventory_image = "default_dye_blue.png"
})

minetest.register_craftitem("default:dye_brown", {
	description = "Cocoa Beans",
	category = "materials",
	inventory_image = "default_dye_brown.png"
})

minetest.register_craftitem("default:dye_cyan", {
	description = "Cyan Dye",
	category = "materials",
	inventory_image = "default_dye_cyan.png"
})

minetest.register_craftitem("default:dye_gray", {
	description = "Gray Dye",
	category = "materials",
	inventory_image = "default_dye_gray.png"
})

minetest.register_craftitem("default:dye_green", {
	description = "Cactus Green",
	category = "materials",
	inventory_image = "default_dye_green.png"
})

minetest.register_craftitem("default:dye_light_blue", {
	description = "Light Blue Dye",
	category = "materials",
	inventory_image = "default_dye_light_blue.png"
})

minetest.register_craftitem("default:dye_light_gray", {
	description = "Light Gray Dye",
	category = "materials",
	inventory_image = "default_dye_light_gray.png"
})

minetest.register_craftitem("default:dye_lime_green", {
	description = "Lime Dye",
	category = "materials",
	inventory_image = "default_dye_lime_green.png"
})

minetest.register_craftitem("default:dye_magenta", {
	description = "Magenta Dye",
	category = "materials",
	inventory_image = "default_dye_magenta.png"
})

minetest.register_craftitem("default:dye_orange", {
	description = "Orange Dye",
	category = "materials",
	inventory_image = "default_dye_orange.png"
})

minetest.register_craftitem("default:dye_pink", {
	description = "Pink Dye",
	category = "materials",
	inventory_image = "default_dye_pink.png"
})

minetest.register_craftitem("default:dye_purple", {
	description = "Purple Dye",
	category = "materials",
	inventory_image = "default_dye_purple.png"
})

minetest.register_craftitem("default:dye_red", {
	description = "Rose red",
	category = "materials",
	inventory_image = "default_dye_red.png"
})

minetest.register_craftitem("default:dye_white", {
	description = "Bone Meal",
	category = "materials",
	inventory_image = "default_dye_white.png"
})

minetest.register_craftitem("default:dye_yellow", {
	description = "Dandelion Yellow",
	category = "materials",
	inventory_image = "default_dye_yellow.png"
})
