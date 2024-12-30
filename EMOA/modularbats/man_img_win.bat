@echo off

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