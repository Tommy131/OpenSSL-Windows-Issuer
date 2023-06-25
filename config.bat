chcp 65001
cls

@REM 证书最大有效天数
set days=1095

@REM 需要签发的域名
set domain=yourdomain.com

@REM 证书名称
set certName=%domain%

@REM 配置文件
set config=openssl.%domain%.cnf

@REM 根证书CA名称
set rootCAName=Your_Root_CA_Name

@REM OCSP服务器IP
set ip=127.0.0.1:443

@REM OCSP服务器域名
set ocspServerUrl=http://your-OCSP-Server.com/ocsp

@REM 证书序列号
set serialNumber=01

@REM 已签发证书指纹
set SSLCertificateSHA1Hash=YourSSLHash



@REM 脚本执行需要变量, 请勿更改!
set CAcertDir=%~dp0CAcerts\
set requestDir=%~dp0request\
set keyDir=%~dp0private\
set certDir=%~dp0newcerts\
set pfxDir=%~dp0pfx\

set csrFile=%requestDir%%domain%.csr

set CAkey=%CAcertDir%%rootCAName%_key.key
set CAcrt=%CAcertDir%%rootCAName%_chain.crt

set userkey=%keyDir%%domain%%_key.key
set usercert=%certDir%%domain%%_chain.crt

set pfxFile=%pfxDir%%domain%.pfx

echo ####################################################################
echo     _____   _          __  _____   _____   _       _____   _____
echo    /  _  \ ^| ^|        / / /  _  \ ^|  _  \ ^| ^|     /  _  \ /  ___^|
echo    ^| ^| ^| ^| ^| ^|  __   / /  ^| ^| ^| ^| ^| ^|_^| ^| ^| ^|     ^| ^| ^| ^| ^| ^|
echo    ^| ^| ^| ^| ^| ^| /  ^| / /   ^| ^| ^| ^| ^|  _  { ^| ^|     ^| ^| ^| ^| ^| ^|  _
echo    ^| ^|_^| ^| ^| ^|/   ^|/ /    ^| ^|_^| ^| ^| ^|_^| ^| ^| ^|___  ^| ^|_^| ^| ^| ^|_^| ^|
echo    \_____/ ^|___/^|___/     \_____/ ^|_____/ ^|_____^| \_____/ \_____/
echo.
echo   @Author       : HanskiJay
echo   @E-Mail       : support@owoblog.com
echo   @Telegram     : https://t.me/HanskiJay
echo   @GitHub       : https://github.com/Tommy131
echo.
echo ####################################################################
echo.
echo.