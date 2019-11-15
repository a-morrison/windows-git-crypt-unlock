param (
    [Parameter(Mandatory = $true)]
    [string]$GIT_CRYPT_KEY
)

[System.Text.Encoding]::UtF8.GetString([System.Convert]::FromBase64String($GIT_CRYPT_KEY)) > ./git-crypt-key

.\git-crypt.exe unlock ./git-crypt-key

Remove-Item ./git-crypt-key