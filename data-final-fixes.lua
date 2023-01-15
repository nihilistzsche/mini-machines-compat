if mods["mini-machines"] then
	data.raw["assembling-machine"]["mini-refinery-1"].next_upgrade = nil
	data.raw["assembling-machine"]["mini-chemplant-1"].next_upgrade = nil
	data.raw["storage-tank"]["mini-tank-1"].next_upgrade = nil
	data.raw["mining-drill"]["mini-miner-1"].fast_replaceable_group = "electric-mining-drill"
end
if mods["micro-machines"] then
	data.raw["mining-drill"]["micro-miner-1"].fast_replaceable_group = "electric-mining-drill"
end
