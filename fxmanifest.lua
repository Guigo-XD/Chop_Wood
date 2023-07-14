-- created by GuigoXD
author 'GuigoXD'
version '1.0'
description 'chop_wood'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

shared_scripts {
    'config.lua',
}

server_script {
	'server/server.lua',
}

client_script {
	'client/client.lua',
}