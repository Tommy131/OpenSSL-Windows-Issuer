@echo off
TITLE Generate Revocation Certificate List

call config.bat

echo [INFO] 在生成证书吊销列表...
openssl ca -gencrl -out rootca.crl -cert %CAcrt% -keyfile %CAkey% --config %config%

pause