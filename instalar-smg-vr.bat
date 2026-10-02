@echo off
setlocal
chcp 65001 >nul 2>&1

echo.
echo =============================================
echo   Super Mario Galaxy VR - Instalador
echo =============================================
echo.

set "SRC=%~dp0SMG-VR"
set "TARGET=%USERPROFILE%\Documents\Dolphin Emulator\SMG-VR"

if not exist "%SRC%\smgvr_layer.dll" goto nopkg
if not exist "%SRC%\GameSettings-RMGE01.ini" goto nopkg
if not exist "%SRC%\WiimoteNew.ini" goto nopkg
if not exist "%SRC%\GameSettingsVR-RMGE01.ini" goto nopkg
if not exist "%SRC%\smgvr_layer.json" goto nopkg

tasklist 2>nul | findstr /i "dolphin.exe" >nul
if not errorlevel 1 goto dolphinopen

:: Pasta de usuario do Dolphin, na mesma ordem em que o Dolphin escolhe:
:: portable.txt / LocalUserConfig -> User ao lado do exe; UserConfigPath do registro; Documentos; AppData.
set "UD="
if exist "%~dp0portable.txt" set "UD=%~dp0User"
if not defined UD for /f "tokens=3" %%a in ('reg query "HKCU\Software\Dolphin Emulator" /v LocalUserConfig 2^>nul ^| findstr /i "LocalUserConfig"') do if not "%%a"=="0x0" set "UD=%~dp0User"
if not defined UD for /f "tokens=2,*" %%a in ('reg query "HKCU\Software\Dolphin Emulator" /v UserConfigPath 2^>nul ^| findstr /i "UserConfigPath"') do set "UD=%%b"
set "DOCS=%USERPROFILE%\Documents"
for /f "usebackq delims=" %%d in (`powershell -NoProfile -Command "[Environment]::GetFolderPath('MyDocuments')"`) do set "DOCS=%%d"
:: a pasta SMG-VR abaixo cria "Documents\Dolphin Emulator": se Documentos for essa pasta, o Dolphin passa a usa-la
if not defined UD if /i "%DOCS%"=="%USERPROFILE%\Documents" set "UD=%DOCS%\Dolphin Emulator"
if not defined UD if exist "%DOCS%\Dolphin Emulator" set "UD=%DOCS%\Dolphin Emulator"
if not defined UD set "UD=%APPDATA%\Dolphin Emulator"
set "UD=%UD:/=\%"
if "%UD:~-1%"=="\" set "UD=%UD:~0,-1%"
echo [OK] Pasta de usuario do Dolphin: "%UD%"

set "T=%time:~0,2%%time:~3,2%%time:~6,2%"
set "T=%T: =0%"

:: ---- 1. Camada OpenXR (menu, cameras, maos) ----
if not exist "%TARGET%" mkdir "%TARGET%"
echo [..] Copiando smgvr_layer.dll...
attrib -R "%TARGET%\smgvr_layer.dll" >nul 2>&1
copy /Y "%SRC%\smgvr_layer.dll" "%TARGET%\smgvr_layer.dll" >nul 2>&1
if errorlevel 1 (
    rem em uso por outro programa de VR: a DLL carregada pode ser renomeada, a nova entra no lugar
    ren "%TARGET%\smgvr_layer.dll" "smgvr_layer.dll.em-uso-%T%" >nul 2>&1
    copy /Y "%SRC%\smgvr_layer.dll" "%TARGET%\smgvr_layer.dll" >nul 2>&1
)
if errorlevel 1 goto dllfail
echo [OK] smgvr_layer.dll instalada

copy /Y "%SRC%\smgvr_layer.json" "%TARGET%\smgvr_layer.json" >nul
if exist "%SRC%\smgvr-splash.bmp" copy /Y "%SRC%\smgvr-splash.bmp" "%TARGET%\smgvr-splash.bmp" >nul
echo [OK] smgvr_layer.json instalado

if not exist "%TARGET%\smgvr-menu.ini" goto newini
:: a versao 1.1 trouxe a opcao "movefwd" (camera a frente andando/pulando) e novos valores padrao de camera:
:: quem ainda tem o arquivo da versao 1 recebe os novos padroes (o arquivo antigo fica guardado ao lado)
findstr /b /c:"movefwd=" "%TARGET%\smgvr-menu.ini" >nul 2>&1
if not errorlevel 1 goto keepini
copy /Y "%TARGET%\smgvr-menu.ini" "%TARGET%\smgvr-menu.ini.bak-%T%" >nul
copy /Y "%SRC%\smgvr-menu.ini" "%TARGET%\smgvr-menu.ini" >nul
echo [OK] smgvr-menu.ini atualizado para os novos padroes (o anterior ficou em smgvr-menu.ini.bak-%T%)
goto inidone
:newini
copy /Y "%SRC%\smgvr-menu.ini" "%TARGET%\smgvr-menu.ini" >nul
echo [OK] smgvr-menu.ini instalado (configuracoes padrao)
goto inidone
:keepini
echo [--] smgvr-menu.ini ja esta na versao nova, mantendo suas configuracoes
:inidone

reg add "HKCU\SOFTWARE\Khronos\OpenXR\1\ApiLayers\Implicit" /v "%TARGET%\smgvr_layer.json" /t REG_DWORD /d 0 /f >nul
if errorlevel 1 goto regfail
echo [OK] Camada OpenXR registrada

:: ---- 2. Codigos do jogo (primeira pessoa) e configuracao de VR ----
if not exist "%UD%\GameSettings" mkdir "%UD%\GameSettings"
if not exist "%UD%\Config\Profiles\Wiimote" mkdir "%UD%\Config\Profiles\Wiimote"
if not exist "%UD%\Backup" mkdir "%UD%\Backup"
if exist "%UD%\GameSettings\RMGE01.ini" copy /Y "%UD%\GameSettings\RMGE01.ini" "%UD%\Backup\RMGE01-antes-%T%.ini" >nul
copy /Y "%SRC%\GameSettings-RMGE01.ini" "%UD%\GameSettings\RMGE01.ini" >nul
if errorlevel 1 goto gamefail
echo [OK] Codigos da primeira pessoa instalados (GameSettings\RMGE01.ini)

:: ajustes de VR do jogo: escala do mundo, inclinacao da camera, HUD e correcoes visuais (luzes rosa, reflexos)
if not exist "%UD%\GameSettingsVR" mkdir "%UD%\GameSettingsVR"
if exist "%UD%\GameSettingsVR\RMGE01.ini" copy /Y "%UD%\GameSettingsVR\RMGE01.ini" "%UD%\Backup\RMGE01-VR-antes-%T%.ini" >nul
copy /Y "%SRC%\GameSettingsVR-RMGE01.ini" "%UD%\GameSettingsVR\RMGE01.ini" >nul
if errorlevel 1 goto gamefail
echo [OK] Ajustes de VR do jogo instalados (GameSettingsVR\RMGE01.ini)

:: registro em arquivo (Logs\dolphin.log), so se a pessoa ainda nao tiver o seu: serve para achar problemas
if exist "%UD%\Config\Logger.ini" goto logdone
if not exist "%SRC%\Logger.ini" goto logdone
if not exist "%UD%\Config" mkdir "%UD%\Config"
copy /Y "%SRC%\Logger.ini" "%UD%\Config\Logger.ini" >nul
echo [OK] Registro em arquivo ligado (Config\Logger.ini)
:logdone

:: ---- 3. Controles (clique do analogico direito = trocar de camera) ----
if exist "%UD%\Config\WiimoteNew.ini" copy /Y "%UD%\Config\WiimoteNew.ini" "%UD%\Backup\WiimoteNew-antes-%T%.ini" >nul
copy /Y "%SRC%\WiimoteNew.ini" "%UD%\Config\WiimoteNew.ini" >nul
if errorlevel 1 goto gamefail
if exist "%SRC%\Mario.ini" copy /Y "%SRC%\Mario.ini" "%UD%\Config\Profiles\Wiimote\Mario.ini" >nul
echo [OK] Controles instalados (Config\WiimoteNew.ini)

:: ---- 4. Cheats ligados: sem isso os codigos da primeira pessoa nao rodam ----
set "SMG_INI=%UD%\Config\Dolphin.ini"
powershell -NoProfile -Command "$p=$env:SMG_INI; if (-not (Test-Path -LiteralPath $p)) { [IO.File]::WriteAllLines($p, @('[Core]','EnableCheats = True')) } else { $t=[IO.File]::ReadAllLines($p); if ($t -match '^\s*EnableCheats\s*=\s*True') { } elseif ($t -match '^\s*EnableCheats\s*=') { $t = $t -replace '^\s*EnableCheats\s*=.*','EnableCheats = True'; [IO.File]::WriteAllLines($p,$t) } elseif ($t -contains '[Core]') { $o = foreach ($l in $t) { $l; if ($l -eq '[Core]') { 'EnableCheats = True' } }; [IO.File]::WriteAllLines($p,$o) } else { [IO.File]::WriteAllLines($p, $t + '[Core]' + 'EnableCheats = True') } }"
findstr /r /c:"^EnableCheats *= *True" "%SMG_INI%" >nul 2>&1
if errorlevel 1 goto cheatfail
echo [OK] Cheats ligados (Config\Dolphin.ini)

echo.
echo =============================================
echo   Instalacao concluida com sucesso!
echo.
echo   Para jogar:
echo   1. Conecte o Quest ao PC (Virtual Desktop, Air Link ou Link)
echo   2. Abra o Dolphin VR ReduX (Dolphin.exe)
echo   3. Carregue o jogo Super Mario Galaxy, versao americana (RMGE01).
echo      Outras versoes (europeia, japonesa) nao funcionam com o mod.
echo   4. Trocar de camera: clique do analogico direito
echo      (1a pessoa - camera 200 - 3a pessoa)
echo   5. Menu VR: segure B + Y no controle
echo   6. Pausa do jogo: toque rapido no botao Menu do controle esquerdo
echo.
echo   Se algo der errado, envie estes dois arquivos:
echo   "%TARGET%\smgvr.log"
echo   "%UD%\Logs\dolphin.log"
echo.
echo   Copias de seguranca do que foi substituido:
echo   "%UD%\Backup"
echo =============================================
echo.
pause
exit /b 0

:nopkg
echo [ERRO] Pacote incompleto: faltam arquivos na pasta "%SRC%".
pause
exit /b 1

:dolphinopen
echo [ERRO] O Dolphin esta aberto. Feche o Dolphin e execute de novo.
pause
exit /b 1

:dllfail
echo [ERRO] Falha ao copiar a DLL. Feche o Dolphin e outros jogos de VR e execute de novo.
pause
exit /b 1

:regfail
echo [ERRO] Falha ao registrar a camada OpenXR.
pause
exit /b 1

:gamefail
echo [ERRO] Falha ao copiar os arquivos do jogo para "%UD%".
pause
exit /b 1

:cheatfail
echo [ERRO] Nao consegui ligar os cheats em "%SMG_INI%".
echo        Ligue manualmente: Dolphin - Configuracoes - Geral - Habilitar Cheats.
pause
exit /b 1
