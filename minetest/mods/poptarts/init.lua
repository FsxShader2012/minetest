--PopTart Food Test Mod ----------- Copyright Robin Kuhn 2015


--Define PopTart item as food
minetest.register_craftitem("poptarts:poptart", {
	description = "PopTart",
	inventory_image = "poptart.png",
	on_use = function(itemstack, user, pointed_thing)
		hp_change = 10
		replace_with_item = nil
		
		minetest.chat_send_player (user:get_player_name(), "You ate an PopTart")
		
		-- Support for hunger mods using minetest.register_on_item_eat
        for _ , callback in pairs(minetest.registered_on_item_eats) do
            local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing)
            if result then
                return result
            end
        end
		
		if itemstack:take_item() ~= nil then
            user:set_hp(user:get_hp() + hp_change)
        end

        return itemstack
    end
})
