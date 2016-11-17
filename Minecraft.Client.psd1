@{

    RootModule = 'Minecraft.Client.psm1'

    ModuleVersion = '0.0.1.0'
    
    CompatiblePSEditions = @('Core')

    Author = 'Flosus'

    FunctionsToExport = 'Get-Minecraft', 'Send-ChatMessage'
}
