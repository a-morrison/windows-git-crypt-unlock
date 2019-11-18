FROM microsoft/windowsservercore:ltsc2016

SHELL ["powershell", "-command"]

# Install Chocolatey
RUN Set-ExecutionPolicy Bypass -Scope Process -Force; \
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Git
RUN choco install git -y

# Download git-crypt for windows
RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    Invoke-WebRequest -UserAgent 'DockerCI' -outfile git-crypt.exe \
    https://github.com/oholovko/git-crypt-windows/releases/download/1.0.35/git-crypt.exe

ADD entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT [ "/entrypoint.ps1" ]