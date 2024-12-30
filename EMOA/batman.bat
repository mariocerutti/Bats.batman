@echo off

:: Verification administer script
openfiles >nul 2>nul
if %errorlevel% NEQ 0 (
    echo Tentando reiniciar com privilegios de administrador...
    timeout /3
    :: Run as administrator
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit
)
:: And verification


:: ----------------CONFIG----------------
set pathtemp1=%USERPROFILE%\AppData\Local\Temp
set pathtemp2=C:\Windows\Temp
set pathrecent=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent
set pathchrome=%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data
::set pathfox=%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\[Perfil]\cache2
set pathnet=%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache
:: ----------------AND CONFIG----------------

:: Config diretory
set direct = C:\EMOA
:: And config directory

:: Start
:: loop
:menu
cls

echo BETA version 0.2412.30.1
:: Introdução e informações
echo --------------------------------------------------
echo /Executavel De Manutencao E Otimizacao Automatico\
echo --------------------------------------------------
echo.

echo ----------------------
echo /ALERTA ALERTA ALERTA\
echo ----------------------
echo NECESSARIO EXECUTAR COMO ADM POIS NAO SERA POSSIVEL REALIZAR TODAS AS ACOES
timeout /t 5
cls




:: menu escolha
echo --------------------------------------------------
echo /Executavel De Manutencao E Otimizacao Automatico\
echo --------------------------------------------------
echo Rodar como administrador
echo.
echo.
:: Escolha do tipo de manutenção
echo.
echo 1 - COMPLETO, fara a manutencao e otimizacao geral (alto tempo de espera), afetara Discos Rigidos, limpa arquivos temporarios, scanners... 
echo NECESSARIO REINICIAR O COMPUTADOR NO FINAL DO PROCESSO.
echo.
echo 2 - RAPIDO, fara a manutencao basica do sistema, limpa arquivos temporarios e faz a verificacao de seguranca do sistema...
echo.
echo 3 - MEMORIA, fara a manutencao de memorias de HDs, pendrives, SSD...
echo.
echo 4 - OTIMIZACAO, fara apenas a otimizacao do sistema...
echo.
echo 5 - VERIFICACAO, fara a verificacao de seguranca...
echo.
echo 6 - FECHAR...
echo.

:: Registra a escolha na variável 'userchoose'
set /p userchoose=Digite o numero da verificacao que deseja realizar (1 a 6): 
:: Remove espaços em branco da variável
set userchoose=%userchoose: =%

cd %direct%

:: Tratamento de erros de userchoose
if "%userchoose%"=="1" (
    :: limpa arquivos temporários
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\clearcache.bat' -Verb RunAs -Wait"

    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\defragdisc.bat' -Verb RunAs -Wait"


    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\man_img_win.bat' -Verb RunAs -Wait"


    :: limpeza de disco
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\cleardisc.bat' -Verb RunAs -Wait"


    :: Logs de atualizacao
    cls
    echo Gerado log sobre atualizacao
    echo wmic qfe list > C:\EMOA\Logs\lolgverificar.txt
    echo. >> C:\EMOA\Logs\lolgverificar.txt
    echo Gerado log sobre status firewall 
    echo netsh advfirewall show allprofiles >> C:\EMOA\Logs\lolgverificar.txt
    echo Acesse para ver os logs 'C:\EMOA\Logs\lolgverificar.txt'
    echo Gravado logs >> C:\EMOA\Logs\logexec.txt

    timeout /t 10


    :: Verificacao de seguranca
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\verific_security.bat' -Verb RunAs -Wait"


    :: scaneia e repara arquivos corompidos
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\scan_arq_romp.bat' -Verb RunAs -Wait"


    :: Scaneia e repara arquivos corompidos no disco rigido
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\scan_arq_romp_reini.bat' -Verb RunAs -Wait"


    goto end





) else if "%userchoose%"=="2" (
    :: limpa arquivos temporários
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\clearcache.bat' -Verb RunAs -Wait"


    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\defragdisc.bat' -Verb RunAs -Wait"


    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\man_img_win.bat' -Verb RunAs -Wait"


    :: Verificacao de seguranca
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\verific_security.bat' -Verb RunAs -Wait"

    goto end



) else if "%userchoose%"=="3" (
    :: limpa arquivos temporários
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\clearcache.bat' -Verb RunAs -Wait"

    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\defragdisc.bat' -Verb RunAs -Wait"


    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\man_img_win.bat' -Verb RunAs -Wait"


    :: limpeza de disco
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\cleardisc.bat' -Verb RunAs -Wait"


    :: scaneia e repara arquivos corompidos
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\scan_arq_romp.bat' -Verb RunAs -Wait"


    :: Scaneia e repara arquivos corompidos no disco rigido
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\scan_arq_romp_reini.bat' -Verb RunAs -Wait"
    



    goto end




) else if "%userchoose%"=="4" (
    :: limpa arquivos temporários
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\clearcache.bat' -Verb RunAs -Wait"

    :: Manutencao de imagem do windows
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\defragdisc.bat' -Verb RunAs -Wait"

    echo Finalizado
    timeout /t 3

    goto end





) else if "%userchoose%"=="5" (
        :: Logs de atualizacao
    cls
    echo Gerado log sobre atualizacao
    echo wmic qfe list > C:\EMOA\Logs\lolgverificar.txt
    echo. >> C:\EMOA\Logs\lolgverificar.txt
    echo Gerado log sobre status firewall 
    echo netsh advfirewall show allprofiles >> C:\EMOA\Logs\lolgverificar.txt
    echo Acesse para ver os logs 'C:\EMOA\Logs\lolgverificar.txt'
    echo Gravado logs >> C:\EMOA\Logs\logexec.txt


    timeout /t 20


    :: Verificacao de seguranca
    cls
    powershell -command "Start-process 'C:\EMOA\modularbats\verific_security.bat' -Verb RunAs -Wait"


goto end



) else if "%userchoose%"=="6" (
    goto end
) else (
    echo Entrada inválida! Tente novamente.
    timeout /t 2
    goto menu
)

:end
echo Fim do programa.
pause