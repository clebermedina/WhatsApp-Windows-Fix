@echo off
chcp 65001 >nul >nul 2>&1
title WhatsApp Fix - Cleber Medina 2025
mode con cols=98 lines=50
color 0A
cls

:language
cls
echo.
echo   ╔══════════════════════════════════════════════════════════════════════╗
echo   ║               SELECT LANGUAGE / SELECIONE O IDIOMA                   ║
echo   ║                                                                      ║
echo   ║   [1] English                                                        ║
echo   ║   [2] Português (Brasil)                                             ║
echo   ║                                                                      ║
echo   ╚══════════════════════════════════════════════════════════════════════╝
echo.
set /p "lang=   > "
if "%lang%"=="1" goto en
if "%lang%"=="2" goto pt
goto language

:en
set "T=WHATSAPP FREEZE FIX FOR WINDOWS - 2025"
set "M1=Install service (hidden)"
set "M2=Remove service"
set "M3=About"
set "M4=Exit"
set "P=Choose"
set "OK=INSTALLED SUCCESSFULLY"
set "SM=WhatsApp now runs perfectly smooth"
set "RM=REMOVED SUCCESSFULLY"
set "THX=If this tool was useful, buy me a coffee :)"
goto main

:pt
set "T=FIX TRAVAMENTO WHATSAPP APP NO WINDOWS - 2025"
set "M1=Instalar servico (oculto)"
set "M2=Remover servico"
set "M3=Sobre"
set "M4=Sair"
set "P=Escolha"
set "OK=INSTALADO COM SUCESSO"
set "SM=WhatsApp rodando liso para sempre"
set "RM=REMOVIDO COM SUCESSO"
set "THX=Se foi util pra voce, me pague um cafe :)"

:main
set "PASTA=%APPDATA%\WhatsAppFix"

:menu
cls
echo.
echo       **       ** **      **     **     **********  ********     **     *******  *******        ******** ** **     **
echo      /**      /**/**/**     /**    ****   /////**///  **//////     ****   /**////**/**////**      /**///// /**//**   ** 
echo      /**   *  /**/**     /**   **//**      /**    /**          **//**  /**   /**/**   /**      /**      /** //** **  
echo     /**  *** /**/**********  **  //**     /**    /*********  **  //** /******* /*******       /******* /**  //***   
echo     /** **/**/**/**//////** **********    /**    ////////** **********/**////  /**////        /**////  /**   **/**  
echo    /**** //****/**     /**/**//////**    /**           /**/**//////**/**      /**            /**      /**  ** //** 
echo    /**/   ///**/**     /**/**     /**    /**     ******** /**     /**/**      /**            /**      /** **   //**
echo    //       // //      // //      //     //     ////////  //      // //       //             //       // //     // 
echo.
echo   ════════════════════════════════════════════════════════════════════════════════
echo   %T%
echo   ════════════════════════════════════════════════════════════════════════════════
echo.
echo   [1] %M1%
echo   [2] %M2%
echo   [3] %M3%
echo   [4] %M4%
echo.
echo   ─────────────────────────────────────────────────────────────────────────────────
set /p "sel=   %P% > "
if "%sel%"=="1" goto install
if "%sel%"=="2" goto remove
if "%sel%"=="3" goto about
if "%sel%"=="4" goto :eof
echo   Invalid option / Opcao invalida
timeout /t 2 >nul
goto menu

:install
cls
echo   Installing in: %PASTA%
echo.
net session >nul 2>&1 || (echo   ERROR: Run as Administrator && pause && goto menu)
mkdir "%PASTA%" >nul 2>&1 && cd /d "%PASTA%"

powershell -Command "iwr 'https://nssm.cc/ci/nssm-2.24-103-gdee49fc.zip' -OutFile 'n.zip'" >nul 2>&1
powershell -Command "Expand-Archive -Force 'n.zip' '.'" >nul 2>&1
move "nssm-2.24-103-gdee49fc\win64\nssm.exe" . >nul 2>&1
rmdir /s /q "nssm-2.24-103-gdee49fc" >nul 2>&1 && del n.zip >nul 2>&1

(
echo @echo off
echo :loop
echo tasklist /fi "imagename eq WhatsApp.exe" 2^>nul ^| find /i "WhatsApp.exe" ^>nul
echo if %%errorlevel%%==0 taskkill /f /im RuntimeBroker.exe >nul 2>&1
echo timeout /t 6 >nul
echo goto loop
) > kill.bat

nssm.exe install WhatsAppFixRuntime "%PASTA%\kill.bat" >nul
nssm.exe set WhatsAppFixRuntime AppDirectory "%PASTA%" >nul
nssm.exe set WhatsAppFixRuntime DisplayName "WhatsApp Fix" >nul
nssm.exe set WhatsAppFixRuntime Description "Cleber Medina 2025" >nul
nssm.exe set WhatsAppFixRuntime Start SERVICE_AUTO_START >nul
nssm.exe start WhatsAppFixRuntime >nul

echo.
echo   ╔══════════════════════════════════════════╗
echo   ║          %OK%          ║
echo   ║       %SM%       ║
echo   ╚══════════════════════════════════════════╝
pause >nul
goto about

:remove
cls
if exist "%PASTA%\nssm.exe" (
    "%PASTA%\nssm.exe" stop WhatsAppFixRuntime >nul 2>&1
    "%PASTA%\nssm.exe" remove WhatsAppFixRuntime confirm >nul 2>&1
    rmdir /s /q "%PASTA%" >nul 2>&1
    echo   %RM%
) else echo   Already removed
pause >nul
goto about

:about
cls
echo.
echo       **       ** **      **     **     **********  ********     **     *******  *******        ******** ** **     **
echo      /**      /**/**     /**    ****   /////**///  **//////     ****   /**////**/**////**      /**///// /**//**   ** 
echo      /**   *  /**/**     /**   **//**      /**    /**          **//**  /**   /**/**   /**      /**      /** //** **  
echo     /**  *** /**/**********  **  //**     /**    /*********  **  //** /******* /*******       /******* /**  //***   
echo     /** **/**/**/**//////** **********    /**    ////////** **********/**////  /**////        /**////  /**   **/**  
echo    /**** //****/**     /**/**//////**    /**           /**/**//////**/**      /**            /**      /**  ** //** 
echo    /**/   ///**/**     /**/**     /**    /**     ******** /**     /**/**      /**            /**      /** **   //**
echo    //       // //      // //      //     //     ////////  //      // //       //             //       // //     // 
echo.
echo   ════════════════════════════════════════════════════════════════════════════════
echo   %T%
echo   ════════════════════════════════════════════════════════════════════════════════
echo.
if "%lang%"=="1" (
    echo   HOW IT WORKS:
    echo   - WhatsApp Store version freezes → RuntimeBroker eats CPU/RAM
    echo   - Service checks every 6s and safely kills RuntimeBroker
    echo   - Windows recreates it instantly → WhatsApp unfreezes
    echo   - 100% safe and invisible
) else (
    echo   COMO FUNCIONA:
    echo   - WhatsApp da Store trava → RuntimeBroker consome tudo
    echo   - Servico mata ele a cada 6s (com seguranca)
    echo   - Windows recria automaticamente → WhatsApp destrava na hora
    echo   - 100% seguro e invisivel
)
echo.
echo   %THX%
echo   PIX ou PayPal → clebermedina@gmail.com
echo.
echo   Created by Cleber Medina - 2025
echo   linkedin.com/in/clebermedina
echo.
echo   ─────────────────────────────────────────────────────────────────────────────────
pause >nul
goto menu