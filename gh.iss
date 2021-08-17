[Setup]
AppName=GitHub Cli
AppVersion=1.14.0
WizardStyle=modern
DefaultDirName={autopf}\Cli
PrivilegesRequiredOverridesAllowed=commandline dialog
Compression=lzma2
SolidCompression=yes
ArchitecturesInstallIn64BitMode=x64 arm64
ChangesEnvironment=true
SetupIconFile=github.ico
OutputBaseFilename=GitHub Cli Installer

[Tasks]
Name: modifypath; Description: &Add application directory to your environmental path; Flags: checkablealone

[Files]
; Uncomment for x64 build => Source: "gh-x64.exe"; DestDir: "{app}"; DestName: "gh.exe"; Check: InstallX64
; Uncomment for ARM64 build => Source: "gh-ARM64.exe"; DestDir: "{app}"; DestName: "gh.exe"; Check: InstallARM64; Flags: solidbreak
; Uncomment for 32 bit build => Source: "gh.exe"; DestDir: "{app}"; DestName: "gh.exe"; Check: InstallOtherArch; Flags: solidbreak

; Default for gh-installer demo (32bit)
Source: "gh.exe"; DestDir: "{app}"; DestName: "gh.exe"; Flags: solidbreak

[Code]
function InstallX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function InstallARM64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paARM64);
end;

function InstallOtherArch: Boolean;
begin
  Result := not InstallX64 and not InstallARM64;
end;
		const
			ModPathName = 'modifypath';

		function ModPathDir(): TArrayOfString;
		begin
			setArrayLength(Result, 1);
			Result[0] := ExpandConstant('{app}');
		end;
		#include "modpath.iss"
