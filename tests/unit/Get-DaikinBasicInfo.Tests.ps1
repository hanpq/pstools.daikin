BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\private\Get-DaikinBasicInfo.ps1")
}

Describe -Name 'Get-DaikinBasicInfo.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When retreival succeeds' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith {}
            function Convert-DaikinResponse {}
            Mock Convert-DaikinResponse -MockWith {return [ordered]@{}}
        }
        It -Name 'Should not throw' {
            { Get-DaikinBasicInfo -Hostname "daikin.network.com" } | should -not -throw
        }
    }
    Context -Name 'When Invoke-RestMethod fails' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith { throw }
        }
        It -Name 'Should throw' {
            { Get-DaikinBasicInfo -Hostname 'daikin.network.com' } | Should -throw
        }
    }
    Context -Name 'When Convert-DaikinResponse fails' {
        BeforeAll {
            function Convert-DaikinResponse {}
            Mock Convert-DaikinResponse -MockWith { throw }
        }
        It -Name 'Should throw' {
            { Get-DaikinBasicInfo -Hostname 'daikin.network.com' } | Should -throw
        }
    }
}
