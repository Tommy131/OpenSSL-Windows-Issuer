@echo off
TITLE CA and Certificate Generation

call config.bat

echo [INFO] 正在生成根证书密钥...
if not exist "%CAkey%" (
    openssl genrsa -des3 -out %CAkey% 2048
    echo [SUCCESS] 已生成根证书密钥! 即将进行下一步操作.
    echo.
) else (
    echo [ERROR] 已存在根证书密钥, 将跳过该步骤进行下一步操作.
    echo.
)

echo [INFO] 正在自签根CA证书...
if not exist "%CAcrt%" (
    openssl req -new -x509 -days %days% -key %CAkey% -out %CAcrt% -config %config%
    echo [SUCCESS] 自签根证书CA成功! 即将进行下一步操作.
    echo.
) else (
    echo [ERROR] 自签根证书CA失败, 因为已存在对应文件! 将跳过该步骤进行下一步操作.
    echo.
)

echo.
echo [INFO] 正在生成证书密钥...
if not exist "%userkey%" (
    openssl genrsa -out %userkey% 2048
) else (
    echo [ERROR] 已存在对应的密钥! 请确认是否需要覆盖当前域名重新签发新的证书!
    echo [ERROR] 请删除当前已存在的域名 '%domain%' 或更改域名配置以继续签发证书!
    pause
    exit
)

echo.
echo [INFO] 正在生成CSR...
openssl req -new -newkey rsa:2048 -nodes -key %userkey% -out %csrFile% -config %config%

echo.
echo [INFO] 正在签发证书...
openssl ca -in %csrFile% -out %usercert% -extensions v3_req -days %days% -config %config%

echo.
echo [INFO] 正在打包证书...
if exist "%usercert%" (
    openssl pkcs12 -export -inkey %userkey% -in %usercert% -out %pfxFile%
) else (
    echo [ERROR] 无法找到有效的证书文件, 请检查先前步骤是否正确执行!
)

echo.
echo.
if exist "%usercert%" (
    if exist "%pfxFile%" (
        echo [INFO] 所有操作成功完成.
        echo [INFO] 证书存放路径:
        echo        - 证书文件: %usercert%
        echo        - 证书私钥: %userkey%
    ) else (
        echo [ERROR] 先前执行的步骤存在问题, 无法打包证书.
        echo         请检查先前的步骤并确认无误后再次尝试.
    )
) else (
    echo [ERROR] 先前执行的步骤存在问题, 无法创建有效的证书文件.
    echo         请检查配置文件并确认无误后再次尝试.
)

pause