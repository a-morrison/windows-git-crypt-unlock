FROM microsoft/windowsservercore:ltsc2016
SHELL ["powershell", "-command"]

RUN [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    Invoke-WebRequest -UserAgent 'DockerCI' -outfile git-crypt.exe \
    https://github.com/oholovko/git-crypt-windows/releases/download/1.0.35/git-crypt.exe

RUN ./git-crypt.exe --version

ADD entrypoint.ps1 /entrypoint.ps1

ENTRYPOINT [ "/entrypoint.ps1" ]