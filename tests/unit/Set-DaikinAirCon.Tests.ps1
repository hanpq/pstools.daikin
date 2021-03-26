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
            pow    = $true
            mode   = 1
            stemp  = 22
            shum   = 22
            f_rate = 'Level_1'
            f_dir  = 'VerticalSwing'
        }
    }
    Mock Write-Host -MockWith {}
}

Describe -Name 'Set-DaikinAirCon.ps1' -Fixture {
    BeforeAll {
    }
    Context -Name 'When setting mode' {
        It 'Should not throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -Mode Auto } | Should -Not -Throw
        }
    }
    Context -Name 'When setting Temp' {
        It 'Should not throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -Temp 22 } | Should -Not -Throw
        }
    }
    Context -Name 'When setting PowerOn' {
        It 'Should not throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -PowerOn:$true } | Should -Not -Throw
        }
    }
    Context -Name 'When setting FanSpeed' {
        It 'Should not throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -FanSpeed AUTO } | Should -Not -Throw
        }
    }
    Context -Name 'When setting FanDirection' {
        It 'Should not throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -FanDirection HorizontalSwing } | Should -Not -Throw
        }
    }
    Context -Name 'When configuration fails with non OK response' {
        BeforeAll {
            function Convert-DaikinResponse {}
            Mock -CommandName Convert-DaikinResponse {
                [pscustomobject]@{
                    ret = 'PARAM NG'
                }
            }
        }
        It 'Should throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -Mode Auto } | Should -Throw
        }
    }
    Context -Name 'When stemp or shum is "--"' {
        BeforeAll {
            function Get-DaikinControlInfo
            {
                $Hostname,
                $Raw
            }
            Mock -CommandName Get-DaikinControlInfo -MockWith {
                [pscustomobject]@{
                    pow    = $true
                    mode   = 1
                    stemp  = '--'
                    shum   = '--'
                    f_rate = 'Level_1'
                    f_dir  = 'VerticalSwing'
                }
            }
        }
        It 'Should throw' {
            { Set-DaikinAirCon -HostName 'daikin.contoso.com' -Mode Auto } | Should -Not -Throw
        }
    }

}
