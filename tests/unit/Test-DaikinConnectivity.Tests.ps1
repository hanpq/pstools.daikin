BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\private\Test-DaikinConnectivity.ps1")
}

Describe -Name 'Test-DaikinConnectivity.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When able to connect to device' {
        BeforeAll {
            Mock Test-Connection -MockWith { return $true }
        }
        It -Name 'Should not throw' {
            { Test-DaikinConnectivity -Hostname 'daikin.network.com' } | Should -Not -Throw
        }
        It -Name 'Return true' {
            Test-DaikinConnectivity -Hostname 'daikin.network.com' | Should -BeTrue
        }
    }
    Context -Name 'When unable to connect to device' {
        BeforeAll {
            Mock Test-Connection -MockWith { return $false }
        }
        It -Name 'Should not throw' {
            { Test-DaikinConnectivity -Hostname 'daikin.network.com' } | Should -Not -Throw
        }
        It -Name 'Return false' {
            Test-DaikinConnectivity -Hostname 'daikin.network.com' | Should -BeFalse
        }
    }
    Context -Name 'When Test-NetConnection throws' {
        BeforeAll {
            Mock Test-Connection -MockWith { throw }
        }
        It -Name 'Should not throw' {
            { Test-DaikinConnectivity -Hostname 'daikin.network.com' } | Should -Throw
        }
    }
}
