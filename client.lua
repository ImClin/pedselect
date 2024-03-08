RegisterNetEvent('esx_pedselect:changePed')
AddEventHandler('esx_pedselect:changePed', function(pedModel)
    local model = GetHashKey(pedModel)

    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(1)
        end

        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"System", "Invalid PED model!"}
        })
    end
end)
