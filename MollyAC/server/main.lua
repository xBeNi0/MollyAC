local webhook = 'https://discordapp.com/api/webhooks/700252003997057104/g9gaEsYnTLJqnzOahXgjmMJh62HySykO1WFR0odglx4yUxs_Yj1CJ8Y-WyLQdEPVwu3o'

local blocked = {
  'esx_banksecurity',
  'esx_airlines:pay',
  'esx_garbagejob:pay',
  'esx_vehicleshop:putStockItems',
  'esx_truckerjob:pay',
  'vrp_slotmachine:server:2',
  'esx_jobs:caution',
  'esx_vehicletrunk:giveDirty',
  'gambling:spend',
  'AdminMenu:giveCash',
  'esx_slotmachine:sv:2',
  'esx_moneywash:deposit',
  'esx_moneywash:withdraw',
  'esx_status:set',
  'esx:spawnVehicle',
  'esx:teleport',
  'esx_skin:openSaveableMenu',
  'esx_policejob:giveWeapon',
  'esx_society:openBossMenu',
  'esx_slotmachine:sv:2',
  'paycheck:salary',

}

for i=1, #blocked, 1 do
    RegisterServerEvent(blocked[i])
    AddEventHandler(blocked[i], function()
        local _source = source
        DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
    end)
end

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)


--]]



local verFile = LoadResourceFile(GetCurrentResourceName(), "vv.json")
local curVersion = json.decode(verFile).version
Citizen.CreateThread( function()
    local updatePath = "d"
    local resourceName = "MollyAC"
    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/vv.json", function(err, response, headers)
        local data = json.decode(response)
        local updated = {
        {
            ["color"] = "14418175",
            ["title"] = "**MollyAC Wystartowal**",
            ["description"] = "MollyAC **Wystartowal**\n Zmiany: " .. data.changelog .."",
            ["footer"] = {
                ["text"] = "Aktualna wersja: "..curVersion.."",
            },
        }
    }

            local notupdated = {
        {
            ["color"] = "15158332",
            ["title"] = "MollyAC Niewystartowal",
            ["description"] = "MollyAC niewystartowal\n Zmiany: " .. data.changelog .." \nAktualna wersja "..curVersion.."\n Update wersja: "..data.version.." Napisz do Frosherowski#3600 o nowe pliki!",
            ["footer"] = {
                ["text"] = "!!!",
            },
        }
    }
            local toohigh = {
        {
            ["color"] = "15158332",
            ["title"] = "MollyAC Niewystartowal",
            ["description"] = "MollyAC niewystartowal\n **WYKRYTO PROBE WYKRADNIECIA NOWSZEJ WERSJI NIZ JEST DOSTEPNA**\n DOSTEPNA WERSJA TO: "..data.version.."\nPOSIADANA WERSJA PRZEZ CIEBIE: "..curVersion.."",
            ["footer"] = {
                ["text"] = "!!!",
            },
        }
    }        
        

        if curVersion ~= data.version and tonumber(curVersion) < tonumber(data.version) then
            print("\n--------------------------------------------------------------------------")
            print("\n"..resourceName.." nieaktualny.\nAktualna wersja: "..data.version.."\nTwoja wersja: "..curVersion.."\nUpdate ready")
            print("\nUpdate Changelog:\n--------------------------------------------------------------------------\n"..data.changelog)
            print("--------------------------------------------------------------------------")
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = notupdated}), { ['Content-Type'] = 'application/json' }) 
        elseif tonumber(curVersion) > tonumber(data.version) then
            print("Your version of "..resourceName..", skad masz taka wysoka wersje skoro nie jest nawet wydana?.")
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = toohigh}), { ['Content-Type'] = 'application/json' }) 
        else
        	print(' ')
			print(' ')
            print("\n===============================================================")
            print(resourceName.." jest aktualny! \nChangelog: "..data.changelog)    
			print('===============================================================')
			print(' ')
			print(' ')
            PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = updated}), { ['Content-Type'] = 'application/json' }) 
        end
    end, "GET", "", {version = 'this'})
end)

-- Wyspa jail

RegisterServerEvent('wyspa_jail:SendMessage')
AddEventHandler('wyspa_jail:SendMessage', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal zjailowac/wyslac mandat",
            ["description"] = "Gracz: **"..name.."**\nIP: **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "hehe",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

RegisterServerEvent('wyspa_jail:getKartoteka')
AddEventHandler('wyspa_jail:getKartoteka', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal zjailowac/wyslac mandat",
            ["description"] = "Gracz: **"..name.."**\nIP: **"..ip.."**\n hex: **"..steamhex.."**",
            ["footer"] = {
                ["text"] = "hehe",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

RegisterServerEvent('wyspa_jail:addKartoteka')
AddEventHandler('wyspa_jail:addKartoteka', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal zjailowac/wyslac mandat",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

RegisterServerEvent('esx_jailer:sendToJail132')
AddEventHandler('esx_jailer:sendToJail132', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal zjailowac/wyslac mandat",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)


-- Revowanie

RegisterServerEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal sie zrevowac cheatami",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

-- SIANO

RegisterServerEvent('\101\115\120\95\97\105\114\108\105\110\101\115\58\112\97\121')
AddEventHandler('\101\115\120\95\97\105\114\108\105\110\101\115\58\112\97\121', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal prawdopodobnie zcheatowac pieniadze",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

RegisterServerEvent('\101\115\120\95\103\97\114\98\97\103\101\106\111\98\58\112\97\121')
AddEventHandler('\101\115\120\95\103\97\114\98\97\103\101\106\111\98\58\112\97\121', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal prawdopodobnie zcheatowac pieniadze",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

-- Fakturki

RegisterServerEvent('\101\115\120\95\98\105\108\108\105\110\103\58\115\101\110\100\66\105\108\108')
AddEventHandler('\101\115\120\95\98\105\108\108\105\110\103\58\115\101\110\100\66\105\108\108', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal wyslac fakture",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

-- JAILOWANIE

RegisterServerEvent('\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108')
AddEventHandler('\101\115\120\95\106\97\105\108\101\114\58\115\101\110\100\84\111\74\97\105\108', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal wsadzic wszystkich do wiezienia",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

-- Policejob

RegisterServerEvent('\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102')
AddEventHandler('\101\115\120\95\112\111\108\105\99\101\106\111\98\58\104\97\110\100\99\117\102\102', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal kogos zakuc z cheatami",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

-- EXPLOSIONS TYLKO DLA ONE SYNCA 

RegisterServerEvent('explosionEvent')
AddEventHandler('explosionEvent', function(sender, ev) -- Anty eksplosja  onesync only
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal uzywac eksplozji",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

-- DRUGI JEBANE



RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal cheatowac narkotyki",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal cheatowac narkotyki",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)


RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()
local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Gracz probowal cheatowac narkotyki",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' }) -- Discord webhooka zmiencie oraz username jezeli chcecie
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)

--]]

RegisterServerEvent('explosionEvent')
AddEventHandler('explosionEvent', function(sender, ev) -- Anti explode tylko na onesync
    CancelEvent()
end)

AddEventHandler('esx_inventoryhud:openPlayerInventory', function()
	DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)


local blacklisted = 
    {
        "/ooc kogusz menu! Buy at https://discord.gg/BbDMhJe",
        "/ooc Baggy Menu! Buy at https://discord.gg/AGxGDzg",
        "/ooc Desudo Menu! Buy at https://discord.gg/hkZgrv3",
        "/ooc Yo add me Fallen#0811",
        "/ooc \107\111\103\117\115\122\10 menu! Buy at https://discord.gg/BM5zTvA",
        "BAGGY menu <3 https://discord.gg/AGxGDzg",
        "KoGuSzMENU <3 https://discord.gg/BbDMhJe",
        "KoGuSzMENU <3 https://discord.gg/BM5zTvA",
        "Desudo menu <3 https://discord.gg/hkZgrv3",
        "Yo add me Fallen#0811",
        "Lynx 8 ~ www.lynxmenu.com",
        "Lynx 7 ~ www.lynxmenu.com",
        "lynxmenu.com",
        "www.lynxmenu.com",
        "You got raped by Lynx 8",
        "^0Lynx 8 ~ www.lynxmenu.com",
        "^0AlphaV ~ 5391",
        "^0You got raped by AlphaV",
        "^0TITO MODZ - Cheats and Anti-Cheat",
        "^0https://discord.gg/AGxGDzg",
        "^0https://discord.gg/hkZgrv3",
        "You just got fucked mate",
        "Add me Fallen#0811",
        "Desudo; Plane#000",
        "BAGGY; baggy#6875"
    }

AddEventHandler('chatMessage', function(source, name, message)
	for i , word in ipairs(blacklisted) do
    if string.match(message, word) then
        local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "Uzyl slowa z blacklisty",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' })
		DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
        CancelEvent()
        end
    end
end)




-- INSERT BLOCK



RegisterServerEvent("klikanie")
AddEventHandler("klikanie", function()


local name = GetPlayerName(source) -- nick
local ip = GetPlayerEndpoint(source) -- ip chwilowo nie dziala
local steamhex = GetPlayerIdentifier(source) -- hex
local id = GetPlayerLastMsg(source)
local connect = {
        {
            ["color"] = "16711680",
            ["title"] = "--> "..name.." dotknal inserta lub uzyl zakazanej komendy",
            ["description"] = "Gracz: **"..name.."**",
            ["footer"] = {
                ["text"] = "IP: "..ip.." steamhex: "..steamhex.."",
            },
        }
    }

PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "MollyAC", embeds = connect}), { ['Content-Type'] = 'application/json' })
DropPlayer(source, 'MollyAC: Wykryto podejrzane dzialanie')
end)



AddEventHandler('playerConnecting', function(user,  setKickReason, deferrals)
    deferrals.defer()
    deferrals.update('SPAM CHECK: 5')
    Wait(1000)
    deferrals.update('SPAM CHECK: 4')
    Wait(1000)
    deferrals.update('SPAM CHECK: 3')
    Wait(1000)
    deferrals.update('SPAM CHECK: 2')
    Wait(1000)
    deferrals.update('SPAM CHECK: 1')
    Wait(1000)
    deferrals.update('SPAM CHECK: 0')
    deferrals.done()
end)