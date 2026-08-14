; Script do Inno Setup para o instalador do Drake PASSIVO (Cliente - Apenas Conexões de Entrada)
; Autor: Planincheck Informática

#define MyAppName "Drake - Suporte Remoto Planincheck"
#define MyAppShortName "Drake Suporte"
#define MyAppVersion "1.4.9"
#define MyAppPublisher "Planincheck Informática"
#define MyAppURL "https://drake.planincheck.com.br"
#define MyAppExeName "drake.exe"

[Setup]
AppId={{E9B2F843-6312-4C5F-AA03-7D9F0E6B30C5}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\Planincheck\Drake
DefaultGroupName={#MyAppShortName}
AllowNoIcons=yes
OutputDir=dist
OutputBaseFilename=Drake_Passivo_Setup
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
Name: "desktopicon"; Description: "Criar atalho na Área de Trabalho (Drake Suporte)"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "target\release\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "res\sciter.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "res\icon.ico"; DestDir: "{app}"; Flags: ignoreversion

[Registry]
; Configurações no Registro para forçar Modo Passivo / Apenas Receber Conexões
Root: HKLM; Subkey: "Software\Planincheck\Drake"; ValueType: string; ValueName: "Mode"; ValueData: "Passive"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Planincheck\Drake"; ValueType: string; ValueName: "AllowControl"; ValueData: "0"
Root: HKLM; Subkey: "Software\Planincheck\Drake"; ValueType: string; ValueName: "ServerID"; ValueData: "drake.planincheck.com.br"
Root: HKLM; Subkey: "Software\Planincheck\Drake"; ValueType: string; ValueName: "ServerRelay"; ValueData: "drake.planincheck.com.br"
Root: HKLM; Subkey: "Software\Planincheck\Drake"; ValueType: string; ValueName: "ServerAPI"; ValueData: "https://drake.planincheck.com.br"
Root: HKLM; Subkey: "Software\Planincheck\Drake"; ValueType: string; ValueName: "Key"; ValueData: "XGNzMP6jul7+fVuE8W4Qjeaef0T8VBwyoofgBnz9yKc="

[Icons]
Name: "{group}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\icon.ico"; Parameters: "--passive"
Name: "{autodesktop}\{#MyAppShortName}"; Filename: "{app}\{#MyAppExeName}"; IconFilename: "{app}\icon.ico"; Parameters: "--passive"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Parameters: "--install-service"; StatusMsg: "Instalando o Serviço Drake..."; Flags: runhidden
Filename: "{app}\{#MyAppExeName}"; Parameters: "--passive"; Description: "Iniciar {#MyAppShortName}"; Flags: postinstall nowait skipifsilent

[UninstallRun]
Filename: "{app}\{#MyAppExeName}"; Parameters: "--uninstall-service"; StatusMsg: "Removendo o Serviço Drake..."; Flags: runhidden
