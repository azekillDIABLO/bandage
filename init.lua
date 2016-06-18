minetest.register_craftitem("bandage:bandage", {
	description = "Bandage",
	inventory_image = "bandage_bandage.png",
	
	minetest.register_on_player_hpchange(function(player, hp_change)
		if hp_change>2 then
			user:set_hp(hp + 3)
			itemstack:take_item()
		end
	end
	
	on_use = function(itemstack, user, pointed_thing)
		local hp = user:get_hp()
		if hp ~= 20 then
			user:set_hp(hp + 3)
			itemstack:take_item()
		end
		return itemstack
	end
})

minetest.register_craft({
	output = "bandage:bandage",
	recipe = {
		{"default:paper", "farming:cotton", "default:paper"}
	}
})

