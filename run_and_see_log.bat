@echo off
cd /d "%~dp0"
echo Executando o app. O log aparecera abaixo.
echo Se o app fechar sozinho, role o terminal para ver o erro.
echo.
flutter run -v
echo.
echo === Fim da execucao ===
pause
