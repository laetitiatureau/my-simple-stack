@echo off

set bashfile=aux_configIntelliJ2016_lecteurZ.bash

IF EXIST "C:\Program Files\Git\bin\bash.exe" (
    cd "C:\Program Files\Git"
    "C:\Program Files\Git\bin\bash.exe" --login -i "%~dp0%bashfile%" "%~dp0"
) ELSE (
    cd "C:\Git"
    "C:\Git\bin\bash.exe" --login -i "%~dp0%bashfile%" "%~dp0"
)
