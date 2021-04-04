<#PSScriptInfo
{
    "VERSION":  "1.0.0.0",
    "GUID":  "c7cde592-51c5-4ee3-8ab4-ac50689629af",
    "FILENAME":  "Resolve-DaikinHostname.ps1",
    "AUTHOR":  "Hannes Palmquist",
    "AUTHOREMAIL":  "hannes.palmquist@outlook.com",
    "CREATEDDATE":  "2020-10-04",
    "COMPANYNAME":  "Personal",
    "COPYRIGHT":  "(c) 2020, Hannes Palmquist, All Rights Reserved"
}
PSScriptInfo#>
function Resolve-DaikinHostname
{
    <#
    .DESCRIPTION
        Resolves the IP address if hostname is specified as FQDN/Hostname
    .PARAMETER Hostname
        IP or FQDN for device
    .EXAMPLE
        Resolve-DaikinHostname -Hostname daikin.network.com
        Returns the IP address of the target device
    #>

    [CmdletBinding()] # Enabled advanced function support
    param(
        [Parameter(Mandatory)]$Hostname
    )
    BEGIN
    {
        function internal_resolvednsname 
        {
            param
            (
                $hostname
            )
            <#
                Test-Connection is disqualified because the returned property name for the 
                IP address in Test-Connection are different depending on Powershell edition. Which meant 
                that the function had to check for edition before retreiving the value. And in turn would 
                never fulfill complete code coverage tests.

                Resolve-DNSName is disqualified because it is not available on Linux and MacOS.

                Resorted to .NET class System.Net.Dns and the method GetHostEntry which works on all editions and platforms.

                The operation is separated in a internal function to allow unit test mocks

            #>
            return [System.Net.Dns]::GetHostEntry($hostname).AddressList.Where( { $_.AddressFamily -eq 'InterNetwork' })[0].IPAddressToString
        }
    }

    PROCESS
    {
        $SavedProgressPreference = $global:progresspreference
        $Global:ProgressPreference = 'SilentlyContinue'
        try
        {
            if (Test-DaikinConnectivity -HostName:$Hostname)
            {
                if ($Hostname -match '(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)')
                {
                    return $hostname
                }
                else 
                {
                    try 
                    {
                        return (internal_resolvednsname -hostname $hostname)
                    }
                    catch
                    {
                        throw "Failed to resolve hostname $hostname to IP address with error: $PSItem"
                    }
                }
            }
            else
            {
                throw 'Device does not respond'
            }
        }
        catch
        {
            throw "Failed to resolve IP address of hostname with error: $PSItem"
        }
        finally
        {
            $global:ProgressPreference = $SavedProgressPreference
        }
    }
}
#endregion


