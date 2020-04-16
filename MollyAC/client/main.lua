Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
            local jd = GetHashKey('xs_prop_hamburgher_wl')
            DeleteObject(jd)
        end
    end)


RegisterCommand('menu', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('memes', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('file', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('exec', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('pk', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('panic', function()
	TriggerServerEvent('klikanie')
end)

RegisterCommand('save', function()
	TriggerServerEvent('klikanie')
end)


