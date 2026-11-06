fx_version "cerulean"
lua54 "yes"
game "gta5"
use_experimental_fxv2_oal "yes"

author "DevDaddyJacob"
description "A FiveM script which adds tow truck "
version "0.1.0"

shared_scripts {
	"shared/utils.lua",
	"shared/config.lua",
}

client_scripts {
	"client/utils.lua",
	"client/classes/towTruck.lua",
	"client/classes/scoopBased.lua",
	"client/classes/propBased.lua",
	"client/ropes.lua",
	"client/main.lua",
}