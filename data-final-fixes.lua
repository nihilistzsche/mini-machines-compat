if mods["mini-machines"] then
	require("__mini-machines__/func")
	miniaturize("assembling-machine", "uranium-oil-refinery", "mini-uranium-refinery", 1)
	data.raw["assembling-machine"]["mini-refinery-1"].next_upgrade = "mini-uranium-refinery-1"
	miniaturize("assembling-machine", "uranium-chemical-plant", "mini-uranium-chemplant", 1)
	data.raw["assembling-machine"]["mini-chemplant-1"].next_upgrade = "mini-uranium-chemplant-1"
	miniaturize("storage-tank", "uranium-storage-tank", "mini-uranium-tank", 1)
	data.raw["storage-tank"]["mini-tank-1"].next_upgrade = "mini-uranium-tank-1"
	data.raw["mining-drill"]["mini-miner-1"].fast_replaceable_group = "electric-mining-drill"
	for i = 1, 10 do
		if data.raw["assembling-machine"]["mini-furnace-"..i] then
			data.raw["assembling-machine"]["mini-furnace-"..i].fast_replaceable_group = "furnace"
		end
	end
	data.raw["assembling-machine"]["electric-steel-furnace"].next_upgrade = "mini-furnace-1"
	data.raw["assembling-machine"]["steel-furnace"].next_upgrade = "mini-furnace-1"
	local btbl = data.raw["assembling-machine"]["steel-furnace"]
	data.raw["assembling-machine"]["mini-furnace-1"].collision_box = table.deepcopy(btbl.collision_box)
	data.raw["assembling-machine"]["mini-furnace-1"].selection_box = table.deepcopy(btbl.selection_box)
	for i = 2, 10 do
		if data.raw["assembling-machine"]["mini-furnace-"..i] then
			local tbl = data.raw["assembling-machine"]["mini-furnace-"..i]
			tbl.collision_box = table.deepcopy(btbl.collision_box)
			tbl.selection_box = table.deepcopy(btbl.selection_box)
			tbl.next_upgrade = "mini-furnace-"..(i - 1)
		end
	end
end
if mods["micro-machines"] then
	data.raw["mining-drill"]["micro-miner-1"].fast_replaceable_group = "electric-mining-drill"
end
