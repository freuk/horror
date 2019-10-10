headless tools

```
curl https://nixos.org/nix/install | sh
nix-env -f https://github.com/freuk/horror/archive/master.zip -i
echo "export SHELL=zsh && exec zsh -l" >> ~/.bash_profile
```
