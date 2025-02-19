@echo off
for /f %%i in (computers.txt) do (
    echo Ativando RPC em %%i
    psexec \\%%i -s -d sc config RpcSs start= auto
    psexec \\%%i -s -d net start RpcSs
)