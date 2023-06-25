@echo off
TITLE Register

call config.bat

echo [INFO] 正在将证书指纹 %SSLCertificateSHA1Hash% 注册到 Windows远程服务 ...
wmic /namespace:\\root\cimv2\TerminalServices PATH Win32_TSGeneralSetting Set SSLCertificateSHA1Hash="%SSLCertificateSHA1Hash%"

pause