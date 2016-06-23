minetest.register_craftitem("bandage:bandage", {
	description = "Bandage",
	inventory_image = "bandage_bandage.png",
	on_use = function(itemstack, user, pointed_thing)
		local hp = user:get_hp()
		if hp ~= 20 then
			user:set_hp(hp + 2)
			itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_on_player_hpchange(function(player, hp_change)
	if hp_change >= 0 then
		return hp_change
	end

	local inv = player:get_inventory()
	local itemstack = inv:remove_item("main", ItemStack("bandage:bandage"))
	if itemstack:get_count() == math.random(1, 3) then
		-- cancel hp change
		return -2 
	else
		-- no bandages, don't cancel
		return hp_change
	end
end, true)

minetest.register_craft({
	output = "bandage:bandage",
	recipe = {
		{"default:paper", "farming:cotton", "default:paper"}
	}
})

