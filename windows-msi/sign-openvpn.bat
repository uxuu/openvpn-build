@echo off

rem This script digitally signs openvpn-build outputs.
rem
rem Set `%ManifestTimestampRFC3161Url%` to URL of your code signing cerificate provider's
rem RFC3161-compliant web service.
rem
rem Run this script before packaging.

signtool.exe sign /sha1 "%ManifestCertificateThumbprint%" /fd sha256 /tr "%ManifestTimestampRFC3161Url%" /td sha256 ^
 ..\..\openvpn\out\build\win-%SignArch%-release\Release\openvpn.exe^
 ..\..\openvpn\out\build\win-%SignArch%-release\Release\lib*.dll^
 ..\..\openvpn\out\build\win-%SignArch%-release\src\openvpnmsica\Release\*.dll^
 ..\..\openvpn\out\build\win-%SignArch%-release\src\openvpnserv\Release\*.exe^
 ..\..\openvpn\out\build\win-%SignArch%-release\src\tapctl\Release\*.exe^
 ..\..\openvpn\out\build\win-%SignArch%-release\vcpkg_installed\%SignArchAlt%-windows-ovpn\tools\openssl\openssl.exe^
 ..\..\openvpn\out\build\win-%SignArch%-release\vcpkg_installed\%SignArchAlt%-windows-ovpn\bin\*.dll^
 ..\..\openvpn-gui\out\build\%SignArchAlt%\Release\openvpn-gui.exe^
 ..\..\openvpn-gui\out\build\%SignArchAlt%\Release\*.dll^
 %SOUI4PATH%\%SignArchBin%\*.dll
