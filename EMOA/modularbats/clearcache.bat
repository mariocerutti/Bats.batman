@echo off

:: ----------------CONFIG----------------
set pathtemp1=%USERPROFILE%\AppData\Local\Temp
set pathtemp2=C:\Windows\Temp
set pathrecent=%USERPROFILE%\AppData\Roaming\Microsoft\Windows\Recent
set pathchrome=%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache\Cache_Data
::set pathfox=%USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\[Perfil]\cache2
set pathnet=%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache
:: ----------------AND CONFIG----------------    

cls
rmdir /s /q %pathtemp1%
cls
echo -------------------
echo ###                  20/100
echo -------------------
echo Limpando arquivos temporarios, nao feche o CMD...
timeout /t 2
cls

rmdir /s /q %pathtemp2%
cls
echo -------------------
echo #######              30/100
echo -------------------
timeout /t 2
cls

rmdir /s /q %pathrecent%
cls
echo -------------------
echo ##########           50/100
echo -------------------
echo Limpeza feita com sucesso em 'recent' >> C:\EMOA\Logs\logexec.txt
timeout /t 2
cls

cd c:\Users
rmdir /s /q %pathchrome%
echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
cls
echo -------------------
echo ###############      80/100
echo -------------------
echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
timeout /t 2
cls

:: -----Caso utilize o navegador firefox------
::rmdir /s /q %pathfox%
::echo -------------------
::echo ##################   90/100
::echo -------------------
::echo Limpeza feita do cache do chrome >> C:\EMOA\Logs\logexec.txt
::timeout /t 2
::cls

rmdir /s /q %pathnet%
echo Limpeza feita do cache da internet >> C:\EMOA\Logs\logexec.txt
echo -------------------
echo ###################  100/100
echo -------------------
timeout /t 3
cls