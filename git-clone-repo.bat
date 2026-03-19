@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

:: ══════════════════════════════════════════
::   ANSI COLOR CODES
:: ══════════════════════════════════════════
for /f %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set "RESET=%ESC%[0m"
set "BOLD=%ESC%[1m"
set "DIM=%ESC%[2m"

set "RED=%ESC%[38;5;196m"
set "GREEN=%ESC%[38;5;82m"
set "CYAN=%ESC%[38;5;51m"
set "YELLOW=%ESC%[38;5;220m"
set "PURPLE=%ESC%[38;5;135m"
set "ORANGE=%ESC%[38;5;208m"
set "WHITE=%ESC%[38;5;255m"
set "GRAY=%ESC%[38;5;240m"

cls

:: ══════════════════════════════════════════
::   BANNER
:: ══════════════════════════════════════════
echo.
echo %CYAN%  ██████╗ ██╗████████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗%RESET%
echo %CYAN%  ██╔════╝ ██║╚══██╔══╝    ██╔════╝╚██╗ ██╔╝████╗  ██║██╔════╝%RESET%
echo %CYAN%  ██║  ███╗██║   ██║       ███████╗ ╚████╔╝ ██╔██╗ ██║██║     %RESET%
echo %CYAN%  ██║   ██║██║   ██║       ╚════██║  ╚██╔╝  ██║╚██╗██║██║     %RESET%
echo %CYAN%  ╚██████╔╝██║   ██║       ███████║   ██║   ██║ ╚████║╚██████╗%RESET%
echo %CYAN%   ╚═════╝ ╚═╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═══╝ ╚═════╝%RESET%
echo.
echo %GRAY%  ╔══════════════════════════════════════════════════════════╗%RESET%
echo %GRAY%  ║  %YELLOW%⚡ Repo Cloner v2.0%GRAY%  •  %PURPLE%by Pugn0%GRAY%  •  %GREEN%GitHub Sync Tool%GRAY%  ║%RESET%
echo %GRAY%  ╚══════════════════════════════════════════════════════════╝%RESET%
echo.

:: ══════════════════════════════════════════
::   INPUT
:: ══════════════════════════════════════════
echo %CYAN%  ┌─────────────────────────────────────────┐%RESET%
echo %CYAN%  │%YELLOW%  CONFIGURAÇÃO DO CLONE                  %CYAN%│%RESET%
echo %CYAN%  └─────────────────────────────────────────┘%RESET%
echo.

echo %WHITE%  %ORANGE%►%RESET% %WHITE%Repositório PAI %GRAY%(origem dos arquivos)%RESET%
set /p "REPO_ORIGEM=  %CYAN%  URL: %RESET%"
echo.

echo %WHITE%  %ORANGE%►%RESET% %WHITE%Repositório DESTINO %GRAY%(onde vai subir)%RESET%
set /p "REPO_DESTINO=  %CYAN%  URL: %RESET%"
echo.

echo %WHITE%  %ORANGE%►%RESET% %WHITE%Nome da pasta %GRAY%(será criada aqui)%RESET%
set /p "NOME_PASTA=  %CYAN%  Pasta: %RESET%"
echo.

echo %WHITE%  %ORANGE%►%RESET% %WHITE%Mensagem do commit %GRAY%(Enter = "restore")%RESET%
set /p "COMMIT_MSG=  %CYAN%  Commit: %RESET%"
if "!COMMIT_MSG!"=="" set "COMMIT_MSG=restore"
echo.

:: ══════════════════════════════════════════
::   CONFIRMAÇÃO
:: ══════════════════════════════════════════
echo %GRAY%  ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄%RESET%
echo %GRAY%  PAI    →%RESET% %GREEN%!REPO_ORIGEM!%RESET%
echo %GRAY%  DESTINO→%RESET% %YELLOW%!REPO_DESTINO!%RESET%
echo %GRAY%  PASTA  →%RESET% %PURPLE%!NOME_PASTA!%RESET%
echo %GRAY%  COMMIT →%RESET% %CYAN%!COMMIT_MSG!%RESET%
echo %GRAY%  ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄%RESET%
echo.
set /p "CONFIRMA=  %YELLOW%  Confirmar? (S/N): %RESET%"
if /i "!CONFIRMA!" neq "S" (
    echo.
    echo %RED%  ✖ Operação cancelada.%RESET%
    echo.
    pause
    exit /b 0
)

echo.
cls

:: ══════════════════════════════════════════
::   TELA DE PROGRESSO
:: ══════════════════════════════════════════
echo.
echo %CYAN%  ██████╗ ██╗████████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗%RESET%
echo %CYAN%  ██╔════╝ ██║╚══██╔══╝    ██╔════╝╚██╗ ██╔╝████╗  ██║██╔════╝%RESET%
echo %CYAN%  ██║  ███╗██║   ██║       ███████╗ ╚████╔╝ ██╔██╗ ██║██║     %RESET%
echo %CYAN%  ██║   ██║██║   ██║       ╚════██║  ╚██╔╝  ██║╚██╗██║██║     %RESET%
echo %CYAN%  ╚██████╔╝██║   ██║       ███████║   ██║   ██║ ╚████║╚██████╗%RESET%
echo %CYAN%   ╚═════╝ ╚═╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═══╝ ╚═════╝%RESET%
echo.
echo %GRAY%  ╔══════════════════════════════════════════════════════════╗%RESET%
echo %GRAY%  ║  %YELLOW%⚡ Repo Cloner v2.0%GRAY%  •  %PURPLE%by Pugn0%GRAY%  •  %GREEN%GitHub Sync Tool%GRAY%  ║%RESET%
echo %GRAY%  ╚══════════════════════════════════════════════════════════╝%RESET%
echo.
echo %GRAY%  ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄%RESET%
echo %GRAY%  DESTINO→%RESET% %YELLOW%!REPO_DESTINO!%RESET%
echo %GRAY%  PASTA  →%RESET% %PURPLE%!NOME_PASTA!%RESET%
echo %GRAY%  COMMIT →%RESET% %CYAN%!COMMIT_MSG!%RESET%
echo %GRAY%  ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄%RESET%
echo.

:: ─── STEP 1 ───
echo %GRAY%  [%CYAN%1%GRAY%/7]%RESET% %WHITE%Criando pasta de destino%GRAY%...%RESET%
mkdir "!NOME_PASTA!" 2>nul
if errorlevel 1 (
    echo %RED%       ✖ ERRO: Pasta ja existe ou sem permissao%RESET%
    pause & exit /b 1
)
cd "!NOME_PASTA!"
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ─── STEP 2 ───
echo %GRAY%  [%CYAN%2%GRAY%/7]%RESET% %WHITE%Clonando repositorio PAI%GRAY%...%RESET%
git clone !REPO_ORIGEM! _temp_clone >nul 2>&1
if errorlevel 1 (
    echo %RED%       ✖ ERRO: Falha ao clonar. Verifique a URL%RESET%
    cd .. & rd /s /q "!NOME_PASTA!" 2>nul
    pause & exit /b 1
)
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ─── STEP 3 ───
echo %GRAY%  [%CYAN%3%GRAY%/7]%RESET% %WHITE%Copiando arquivos%GRAY%...%RESET%
robocopy _temp_clone . /E /XD _temp_clone\.git >nul 2>&1
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ─── STEP 4 ───
echo %GRAY%  [%CYAN%4%GRAY%/7]%RESET% %WHITE%Removendo temporarios%GRAY%...%RESET%
rd /s /q _temp_clone >nul 2>&1
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ─── STEP 5 ───
echo %GRAY%  [%CYAN%5%GRAY%/7]%RESET% %WHITE%Configurando repositorio local%GRAY%...%RESET%
if exist .git rd /s /q .git >nul 2>&1
git init >nul 2>&1
git remote add origin !REPO_DESTINO! >nul 2>&1
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ─── STEP 6 ───
echo %GRAY%  [%CYAN%6%GRAY%/7]%RESET% %WHITE%Commitando arquivos%GRAY%...%RESET%
git add . >nul 2>&1
git commit -m "!COMMIT_MSG!" >nul 2>&1
git branch -M main >nul 2>&1
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ─── STEP 7 ───
echo %GRAY%  [%CYAN%7%GRAY%/7]%RESET% %WHITE%Enviando para o GitHub%GRAY%...%RESET%
git push --force origin main >nul 2>&1
if errorlevel 1 (
    echo %RED%       ✖ ERRO: Falha no push. Verifique suas credenciais%RESET%
    pause & exit /b 1
)
echo %GREEN%       ✔ Concluido%RESET%
echo.

:: ══════════════════════════════════════════
::   SUCESSO
:: ══════════════════════════════════════════
echo %GREEN%  ╔══════════════════════════════════════════════════════════╗%RESET%
echo %GREEN%  ║                                                          ║%RESET%
echo %GREEN%  ║   ✔  SYNC CONCLUIDO COM SUCESSO!                        ║%RESET%
echo %GREEN%  ║                                                          ║%RESET%
echo %GREEN%  ╚══════════════════════════════════════════════════════════╝%RESET%
echo.
echo %GRAY%  Arquivos enviados para:%RESET%
echo %YELLOW%  !REPO_DESTINO!%RESET%
echo.

:: ══════════════════════════════════════════
::   OPÇÃO FINAL
:: ══════════════════════════════════════════
cd ..
echo %GRAY%  ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄%RESET%
echo.
echo %WHITE%  O que deseja fazer com a pasta %PURPLE%"!NOME_PASTA!"%WHITE%?%RESET%
echo.
echo %CYAN%    [1]%RESET% %WHITE%Apagar a pasta%RESET%
echo %CYAN%    [2]%RESET% %WHITE%Manter a pasta%RESET%
echo %CYAN%    [3]%RESET% %WHITE%Abrir no Explorer%RESET%
echo.
set /p "OPCAO=  %YELLOW%  Escolha (1/2/3): %RESET%"

if "!OPCAO!"=="1" (
    rd /s /q "!NOME_PASTA!" >nul 2>&1
    echo.
    echo %GREEN%  ✔ Pasta apagada com sucesso.%RESET%
) else if "!OPCAO!"=="3" (
    start explorer "!NOME_PASTA!"
    echo.
    echo %GREEN%  ✔ Abrindo pasta no Explorer...%RESET%
) else (
    echo.
    echo %GREEN%  ✔ Pasta mantida em:%RESET% %YELLOW%%CD%\!NOME_PASTA!%RESET%
)

echo.
echo %GRAY%  ┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄%RESET%
echo %GRAY%  by Pugn0  •  Git Sync Tool v2.0%RESET%
echo.
pause
exit /b 0