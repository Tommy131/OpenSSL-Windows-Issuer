@echo off
TITLE OCSP Service

call config.bat

echo [INFO] 正在启动 URL检索工具 检索域名 '%domain% ...
certutil -url %usercert%

pause