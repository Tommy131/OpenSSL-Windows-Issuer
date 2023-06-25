@echo off
TITLE OCSP Service

call config.bat

echo [INFO] 正在启动 OCSP 监听服务...
openssl ocsp -index index.txt -CA %CAcrt% -port 8080 -text -rsigner %usercert% -rkey %userkey% -timeout 60 -ignore_err -resp_no_certs

pause