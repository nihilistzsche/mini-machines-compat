if mods["mini-machines"] then
	require("__mini-machines__/func")
	if mods["leighzeruranimuminnovations"] then
		miniaturize("assembling-machine", "uranium-oil-refinery", "mini-uranium-refinery", 1)
		data.raw["assembling-machine"]["mini-refinery-1"].next_upgrade = "mini-uranium-refinery-1"
		miniaturize("assembling-machine", "uranium-chemical-plant", "mini-uranium-chemplant", 1)
		data.raw["assembling-machine"]["mini-chemplant-1"].next_upgrade = "mini-uranium-chemplant-1"
		miniaturize("storage-tank", "uranium-storage-tank", "mini-uranium-tank", 1)
		data.raw["storage-tank"]["mini-tank-1"].next_upgrade = "mini-uranium-tank-1"
		data.raw["mining-drill"]["mini-miner-1"].fast_replaceable_group = "electric-mining-drill"
	end

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
		local furnace = find_furnace("mini-furnace" .. i)
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
	if data.raw["becon"]["micro-beacon-10"] then
		data.raw["beacon"]["micro-beacon-10"].next_upgrade = nil
	end
	if data.raw["beacon"]["micro-beacon-2"] then
		data.raw["beacon"]["micro-beacon-1"].collision_mask =
			table.deepcopy(data.raw["beacon"]["micro-beacon-2"].collision_mask)
	end
end
