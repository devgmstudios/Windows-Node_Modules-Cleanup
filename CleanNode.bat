@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Count total directories
SET /A "dirCount=0"
FOR /d /r . %%d IN (node_modules) DO @IF EXIST "%%d" SET /A "dirCount+=1"

REM Delete directories and show progress
SET /A "progress=0"
FOR /d /r . %%d IN (node_modules) DO (
    IF EXIST "%%d" (
        SET /A "progress+=1"
        SET /A "percent=progress*100/dirCount"
        ECHO Deleting: "%%d" [!percent!%%]
        rd /s /q "%%d"
    )
)

ENDLOCAL
