; Script do Inno Setup para o instalador do Drake (Versão Completa)
; Autor: Planincheck Informática

#define MyAppName "Drake"
#define MyAppVersion "1.4.9"
#define MyAppPublisher "Planincheck Informática"
#define MyAppURL "https://drake.planincheck.com.br"
#define MyAppExeName "drake.exe"

[Setup]
AppId={{D8A1E732-5201-4F4E-9A92-6C8E8F5A29B4}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Planincheck\Drake
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=dist
OutputBaseFilename=Drake_Setup
; SetupIconFile=res\icon.ico
Compression=lzma2/ultra64
SolidCompression=yes
WizardStyle=modern
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64

[Languages]
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "target\release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "res\sciter.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "res\icon.ico"; DestDir: "{app}"; Flags: ignoreversion
Source: "src\ui\*"; DestDir: "{app}\src\ui"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\icon.ico"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\icon.ico"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "--install-service"; StatusMsg: "Instalando o Serviço Drake..."; Flags: runhidden
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: postinstall nowait skipifsilent

[UninstallRun]
Filename: "{app}\{#MyAppExeName}"; Parameters: "--uninstall-service"; StatusMsg: "Removendo o Serviço Drake..."; Flags: runhidden
