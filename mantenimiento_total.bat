@echo off
title Mantenimiento Total de la Laptop
echo ===============================
echo 🚀 INICIANDO MANTENIMIENTO TOTAL
echo ===============================
echo.

REM 1. Limpiar temporales de usuario
echo 🧹 Limpiando archivos temporales de usuario...
del /s /f /q %TEMP%\* > nul
rd /s /q %TEMP%

REM 2. Limpiar temporales del sistema
echo 🧼 Limpiando archivos temporales de Windows...
del /s /f /q C:\Windows\Temp\* > nul
rd /s /q C:\Windows\Temp

REM 3. Vaciar Papelera de reciclaje
echo 🗑️ Vaciando la papelera...
powershell -Command "Clear-RecycleBin -Force" > nul

REM 4. Limpiar caché de Edge
echo 🌐 Limpiando caché de Edge...
rd /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache"

REM 5. Limpiar caché de Chrome (si está instalado)
echo 🌐 Limpiando caché de Chrome...
rd /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache"

REM 6. Limpiar caché de Firefox (si está instalado)
echo 🌐 Limpiando caché de Firefox...
rd /s /q "%AppData%\Mozilla\Firefox\Profiles" > nul

REM 7. Borrar archivos .log, .tmp, .bak viejos (últimos 7 días)
echo 🔍 Eliminando archivos .log, .tmp y .bak antiguos...
forfiles /p C:\ /s /m *.log /d -7 /c "cmd /c del /q @path" 2>nul
forfiles /p C:\ /s /m *.tmp /d -7 /c "cmd /c del /q @path" 2>nul
forfiles /p C:\ /s /m *.bak /d -7 /c "cmd /c del /q @path" 2>nul

REM 8. Optimizar disco
echo 🧩 Optimizando disco...
defrag C: /O > nul

REM 9. Liberar memoria virtual (pagefile.sys)
echo 🧠 Liberando memoria virtual...
powershell -Command "Clear-Content -Path \"$env:SystemDrive\pagefile.sys\" -Force" 2>nul

echo.
echo ✅ MANTENIMIENTO COMPLETADO
pause
