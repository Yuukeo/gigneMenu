GigneMenus = {}
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
	TriggerEvent('gigne:startMenu')
end)

RegisterNetEvent('gigne:registerMenu')
AddEventHandler('gigne:registerMenu', function( name, args )
	local key = 'gigne'
	if args.key then key = args.key end
	if name and args then
		if not GigneMenus[key] then GigneMenus[key] = {} end
		if GigneMenus[key][name] then
			print(('[gigneMenu] [^3WARNING^7] An menu "%s:%s" is already registered, overriding menu'):format(key, name))
		end
		GigneMenus[key][name] = {args = args}
	else
		print("syntax error: TriggerEvent('gigne:registerMenu', name, args)")
	end
end)

RegisterCommand('gigneMenu', function()
	gigneMenu('gigne')
end, false)

RegisterKeyMapping('gigneMenu', 'Show GiGNe Menu', 'keyboard', 'F5')

function gigneMenu(key, args)
	local MenuAlign, MenuTitle = 'top-left', 'Interaction Menu'
	local elements = {}
	if args then
		if args.align then MenuAlign = args.align end
		if args.title then MenuTitle = args.title end
	end
	for k,v in pairs(GigneMenus[key]) do
		if not v.args.job or v.args.job == ESX.PlayerData.job.name then
			table.insert(elements, v.args)
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gigneMenu_'..key, {
		title    = MenuTitle,
		align    = MenuAlign,
		elements = elements
	},
	function(data, menu)
		if data.current.event then
			TriggerEvent(data.current.event, data.current)
		elseif data.current.menu then
			gigneMenu(data.current.menu, data.current)
		end
	end,
	function(data, menu)
		menu.close()
	end)
end
