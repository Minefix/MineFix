interface.createSurvivalInventory = function(player)
	local inventory = minetest.get_inventory({type="detached", name="survival"})

	local formspec = "size[9,8.5]"..
				"background[0,0;9,8.5;gui_formbg.png;true]" ..
				"label[5,0.1;Crafting]" ..
				"list[current_player;craft;5,0.5;2,2;]"..
				"image[7,1;1,1;gui_furnace_arrow_bg.png^[transformR270]" ..
				"list[current_player;craftpreview;8,1;1,1;]"..
				"list[current_player;main;0,4.25;9,3;9]" ..
				"list[current_player;main;0,7.50;9,1;]"

	player:set_inventory_formspec(formspec)
end
