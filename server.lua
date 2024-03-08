ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterCommand('pedselect', 'admin', function(xPlayer, args, showError)
    local pedModel = args.model
    if not pedModel then
        showError('You must specify a ped model!')
        return
    end

    if xPlayer.getGroup() ~= 'admin' then
        showError('You do not have permission to use this command.')
        return
    end

    TriggerClientEvent('esx_pedselect:changePed', xPlayer.source, pedModel)
end, true, {help = 'Change your PED model', validate = true, arguments = {
    {name = 'model', help = 'The model name of the PED you want to change into', type = 'string'}
}})
