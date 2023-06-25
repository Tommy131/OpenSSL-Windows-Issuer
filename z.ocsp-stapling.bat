@echo off
TITLE OCSP Stapling

call config.bat

echo [INFO] 正在启动 OCSP Stapling 客户端...
openssl s_client -connect %ip% -servername %domain% -status -tlsextdebug

pause