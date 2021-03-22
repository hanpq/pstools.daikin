[Setup]
AppId={{ 5588fcbe-895e-4578-b1c3-9948bc62c746 }}
AppName=pstools.daikin
AppVersion=1.1
AppPublisher=
AppPublisherURL=
AppSupportURL=
AppUpdatesURL=
DefaultDirName={userdocs}\WindowsPowerShell\Modules\pstools.daikin
DisableDirPage=yes
DefaultGroupName=pstools.daikin
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=C:\Users\hanpalmq\OneDrive\DEV\Powershell\modules\pstools.daikin\release\1.1
OutputBaseFilename=pstools.daikin.1.1.Installer
Compression=lzma
SolidCompression=yes
WizardStyle=modern
Uninstallable=yes
SetupIconFile=C:\Users\hanpalmq\OneDrive\DEV\Powershell\modules\pstools.daikin\stage\pstools.daikin\1.1\data\appicon.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "C:\Users\hanpalmq\OneDrive\DEV\Powershell\modules\pstools.daikin\stage\pstools.daikin\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs skipifsourcedoesntexist

[Icons]
Name: "{userdesktop}\pstools.daikin"; Filename: "{sys}\WindowsPowerShell\v1.0\powershell.exe"; Parameters: "-executionpolicy bypass -noexit -noprofile -file ""{app}\1.1\data\banner.ps1"""; IconFilename: "{app}\1.1\data\AppIcon.ico"

[Run]
Filename: "Powershell.exe"; Parameters: "-executionpolicy bypass -noexit -noprofile -file ""{app}\1.1\data\banner.ps1"""; Description: "Run pstools.daikin"; Flags: postinstall nowait


