BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\private\Resolve-DaikinHostname.ps1")
}

Describe -Name 'Resolve-DaikinHostname.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When calling with a valid FQDN that responds' {
        BeforeAll {
            function Test-DaikinConnectivity {}
            Mock Test-DaikinConnectivity -MockWith { return $true }
            Mock Test-Connection -MockWith {
                [pscustomobject]@{
                    IPV4Address = [pscustomobject]@{
                        IPAddressToString = '192.168.1.1'
                    }
                }
            }
        }
        It -Name 'It should not throw' {
            { Resolve-DaikinHostname -Hostname 'daikin.network.com' } | Should -Not -Throw
        }
        It -Name 'It should return 192.168.1.1' -Test {
            Resolve-DaikinHostname -HostName 'daikin.network.com' | Should -Be '192.168.1.1'
        }
    }
    Context -Name 'When calling with a valid FQDN that does not respond' {
        BeforeAll {
            function Test-DaikinConnectivity {}
            Mock Test-DaikinConnectivity -MockWith { return $false }
        }
        It -Name 'It should throw' {
            { Resolve-DaikinHostname -Hostname 'daikin.network.com' } | Should -Throw
        }
    }
}
