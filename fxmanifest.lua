fx_version 'bodacious'
game 'gta5'

author 'Anonymous#0696'
version '1.0.0'

server_script { 
    '@oxmysql/lib/MySQL.lua',
    'server_l.lua',
    'server.js'
}
shared_script '@es_extended/imports.lua'

server_export {
    'getadm',
}
