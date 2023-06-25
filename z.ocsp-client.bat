@echo off
TITLE OCSP Service

call config.bat

echo [INFO] 正在启动 OCSP 客户端 校验证书 %usercert% ...
openssl ocsp -issuer %CAcrt% -url %ocspServerUrl% -serial %serialNumber% -VAfile %usercert%

pause