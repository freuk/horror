For private packages:
```
sudo socat UNIX-LISTEN:/tmp/hax,fork,mode=0070,group=nixbld UNIX-CLIENT:$SSH_AUTH_SOCK
nix-build -A <packagename> -I ssh-auth-sock=/tmp/hax
```
