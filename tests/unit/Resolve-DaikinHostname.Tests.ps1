BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\private\Resolve-DaikinHostname.ps1")
}

Describe -Name 'Resolve-DaikinHostname.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When calling with a valid IP address that responds' {
        BeforeAll {
            function Test-DaikinConnectivity {}
            Mock Test-DaikinConnectivity -MockWith { return $true }
        }
        It -Name 'It should not throw' -Test {
            { Resolve-DaikinHostname -Hostname '192.168.1.1' } | Should -Not -Throw
        }
        It -Name 'It should return 192.168.1.1' -Test {
            Resolve-DaikinHostname -HostName '192.168.1.1' | Should -Be '192.168.1.1'
        }
    }
    Context -Name 'When calling with a valid FQDN that responds' {
        BeforeAll {
            function Test-DaikinConnectivity {}
            Mock Test-DaikinConnectivity -MockWith { return $true }
            function internal_resolvednsname {}
            Mock internal_resolvednsname -MockWith {
                return '192.168.1.1'
            }
        }
        It -Name 'It should not throw' -Test {
            { Resolve-DaikinHostname -Hostname 'daikin.network.com' } | Should -Not -Throw
        }
        It -Name 'It should return 192.168.1.1' -Test {
            Resolve-DaikinHostname -HostName 'daikin.network.com' | Should -Be '192.168.1.1'
        }
    }
    Context -Name 'When calling with a valid FQDN but IP resolution fails' {
        BeforeAll {
            function Test-DaikinConnectivity {}
            Mock Test-DaikinConnectivity -MockWith { return $true }
            function internal_resolvednsname {}
            Mock internal_resolvednsname -MockWith { throw }
        }
        It -Name 'It should throw' -Test {
            { Resolve-DaikinHostname -Hostname 'daikin.network.com' } | Should -Throw
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
