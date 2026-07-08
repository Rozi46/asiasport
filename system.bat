@ECHO OFF

cd /d D:\@systemR\local\asiasport


start "Laravel 8032" cmd /k php artisan serve --host=127.0.0.1 --port=8032
start "Laravel 8033" cmd /k php artisan serve --host=127.0.0.1 --port=8033

echo Waiting for servers...

:wait_8032
timeout /t 2 >nul
curl -s http://127.0.0.1:8032 >nul
if errorlevel 1 goto wait_8032

echo Server 8032 ready!

:wait_8033
timeout /t 2 >nul
curl -s http://127.0.0.1:8033 >nul
if errorlevel 1 goto wait_8033

echo Server 8033 ready!

echo All servers ready!

start "" "C:\Program Files\Mozilla Firefox\firefox.exe" http://127.0.0.1:8032/admin/administration

exit