RegisterCommand('sport', function(source)
	TriggerEvent('police:sport')
end)

RegisterKeyMapping('sport', '[Police] Toggle Sport Mode', 'keyboard', '' )

local sport = false
RegisterNetEvent("police:sport")
AddEventHandler("police:sport",function()
	if (IsPedInAnyVehicle(PlayerPedId(), false)) then
		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		local Driver = GetPedInVehicleSeat(veh, -1)
		local polcar = "INSERT POLICE CAR HERE" -- Insert the spawn name of the car

		if Driver == PlayerPedId() then
			if IsVehicleModel( veh, polcar ) then
			local fInitialDriveForce = GetVehicleHandlingFloat(veh, 'CHandlingData', 'fInitialDriveForce')
			if fInitialDriveForce < 0.31 then
				TriggerEvent("DoLongHudText", "Sports Mode Enabled",1)
				sport = true
				SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', 0.5200000)
				SetVehicleHandlingField(veh, 'CHandlingData', 'fDriveInertia', 0.3500000)
			else
				TriggerEvent("DoLongHudText", "Sports Mode Disabled",1)
				sport = false
				SetVehicleHandlingField(veh, 'CHandlingData', 'fInitialDriveForce', 0.305000)
				SetVehicleHandlingField(veh, 'CHandlingData', 'fDriveInertia', 0.850000)
			end
		else
			TriggerEvent("DoLongHudText", "This vehicle has none of this feature",2)
		end
		else
			if sport then
				sport = false
			end
		end
	end
end)