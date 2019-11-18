# Github Action: git-crypt unlock on Windows
Github action based on [sliteteam/github-action-git-crypt-unlock](https://github.com/sliteteam/github-action-git-crypt-unlock) but for use on Windows envrionments. 
Most of the code in this repository is adapted from said repository to work
in a Windows container.

## Usage
```yaml
jobs:
  unlock:
    name: Unlock with git-crypt
    runs-on: windows-latest
    steps:
    - uses: actions/checkout@master
    - name: Unlock
      uses: a-morrison/windows-git-crypt-unlock@1.0.0
      with:
        GIT_CRYPT_KEY: ${{ secrets.GIT_CRYPT_KEY }}
```

## Secrets
`GIT_CRYPT_KEY` *Required* Base64 encoded git-crypt key file. 