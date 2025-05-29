@echo off

cls

rd /s /q .\dist
md .\dist
cd .\dist

call "C:\Windows\py.exe" -3.11 -m venv .\venv
call ".\venv\Scripts\activate.bat"
call ".\venv\Scripts\python.exe" -m pip install --upgrade pip
call ".\venv\Scripts\python.exe" -m pip install nuitka
call ".\venv\Scripts\python.exe" -m nuitka ^
--msvc=latest ^
--assume-yes-for-downloads ^
--follow-imports ^
--standalone ^
--windows-icon-from-ico=..\src\logo_icon.ico ^
--product-name=Zipper ^
--product-version=1.0.0 ^
--file-description="Zipper-v1.0.0" ^
--copyright="(C) 2025 yuito723(https://github.com/yuito723)" ^
--output-filename=Zipper ^
..\src\zipper.py
call ".\venv\Scripts\deactivate.bat"
move /y .\zipper.dist .\Zipper-v1.0.0_windows_amd64
rd /s /q .\venv .\zipper.build
copy /y ..\src\readme.txt ..\dist\Zipper-v1.0.0_windows_amd64\readme.txt

call ".\Zipper-v1.0.0_windows_amd64\Zipper.exe" "Zipper-v1.0.0_windows_amd64" ".\Zipper-v1.0.0_windows_amd64"

cd ..\

echo Completed!
pause
exit
