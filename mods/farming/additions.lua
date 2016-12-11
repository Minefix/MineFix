minetest.register_node("farming:melon", {
    description = "Melon",
    groups = {oddly_breakable_by_hand = 2},
    tiles = {
        "farming_melon_top.png",
        "farming_melon_top.png",
        "farming_melon.png",
        "farming_melon.png",
        "farming_melon.png",
        "farming_melon.png",
    },
    drop = "farming:melon_slice",
})
