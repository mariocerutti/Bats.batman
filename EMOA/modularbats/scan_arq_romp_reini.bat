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