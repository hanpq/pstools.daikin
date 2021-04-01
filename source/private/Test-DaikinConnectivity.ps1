<#PSScriptInfo
    .VERSION 1.0.0.0
    .GUID 1af893cc-b4cb-4c01-869e-d5b1b004ffb3
    .FILENAME Test-DaikinConnectivity.ps1
    .AUTHOR Hannes Palmquist
    .AUTHOREMAIL hannes.palmquist@outlook.com
    .CREATEDDATE 2020-10-04
    .COMPANYNAME Personal
    .COPYRIGHT (c) 2020, Hannes Palmquist, All Rights Reserved
#>
function Test-DaikinConnectivity
{
    <#
    .DESCRIPTION
        Function tests connection to specified target
    .PARAMETER Hostname
        IP or FQDN for device
    .EXAMPLE
        Test-DaikinConnectivity -Hostname daikin.network.com
        Returns true or false depending on if the device responds
    #>

    [CmdletBinding()] # Enabled advanced function support
    param(
        [Parameter(Mandatory)]$Hostname
    )

    PROCESS
    {
        $SavedProgressPreference = $global:ProgressPreference
        $global:ProgressPreference = 'SilentlyContinue'
        try
        {
            if (Test-Connection -ComputerName $Hostname -Quiet -WarningAction SilentlyContinue)
            {
                return $true
            }
            else
            {
                return $false
            }
        }
        catch
        {
            throw "Failed to check status of daikin device with error: $PSItem"
        }
        finally
        {
            $global:ProgressPreference = $SavedProgressPreference
        }
    }

}
#endregion


