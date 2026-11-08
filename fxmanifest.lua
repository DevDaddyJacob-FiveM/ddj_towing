fx_version "cerulean"
lua54 "yes"
game "gta5"
use_experimental_fxv2_oal "yes"

author "DevDaddyJacob"
description "A FiveM script which adds the ability to enhance tow truck operation"
version "2.0.0"

dependencies {
	"ddj_lib", -- version >= 1.4.0
}

shared_scripts {
	"@ddj_lib/shared/logging.lua",

	"config.lua",
	"shared/utils.lua",
}

client_scripts {
	"client/utils.lua",
	"client/classes/towTruck.lua",
	"client/classes/scoopBased.lua",
	"client/classes/propBased.lua",
	"client/ropes.lua",
	"client/cleanup.lua",
	"client/main.lua",
}