@echo off
TITLE Revocation Certificate

call config.bat

set usercert=%certDir%%certName%.crt

if not exist %usercert% (
    echo [ERROR] 不存在当前证书文件, 无法吊销!
    pause
    exit
)

echo [INFO] 正在吊销证书 '%usercert%'...
openssl ca -revoke %usercert% -cert %CAcrt% -keyfile %CAkey% --config %config%

pause