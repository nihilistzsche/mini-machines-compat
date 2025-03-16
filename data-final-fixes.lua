if mods["mini-machines"] then
	local function find_furnace(name)
		if data.raw.furnace[name] then
			return data.raw.furnace[name]
		end
		if data.raw["assembling-machine"][name] then
			return data.raw["assembling-machine"][name]
		end
		if data.raw[name] then
			return data.raw[name]
		end
	end

	for i = 1, 10 do
		local furnace = find_furnace("mini-furnace-" .. i)
		if furnace then
			furnace.fast_replaceable_group = "furnace"
		end
	end
	if mods["Electric Furnaces"] then
		find_furnace("electric-steel-furnace").next_upgrade = "mini-furnace-1"
	end
	find_furnace("steel-furnace").next_upgrade = "mini-furnace-1"
	local btbl = find_furnace("steel-furnace")
	for i = 1, 10 do
		local furnace = find_furnace("mini-furnace-" .. i)
		if furnace then
			furnace.collision_box = table.deepcopy(btbl.collision_box)
			furnace.selection_box = table.deepcopy(btbl.selection_box)
			if i < 10 and find_furnace("mini-furnace" .. (i + 1)) then
				furnace.next_upgrade = "mini-furnace-" .. (i + 1)
			end
		end
	end
	if data.raw["beacon"]["mini-beacon-2"] then
		data.raw["beacon"]["mini-beacon-1"].collision_mask =
			table.deepcopy(data.raw["beacon"]["mini-beacon-2"].collision_mask)
	end
end
if mods["micro-machines"] then
	data.raw["mining-drill"]["micro-miner-1"].fast_replaceable_group = "electric-mining-drill"
	if data.raw["mining-drill"]["micro-miner-10"] then
		data.raw["mining-drill"]["micro-miner-10"].next_upgrade = nil
	end
	if data.raw["beacon"]["micro-beacon-10"] then
		data.raw["beacon"]["micro-beacon-10"].next_upgrade = nil
	end
	if data.raw["beacon"]["micro-beacon-2"] then
		data.raw["beacon"]["micro-beacon-1"].collision_mask =
			table.deepcopy(data.raw["beacon"]["micro-beacon-2"].collision_mask)
	end
end
