ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)






-- Menu --
local open = false
local main = RageUI.CreateMenu("Limitateur", "Intéractions disponibles")
local Confirmation = RageUI.CreateSubMenu(main, "Limitateur", "Intéractions disponibles")
main.Display.Header = true
main.Closed = function()
    open = false
end
local ped = PlayerPedId()




function OpenMenuLimit() 
    if open then 
        open = false
        RageUI.Visible(main, false)
        return
    else
        open = true
        RageUI.Visible(main, true)
        CreateThread(function()
            while open do 
                RageUI.IsVisible(main, function()
                    Limitateur = false

                        if Limitateur == false then 
                            Yazz = 3.6 
                        else
                            Yazz = 2.237
                        end

                        
                        
                    RageUI.Separator("Etat du Moteur: ~b~".. math.floor(0.11*GetVehicleEngineHealth(GetVehiclePedIsIn(PlayerPedId(), false))-10).."%")
                    RageUI.Button("Réinitialiser", nil, {Color = {BackgroundColor = {255, 0, 0, 50}}, RightLabel = "→→→"}, true , {
                        onSelected = function()
                            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), 1000.0/Yazz)
                            ESX.ShowNotification("~r~Attention~s~ \nVous avez enlevé la limite de vitesse")
                        end
                    })

                    RageUI.Button("Vitesse :~g~ 50 KM/H", nil, { RightLabel = "→"}, true , {
                        onSelected = function()
                            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), 50.0/Yazz)
                            ESX.ShowNotification("~r~Attention~s~ \nVous avez limité la vitesse à 50 KM/H")
                        end
                    })

                    RageUI.Button("Vitesse :~g~ 80 KM/H", nil, { RightLabel = "→"}, true , {
                        onSelected = function()
                            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), 80.0/Yazz)
                            ESX.ShowNotification("~r~Attention~s~ \nVous avez limité la vitesse à 80 KM/H")
                        end
                    })

                    RageUI.Button("Vitesse :~g~ 120 KM/H", nil, { RightLabel = "→"}, true , {
                        onSelected = function()
                            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), 120.0/Yazz)
                        ESX.ShowNotification("~r~Attention~s~ \nVous avez limité la vitesse à 120 KM/H")
                        end
                    })
                    RageUI.Button("Vitesse :~g~ 180 KM/H", nil, { RightLabel = "→"}, true , {
                        onSelected = function()
                            SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), 180.0/Yazz)
                        ESX.ShowNotification("~r~Attention~s~ \nVous avez limité la vitesse à 180 KM/H")
                        end
                    })
                    RageUI.Button("Personnaliser", nil, { RightLabel = "→→"}, true , {
                        onSelected = function()

                        limitateur = KeyboardInput("Limitateur : ", "Limitateur : ", "", 5)

                        SetEntityMaxSpeed(GetVehiclePedIsIn(ped, false), limitateur/Yazz)

                        ESX.ShowNotification('~r~Attention~s~ \nVous avez limité la vitesse à  ' ..limitateur.. 'KM/H')
                        end
                    })
                
                end)
                

            Wait(0)
            end
        end)
    end
end








RegisterCommand("limit", function()
    
    if IsPedSittingInAnyVehicle(PlayerPedId()) then

    OpenMenuLimit()
    else
        ESX.ShowNotification("~r~Il faut être dans un vehicule")
    end

end, false)