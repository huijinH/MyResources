#define MyAppName "GinkgoOne"
#define MyAppVersion "1.1.5"
#define MyAppPublisher "viewtool"
#define MyAppURL "http://www.viewtool.com/"
#define MyAppExeNameEn "GinkgoOne_En.exe"
#define MyAppExeName "GinkgoOne.exe"
#define MyAppDispName "GinkgoOne"
#define MyAppOutputName "GinkgoOne_Setup_v1.1.5"
[Setup]
; 注: AppId的值为单独标识该应用程序。
; 不要为其他安装程序使用相同的AppId值。
; (生成新的GUID，点击 工具|在IDE中生成GUID。)
AppId={{810FFF08-63DF-4B70-9417-F79DAD25FB39}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
VersionInfoVersion=1.1.5
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppPublisher}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputDir=Output
OutputBaseFilename={#MyAppOutputName}
SetupIconFile=GinkgoOne.ico
Compression=lzma
SolidCompression=yes
ShowLanguageDialog=yes
ArchitecturesInstallIn64BitMode=x64 ia64

[Languages]
Name: "english"; MessagesFile: "compiler:Languages\EnglishBritish.isl"
Name: "chinesesimp"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked;

[Files]
Source: "*.dll"; DestDir: "{app}"; 
Source: "*.exe"; DestDir: "{app}";
Source: "Ginkgo_Bootloader\*"; DestDir: "{app}\Ginkgo_Bootloader";       Flags:   ignoreversion   Recursesubdirs
Source: "Ginkgo_USB-CAN_Extend\*"; DestDir: "{app}\Ginkgo_USB-CAN_Extend";       Flags:   ignoreversion   Recursesubdirs
Source: "Ginkgo_USB-I2C_Extend\*"; DestDir:   "{app}\Ginkgo_USB-I2C_Extend";           Flags:   ignoreversion   Recursesubdirs
Source: "Ginkgo_USB-SPI_Extend\*"; DestDir:   "{app}\Ginkgo_USB-SPI_Extend";           Flags:   ignoreversion   Recursesubdirs
Source: "Ginkgo_1-Wire\*"; DestDir:   "{app}\Ginkgo_1-Wire";           Flags:   ignoreversion   Recursesubdirs
Source: "bearer\*"; DestDir:   "{app}\bearer";                            Flags:   ignoreversion   Recursesubdirs
Source: "iconengines\*"; DestDir:   "{app}\iconengines";                    Flags:   ignoreversion   Recursesubdirs
Source: "imageformats\*"; DestDir:   "{app}\imageformats";                Flags:   ignoreversion   Recursesubdirs
Source: "platforms\*"; DestDir:   "{app}\platforms";                      Flags:   ignoreversion   Recursesubdirs
Source: "position\*"; DestDir:   "{app}\position";                        Flags:   ignoreversion   Recursesubdirs
Source: "printsupport\*"; DestDir:   "{app}\printsupport";                 Flags:   ignoreversion   Recursesubdirs
Source: "resources\*"; DestDir:   "{app}\resources";                       Flags:   ignoreversion   Recursesubdirs
Source: "translations\*"; DestDir:   "{app}\translations";           Flags:   ignoreversion   Recursesubdirs
Source: "html\*"; DestDir:   "{app}\html";                           Flags:   ignoreversion   Recursesubdirs    
Source: "js\*"; DestDir:   "{app}\js";                              Flags:   ignoreversion   Recursesubdirs
Source: "resource\*"; DestDir:   "{app}\resource";                 Flags:   ignoreversion   Recursesubdirs
Source: "Driver\*"; DestDir:   "{app}\Driver";     Flags:   ignoreversion   Recursesubdirs    
Source: "python_file\*"; DestDir:   "{app}\python_file";     Flags:   ignoreversion   Recursesubdirs  
; Visual C++ redist
;Source: "VC_redist.x64.exe"; DestDir: "{tmp}";
; 注意: 不要在任何共享系统文件上使用“Flags: ignoreversion”

[Icons]
Name: "{group}\{#MyAppDispName}"; Filename: "{app}\{#MyAppExeNameEn}";Languages:english;WorkingDir: "{app}" 
Name: "{group}\{#MyAppDispName}"; Filename: "{app}\{#MyAppExeName}";Languages:chinesesimp;WorkingDir: "{app}" 
Name: "{commondesktop}\{#MyAppDispName}"; Filename: "{app}\{#MyAppExeName}";Languages:chinesesimp;Tasks: desktopicon;WorkingDir: "{app}" 
Name: "{commondesktop}\{#MyAppDispName}"; Filename: "{app}\{#MyAppExeNameEn}";Languages:english;Tasks: desktopicon;WorkingDir: "{app}" 
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppDispName}}"; Filename: "{#MyAppURL}"

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Languages:chinesesimp;Flags: nowait postinstall skipifsilent
Filename: "{app}\{#MyAppExeNameEn}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Languages:english;Flags: nowait postinstall skipifsilent
;静默安装VC_redist.x64.exe
;Filename: {app}\VC_redist.x64.exe; Parameters: /q; WorkingDir: {tmp}; Flags: skipifdoesntexist; StatusMsg: "Installing Microsoft Visual C++ Runtime ..."


[Code]
function InitializeSetup(): boolean;  
var  
  ResultStr: String;  
  ResultCode: Integer;  
begin  
  if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{810FFF08-63DF-4B70-9417-F79DAD25FB39}_is1', 'UninstallString', ResultStr) then  
    begin  
      ResultStr := RemoveQuotes(ResultStr);  
      Exec(ResultStr, '/silent', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);  
    end;  
    result := true;  
end;
function IsX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;
function IsIA64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;
function IsOtherArch: Boolean;
begin
  Result := not IsX64 and not IsIA64;
end;