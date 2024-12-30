@echo off

:: Inicio
:: loop
:menu
cls

echo BETA version 0.2412.15.1
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

:: Tratamento de erros de userchoose
if "%userchoose%"=="1" (
    :: limpa arquivos temporários
    cls
    rmdir /s /q C:\Users\thete\AppData\Local\Temp
    cls
    echo -------------------
    echo ###                  20/100
    echo -------------------
    echo Limpando arquivos temporarios, nao feche o CMD...
    timeout /t 2
    cls

    rmdir /s /q C:\Windows\Temp
    cls
    echo -------------------
    echo #######              30/100
    echo Limpando arquivos temporarios, nao feche o CMD...
    echo -------------------
    timeout /t 2
    cls

    rmdir /s /q C:\Users\thete\Recent
    cls
    echo -------------------
    echo ##########           50/100
    echo -------------------
    echo Limpeza feita com sucesso em 'recent' >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    cd c:\Users
    rmdir /s /q %localappdata%\Google\Chrome\User Data\Default\Cache\Cache_Data
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    cls
    echo -------------------
    echo ###############      80/100
    echo -------------------
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    :: -----Caso utilize o navegador firefox------
    ::rmdir /s /q %localappdata%\Mozilla\Firefox\Profiles\[Perfil]\cache2
    echo -------------------
    echo ##################   90/100
    echo -------------------
    ::echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    ::timeout /t 2
    cls

    rmdir /s /q %localappdata%\Microsoft\Windows\INetCache
    echo Limpeza feita do cache da internet >> C:\EMOA\Logs\logexec.txt
    echo -------------------
    echo ###################  100/100
    echo -------------------
    timeout /t 3
    cls



    :: Manutencao de imagem do windows
    cls
    echo ---------------------------------------------
    echo /Iniciando a manutencao de imagem do windows\
    echo ---------------------------------------------
    echo.
    echo.
    timeout /p 3

    echo Manutencao efetuada 'DISM /Online /Cleanup-Image /RestoreHealth' >> C:\EMOA\Logs\logexec.txt

    echo.
    echo.
    echo Fim do processo, iniciando proximo processo...
    timeout /p 3


    :: limpeza de disco
    cls
    echo -------------------------
    echo /Limpeza de disco rigido\
    echo -------------------------
    echo Atencao ira abrir uma tela para selecionar as opcoes que deseja limpar, caso tenha duvida selecione apenas:
    echo arquivos temporarios e miniatura.
    echo.
    echo.

    cleanmgr
    echo Iniciado 'cleanmgr' >> C:\EMOA\Logs\logexec.txt
    timeout /t 10


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
    echo -----------------------------------------------------   
    echo /Iniciando verificacao de software mal intensionados\
    echo -----------------------------------------------------
    mrt /F:Y
    echo inciado o mrt completo >> C:\EMOA\Logs\logexec.txt

    timeout /t 3




    :: Defragmentacao
    cls
    echo --------------------------------------------
    echo /Iniciando a defragmentacao do disco rigido\
    echo --------------------------------------------
    echo.
    echo.
    echo Iniciado defragmantacao >> C:\EMOA\Logs\logexec.txt
    echo defrag C: /O >> C:\EMOA\Logs\logexec.txt

    timeout /t 3




    :: scaneia e repara arquivos corompidos
    cls
    echo --------------------------------------------------------
    echo /Preparando para scanear arquivos corrompidos e reparar\
    echo --------------------------------------------------------
    echo.
    echo.
    echo Caso nao tenha executado como adm nao sera poissivel realizar essa e ações posteriores
    echo inciado o scanner e reparacao de arquivos do computador 'sfc /scannow' >> C:\EMOA\Logs\logexec.txt
    timeout /t 5

    sfc /scannow



    :: Scaneia e repara arquivos corompidos no disco rigido
    cls
    echo --------------------------------------------------------
    echo /Preparando para scanear arquivos corrompidos e reparar\
    echo --------------------------------------------------------
    echo.
    echo.
    echo Caso nao tenha executado como adm nao sera poissivel realizar essa e ações posteriores
    echo sera reiniciado o computador para iniciar a verificacao
    echo Reiniciado o computador 'chkdsk C: /f /r' >> C:\EMOA\Logs\logexec.txt

    chkdsk C: /f /r
    
    timeout /t 5



    goto end





) else if "%userchoose%"=="2" (
    :: limpa arquivos temporários
    cls
    rmdir /s /q C:\Users\thete\AppData\Local\Temp
    cls
    echo -------------------
    echo ###                  20/100
    echo -------------------
    echo Limpando arquivos temporarios, nao feche o CMD...
    timeout /t 2
    cls

    rmdir /s /q C:\Windows\Temp
    cls
    echo -------------------
    echo #######              30/100
    echo Limpando arquivos temporarios, nao feche o CMD...
    echo -------------------
    timeout /t 2
    cls

    rmdir /s /q C:\Users\thete\Recent
    cls
    echo -------------------
    echo ##########           50/100
    echo -------------------
    echo Limpeza feita com sucesso em 'recent' >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    cd c:\Users
    rmdir /s /q %localappdata%\Google\Chrome\User Data\Default\Cache\Cache_Data
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    cls
    echo -------------------
    echo ###############      80/100
    echo -------------------
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    :: -----Caso utilize o navegador firefox------
    ::rmdir /s /q %localappdata%\Mozilla\Firefox\Profiles\[Perfil]\cache2
    echo -------------------
    echo ##################   90/100
    echo -------------------
    ::echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    ::timeout /t 2
    cls

    rmdir /s /q %localappdata%\Microsoft\Windows\INetCache
    echo Limpeza feita do cache da internet >> C:\EMOA\Logs\logexec.txt
    echo -------------------
    echo ###################  100/100
    echo -------------------
    timeout /t 3
    cls



        :: Manutencao de imagem do windows
    cls
    echo ---------------------------------------------
    echo /Iniciando a manutencao de imagem do windows\
    echo ---------------------------------------------
    echo.
    echo.
    timeout /p 3

    echo Manutencao efetuada 'DISM /Online /Cleanup-Image /RestoreHealth' >> C:\EMOA\Logs\logexec.txt

    echo.
    echo.
    echo Fim do processo, iniciando proximo processo...
    timeout /p 3



    :: Defragmentacao
    cls
    echo --------------------------------------------
    echo /Iniciando a defragmentacao do disco rigido\
    echo --------------------------------------------
    echo.
    echo.
    echo Iniciado defragmantacao >> C:\EMOA\Logs\logexec.txt
    echo defrag C: /O >> C:\EMOA\Logs\logexec.txt

    timeout /t 3



    :: Verificacao de seguranca
    cls
    echo -----------------------------------------------------   
    echo /Iniciando verificacao de software mal intensionados\
    echo -----------------------------------------------------
    mrt /Q
    echo inciado o mrt rapido >> C:\EMOA\Logs\logexec.txt

    timeout /t 3

    goto end



) else if "%userchoose%"=="3" (
        :: limpa arquivos temporários
    cls
    rmdir /s /q C:\Users\thete\AppData\Local\Temp
    cls
    echo -------------------
    echo ###                  20/100
    echo -------------------
    echo Limpando arquivos temporarios, nao feche o CMD...
    timeout /t 2
    cls

    rmdir /s /q C:\Windows\Temp
    cls
    echo -------------------
    echo #######              30/100
    echo Limpando arquivos temporarios, nao feche o CMD...
    echo -------------------
    timeout /t 2
    cls

    rmdir /s /q C:\Users\thete\Recent
    cls
    echo -------------------
    echo ##########           50/100
    echo -------------------
    echo Limpeza feita com sucesso em 'recent' >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    cd c:\Users
    rmdir /s /q %localappdata%\Google\Chrome\User Data\Default\Cache\Cache_Data
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    cls
    echo -------------------
    echo ###############      80/100
    echo -------------------
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    :: -----Caso utilize o navegador firefox------
    ::rmdir /s /q %localappdata%\Mozilla\Firefox\Profiles\[Perfil]\cache2
    echo -------------------
    echo ##################   90/100
    echo -------------------
    ::echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    ::timeout /t 2
    cls

    rmdir /s /q %localappdata%\Microsoft\Windows\INetCache
    echo Limpeza feita do cache da internet >> C:\EMOA\Logs\logexec.txt
    echo -------------------
    echo ###################  100/100
    echo -------------------
    timeout /t 3
    cls


        :: Manutencao de imagem do windows
    cls
    echo ---------------------------------------------
    echo /Iniciando a manutencao de imagem do windows\
    echo ---------------------------------------------
    echo.
    echo.
    timeout /p 3

    echo Manutencao efetuada 'DISM /Online /Cleanup-Image /RestoreHealth' >> C:\EMOA\Logs\logexec.txt

    echo.
    echo.
    echo Fim do processo, iniciando proximo processo...
    timeout /p 3



    :: Defragmentacao
    cls
    echo --------------------------------------------
    echo /Iniciando a defragmentacao do disco rigido\
    echo --------------------------------------------
    echo.
    echo.
    echo Iniciado defragmantacao >> C:\EMOA\Logs\logexec.txt
    echo defrag C: /O >> C:\EMOA\Logs\logexec.txt

    timeout /t 3



    :: limpeza de disco
    cls
    echo -------------------------
    echo /Limpeza de disco rigido\
    echo -------------------------
    echo Atencao ira abrir uma tela para selecionar as opcoes que deseja limpar, caso tenha duvida selecione apenas:
    echo arquivos temporarios e miniatura.
    echo.
    echo.

    cleanmgr
    echo Iniciado 'cleanmgr' >> C:\EMOA\Logs\logexec.txt
    timeout /t 10



    :: scaneia e repara arquivos corompidos
    cls
    echo --------------------------------------------------------
    echo /Preparando para scanear arquivos corrompidos e reparar\
    echo --------------------------------------------------------
    echo.
    echo.
    echo Caso nao tenha executado como adm nao sera poissivel realizar essa e ações posteriores
    echo inciado o scanner e reparacao de arquivos do computador 'sfc /scannow' >> C:\EMOA\Logs\logexec.txt
    timeout /t 5

    sfc /scannow


    :: Scaneia e repara arquivos corompidos no disco rigido
    cls
    echo ------------------------------------------------------------------------
    echo /Preparando para scanear arquivos corrompidos e reparar no Disco Rigido\
    echo ------------------------------------------------------------------------
    echo.
    echo.
    echo Caso nao tenha executado como adm nao sera poissivel realizar essa e ações posteriores
    echo sera reiniciado o computador para iniciar a verificacao
    echo Reiniciado o computador 'chkdsk C: /f /r' >> C:\EMOA\Logs\logexec.txt
    timeout /t 5


    chkdsk C: /f /r
    



    goto end




) else if "%userchoose%"=="4" (
    :: limpa arquivos temporários
    cls
    rmdir /s /q C:\Users\thete\AppData\Local\Temp
    cls
    echo -------------------
    echo ###                  20/100
    echo -------------------
    echo Limpando arquivos temporarios, nao feche o CMD...
    timeout /t 2
    cls

    rmdir /s /q C:\Windows\Temp
    cls
    echo -------------------
    echo #######              30/100
    echo Limpando arquivos temporarios, nao feche o CMD...
    echo -------------------
    timeout /t 2
    cls

    rmdir /s /q C:\Users\thete\Recent
    cls
    echo -------------------
    echo ##########           50/100
    echo -------------------
    echo Limpeza feita com sucesso em 'recent' >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    cd c:\Users
    rmdir /s /q %localappdata%\Google\Chrome\User Data\Default\Cache\Cache_Data
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    cls
    echo -------------------
    echo ###############      80/100
    echo -------------------
    echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    timeout /t 2
    cls

    :: -----Caso utilize o navegador firefox------
    ::rmdir /s /q %localappdata%\Mozilla\Firefox\Profiles\[Perfil]\cache2
    echo -------------------
    echo ##################   90/100
    echo -------------------
    ::echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
    ::timeout /t 2
    cls

    rmdir /s /q %localappdata%\Microsoft\Windows\INetCache
    echo Limpeza feita do cache da internet >> C:\EMOA\Logs\logexec.txt
    echo -------------------
    echo ###################  100/100
    echo -------------------
    timeout /t 3
    cls


    :: Defragmentacao
    cls
    echo --------------------------------------------
    echo /Iniciando a defragmentacao do disco rigido\
    echo --------------------------------------------
    echo.
    echo.
    echo Iniciado defragmantacao >> C:\EMOA\Logs\logexec.txt
    echo defrag C: /O >> C:\EMOA\Logs\logexec.txt

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
    echo -----------------------------------------------------   
    echo /Iniciando verificacao de software mal intensionados\
    echo -----------------------------------------------------
    mrt /F:Y
    echo inciado o mrt completo >> C:\EMOA\Logs\logexec.txt

    timeout /t 3


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