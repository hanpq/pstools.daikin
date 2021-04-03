@{
  RootModule = 'pstools.daikin.psm1'
  ModuleVersion = '1.10.2'
  CompatiblePSEditions = @('Desktop','Core')
  GUID = '5588fcbe-895e-4578-b1c3-9948bc62c746'
  Author = 'Hannes Palmquist'
  CompanyName = ''
  Copyright = '(c) 2021 Hannes Palmquist. All rights reserved.'
  Description = 'Powershell Module to control a Daikin AirCon unit'
  RequiredModules = @()
  FunctionsToExport = @('Get-DaikinStatus','Set-DaikinAirCon')
  FileList = @('.\data\appicon.ico','.\data\banner.ps1','.\docs\pstools.daikin.md','.\en-US\Get-DaikinStatus.md','.\en-US\pstools.daikin-help.xml','.\en-US\Set-DaikinAirCon.md','.\include\module.utility.functions.ps1','.\private\Convert-DaikinResponse.ps1','.\private\Get-DaikinBasicInfo.ps1','.\private\Get-DaikinControlInfo.ps1','.\private\Get-DaikinModelInfo.ps1','.\private\Get-DaikinPollingConfiguration.ps1','.\private\Get-DaikinSensorInfo.ps1','.\private\Get-DaikinWeekStats.ps1','.\private\Get-DaikinYearStats.ps1','.\private\Resolve-DaikinHostname.ps1','.\private\Test-DaikinConnectivity.ps1','.\public\Get-DaikinStatus.ps1','.\public\Set-DaikinAirCon.ps1','.\settings\config.json','.\LICENSE.txt','.\pstools.daikin.psd1','.\pstools.daikin.psm1')
  PrivateData = @{
    ModuleName = 'pstools.daikin'
    DateCreated = '2020-10-03'
    LastBuildDate = '2021-04-03'
    PSData = @{
      Tags = @('PSEdition_Desktop','PSEdition_Core','Windows','Linux','MacOS')
      ProjectUri = 'https://getps.dev/modules/pstools.daikin/quickstart'
      LicenseUri = 'https://github.com/hanpq/pstools.daikin/blob/main/LICENSE'
      ReleaseNotes = 'https://github.com/hanpq/pstools.daikin/blob/main/changelog.json'
      IsPrerelease = 'False'
      IconUri = ''
      PreRelease = ''
      RequireLicenseAcceptance = $False
      ExternalModuleDependencies = @()
    }
  }
  CmdletsToExport = @()
  VariablesToExport = @()
  AliasesToExport = @()
  DscResourcesToExport = @()
  ModuleList = @()
  RequiredAssemblies = @()
  ScriptsToProcess = @()
  TypesToProcess = @()
  FormatsToProcess = @()
  NestedModules = @()
  HelpInfoURI = ''
  DefaultCommandPrefix = ''
  PowerShellVersion = '5.1'
  PowerShellHostName = ''
  PowerShellHostVersion = ''
  DotNetFrameworkVersion = ''
  CLRVersion = ''
  ProcessorArchitecture = ''
}



