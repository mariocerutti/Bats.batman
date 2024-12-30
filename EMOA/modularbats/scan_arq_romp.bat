:: scaneia e repara arquivos corompidos
cls
echo --------------------------------------------------------
echo /Preparando para scanear arquivos corrompidos e reparar\
echo --------------------------------------------------------
echo.
echo.
echo Caso nao tenha executado como adm nao sera poissivel realizar as ações
echo inciado o scanner e reparacao de arquivos do computador 'sfc /scannow' >> C:\EMOA\Logs\logexec.txt
timeout /t 3

sfc /scannow