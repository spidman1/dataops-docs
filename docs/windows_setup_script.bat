echo on

REM Installing Chocolatey - "The package manager for Windows"...
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
REM Chocolatey install complete.

REM Installing Windows features....
choco install -y --no-progress --source windowsfeatures ^
    Microsoft-Hyper-V

REM Restart may be required at this point. Attempting to continue anyway without restarting...
REM If you experience problems, simply restart your machine and then rerun this script.

REM Custom Git Install
choco install --no-progress -y ^
    git.install --params "/GitOnlyOnPath /SChannel /NoAutoCrlf /WindowsTerminal"

REM Software Installs (Other)
choco install --no-progress -y ^
    7zip ^
    azure-cli ^
    choco-protocol-support ^
    chocolateygui ^
    dbeaver ^
    docker-desktop ^
    filezilla ^
    github-desktop ^
    microsoft-teams.install ^
    microsoftazurestorageexplorer ^
    python3 ^
    r.project ^
    sudo ^
    terraform ^
    vscode

REM Temporary availability issues (404 errors)
choco install --no-progress -y powerbi
REM Requires windows updates ()
choco install --no-progress -y microsoft-windows-terminal

REM Python packages
python -m pip install ^
    awscli ^
    pylama ^
    pytest ^
    pytest-cov ^
    nose ^
    s3fs

REM Note: additional scripts are available for SQL Sever Management Studio and WSL:
REM     - 'windows_install_wsl.bat`  - choco://wsl
REM     - `windows_install_ssms.bat` - choco://sql-server-management-studio
REM
REM Install script complete. If this is your first time installing, a manual restart is required at this point.
REM If you experience any problems after restarting, you can always rerun this script.

pause