interface.creative_inventory_size = 0

interface.tabs = {
	["building"] = {
		["position"] = "top",
		["label"] = "Building Blocks",
		["image"] = "default:brickblock",
	},
	["decoration"] = {
		["position"] = "top",
		["label"] = "Decoration Blocks",
		["image"] = "flowers:flower_rose",
	},
	["redstone"] =  {
		["position"] = "top",
		["label"] = "Redstone",
		["image"] = "tnt:gunpowder",
	},
	["transportation"] = {
		["position"] = "top",
		["label"] = "Transportation",
		["image"] = "carts:rail",
	},
	["miscellaneous"] = {
		["position"] = "top",
		["label"] = "Miscellaneous",
		["image"] = "bucket:bucket_lava",
	},
	["foodstuff"] = {
		["position"] = "bottom",
		["label"] = "Foodstuffs",
		["image"] = "default:apple",
	},
	["tools"] = {
		["position"] = "bottom",
		["label"] = "Tools",
		["image"] = "default:axe_diamond",
	},
	["combat"] = {
		["position"] = "bottom",
		["label"] = "Combat",
		["image"] = "default:sword_gold",
	},
	["brewing"] = {
		["position"] = "bottom",
		["label"] = "Brewing",
		["image"] = "default:snow",
	},
	["materials"] = {
		["position"] = "bottom",
		["label"] = "Materials",
		["image"] = "default:stick",
	}
}

minetest.register_on_placenode(function(pos, newnode, placer, oldnode, itemstack)
	if placer:get_attribute("default:gamemode") == "creative" then
		return true
	end
end)

function minetest.handle_node_drops(pos, drops, digger)
	if not digger or not digger:is_player() then
		return
	end
	if digger:get_attribute("default:gamemode") == "creative" then
		local inv = digger:get_inventory()
		if inv then
			for _, item in ipairs(drops) do
				item = ItemStack(item):get_name()
				if not inv:contains_item("main", item) then
					inv:add_item("main", item)
				end
			end
		end
	end
end

dofile(minetest.get_modpath("gamemode") .. "/creative/functions.lua")
