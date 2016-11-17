Add-Type -Path Minecraft.Client.dll

[Decent.Minecraft.Client.JavaWorld]$world = $null

$defaultAddress = 'localhost'
$defaultPort = 4711

function Get-Minecraft {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$False)]
        [string]$address = $Script:defaultAddress,
        [Parameter(Mandatory=$False)]
        [int]$port = $Script:defaultPort
    )
    process {
        if(-Not ($address -eq $Script:defaultAddress -and $port -eq $Script:defaultPort)) {
            $newWorld = [Decent.Minecraft.Client.JavaWorld]::Connect($address, $port)
            if(-Not ($Script:world -eq $null)) {
                $Script:world.Dispose()
                $Script:world = $newWorld
            }
        }
        elseif($Script:world -eq $null) {
            $Script:world = [Decent.Minecraft.Client.JavaWorld]::Connect($address, $port)
        }
        return $Script:world
    }
}

function Send-ChatMessage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True)]
        [string]$text
    )
    process {
        $Script:world.PostToChat($text)
    }
}