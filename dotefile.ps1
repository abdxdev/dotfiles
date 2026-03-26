Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Git
winget install --id Git.Git -e --source winget

# Peazip
winget install -e peazip

# Python
winget install Python
python --version
# Add pip to PATH
$scriptPath = python -c "import sysconfig; print(sysconfig.get_path('scripts'))"
$env:Path += ";$scriptPath"
python -m pip install black requests

# uv
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"

# Chocolatey
Start-Process powershell -Verb RunAs -ArgumentList "-c", "irm https://community.chocolatey.org/install.ps1|iex" -Wait

refreshenv

# Zen browser
Start-Process powershell -Verb RunAs -ArgumentList "-c", "choco install Zen-Team.Zen-Browser -y" -Wait

# FreeDownloadManager
Start-Process powershell -Verb RunAs -ArgumentList "-c", "choco install FreeDownloadManager.FreeDownloadManager -y" -Wait

# Scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

refreshenv

# Visual Studio Code
scoop bucket add extras
scoop install vscode

# QBittorrent Enhanced
scoop bucket add extras
scoop install qbittorrent-enhanced

# Node.js
scoop install nodejs
node --version
npm --version

# pnpm
npm install -g pnpm
pnpm setup

refreshenv

# Knip
pnpm install -g knip

# Nerd Font
scoop bucket add nerd-fonts
scoop install JetBrainsMono-NF

# Paint.NET
scoop install paint.net

# Oh My Posh
winget install JanDeDobbeleer.OhMyPosh --source winget
cp ".\abd_short.omp.json" "$env:POSH_THEMES_PATH\abd_short.omp.json"
'oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/abd_short.omp.json" | Invoke-Expression' >> $PROFILE

# PSReadLine
Install-Module -Name PSReadLine -Scope CurrentUser -Force
'Set-PSReadLineOption -PredictionSource History' >> $PROFILE
'Set-PSReadLineOption -PredictionViewStyle ListView' >> $PROFILE

# TinyTeX
wget "https://github.com/rstudio/tinytex-releases/releases/download/daily/TinyTeX-1.zip" -OutFile "$env:TEMP\TinyTeX.zip"
Expand-Archive -Force -Path "$env:TEMP\TinyTeX.zip" -DestinationPath $env:APPDATA
Remove-Item "$env:TEMP\TinyTeX.zip"
$env:PATH += ";$env:APPDATA\TinyTeX\bin\windows"
tlmgr path add
refreshenv
tlmgr option repository ctan
tlmgr postaction install script xetex

refreshenv

# markdown-latex-pdf-builder
tlmgr update --self
tlmgr install adjustbox csvsimple datetime emoji endnotes fancyhdr fmtcount footmisc grfext hyphenat lineno listings lua-ul markdown minted paralist pdfcol soul tcolorbox tikzfill titlesec titling tocloft todonotes ulem upquote
python -m pip install Pygments
wget https://github.com/abdxdev/markdown-latex-pdf-builder/archive/refs/heads/main.zip -OutFile "$env:TEMP\main.zip"
Expand-Archive -Force -Path "$env:TEMP\main.zip" -DestinationPath "$env:APPDATA\markdown-latex-pdf-builder"
Remove-Item "$env:TEMP\main.zip"
Copy-Item "$env:APPDATA\markdown-latex-pdf-builder\markdown-latex-pdf-builder-main\default.json" "$env:APPDATA\markdown-latex-pdf-builder\default.json"
pnpm install -g @mermaid-js/mermaid-cli
python -m pip install numpy matplotlib