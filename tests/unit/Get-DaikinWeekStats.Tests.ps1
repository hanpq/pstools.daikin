BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\private\Get-DaikinWeekStats.ps1")
}

Describe -Name 'Get-DaikinWeekStats.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When retreival succeeds' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith {}
            function Convert-DaikinResponse {}
            Mock Convert-DaikinResponse -MockWith { return [ordered]@{} }
        }
        It -Name 'Should not throw' {
            { Get-DaikinWeekStats -Hostname 'daikin.network.com' } | Should -Not -Throw
        }
    }
    Context -Name 'When Invoke-RestMethod fails' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith { throw }
        }
        It -Name 'Should throw' {
            { Get-DaikinWeekStats -Hostname 'daikin.network.com' } | Should -Throw
        }
    }
    Context -Name 'When Convert-DaikinResponse fails' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith {}
            function Convert-DaikinResponse {}
            Mock Convert-DaikinResponse -MockWith { throw }
        }
        It -Name 'Should throw' {
            { Get-DaikinWeekStats -Hostname 'daikin.network.com' } | Should -Throw
        }
    }
}
