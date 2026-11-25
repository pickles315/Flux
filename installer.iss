#ifndef AppVersion
  #define AppVersion "1.0"
#endif
#define AppName "Flux"
#define AppExeName "Flux.exe"
#define AppId "{{7E5B6D41-9D5F-4B11-A5E4-0A7C4D1B6F22}"

[Setup]
AppId={#AppId}
AppName={#AppName}
AppVersion={#AppVersion}
AppPublisher=Flux
DefaultDirName={localappdata}\Programs\Flux
DefaultGroupName=Flux
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
OutputDir=dist
OutputBaseFilename=Flux-Setup-{#AppVersion}
UninstallDisplayName=Flux
ArchitecturesInstallIn64BitMode=x64
WizardStyle=modern
Compression=lzma2
SolidCompression=yes
CloseApplications=yes
RestartApplications=no
Uninstallable=yes
UsePreviousAppDir=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Create a desktop shortcut"; GroupDescription: "Additional shortcuts:"; Flags: unchecked

[Files]
Source: "dist\win-unpacked\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\Flux"; Filename: "{app}\Flux.exe"
Name: "{autodesktop}\Flux"; Filename: "{app}\Flux.exe"; Tasks: desktopicon

[Code]
function InitializeSetup(): Boolean;
var
  UninstallString: String;
begin
  Result := True;
  if RegQueryStringValue(HKCU, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{#AppId}_is1', 'UninstallString', UninstallString) then
  begin
    Result := MsgBox('An older version of Flux is already installed.' + #13#10 + #13#10 +
      'Continue? The installer will replace the old application version while keeping your local projects and media.', mbConfirmation, MB_YESNO) = IDYES;
  end;
end;

[Run]
Filename: "{app}\Flux.exe"; Description: "Launch Flux"; Flags: postinstall nowait skipifsilent
