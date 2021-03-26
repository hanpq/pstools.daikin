BeforeAll {
    . (Resolve-Path -Path "$PSScriptRoot\..\..\source\public\Set-DaikinAirCon.ps1")

    function Convert-DaikinResponse {}
    Mock -CommandName Convert-DaikinResponse {
        [pscustomobject]@{
            ret = 'OK'
        }
    }
    Mock -CommandName Invoke-RestMethod {}
    
    function Get-DaikinControlInfo
    {
        $Hostname,
        $Raw
    }
    Mock -CommandName Get-DaikinControlInfo -MockWith {
        [pscustomobject]@{
            pow    = ''
            mode   = ''
            stemp  = ''
            shum   = ''
            f_rate = ''
            f_dir  = ''
        }
    }
}

Describe -Name 'Set-DaikinAirCon.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When setting mode' {
        BeforeAll {
        }
        It 'Should not throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -Mode Auto } | Should -Not -Throw
        }
    }
}
