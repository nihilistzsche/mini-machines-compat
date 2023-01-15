if mods["mini-machines"] then
	require("__mini-machines__/func")
	miniaturize("assembling-machine", "uranium-oil-refinery", "mini-uranium-refinery", 1)
	data.raw["assembling-machine"]["mini-refinery-1"].next_upgrade = "mini-uranium-refinery-1"
	miniaturize("assembling-machine", "uranium-chemical-plant", "mini-uranium-chemplant", 1)
	data.raw["assembling-machine"]["mini-chemplant-1"].next_upgrade = "mini-uranium-chemplant-1"
	miniaturize("storage-tank", "uranium-storage-tank", "mini-uranium-tank", 1)
	data.raw["storage-tank"]["mini-tank-1"].next_upgrade = "mini-uranium-tank-1"
	data.raw["mining-drill"]["mini-miner-1"].fast_replaceable_group = "electric-mining-drill"
end
if mods["micro-machines"] then
	data.raw["mining-drill"]["micro-miner-1"].fast_replaceable_group = "electric-mining-drill"
end
