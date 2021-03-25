BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\private\Get-DaikinModelInfo.ps1")
}

Describe -Name 'Get-DaikinModelInfo.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When retreival succeeds' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith {}
            function Convert-DaikinResponse {}
            Mock Convert-DaikinResponse -MockWith { return [ordered]@{} }
        }
        It -Name 'Should not throw' {
            { Get-DaikinModelInfo -Hostname 'daikin.network.com' } | Should -Not -Throw
        }
    }
    Context -Name 'When Invoke-RestMethod fails' {
        BeforeAll {
            Mock Invoke-RestMethod -MockWith { throw }
        }
        It -Name 'Should throw' {
            { Get-DaikinModelInfo -Hostname 'daikin.network.com' } | Should -Throw
        }
    }
    Context -Name 'When Convert-DaikinResponse fails' {
        BeforeAll {
            function Convert-DaikinResponse {}
            Mock Convert-DaikinResponse -MockWith { throw }
        }
        It -Name 'Should throw' {
            { Get-DaikinModelInfo -Hostname 'daikin.network.com' } | Should -Throw
        }
    }
}
