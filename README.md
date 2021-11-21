# git-switcher
automatically switch between github and gitlab with zsh

## Requirements
zsh

> This script would probably work with bash, but requires editing of file types and config files
> 
> You would have to put the .zprofile code into .bash_profile and change gitSwitcher.zsh to gitSwitcher.sh
>
> The "chpwd" function is unique to zsh though and would require finding an alternative in bash

## Setup

This will require editing of the gitSwitcher.zsh and .zprofile files

The URL line will probably work, but depends on how your git is configured
You will likely have to test this to see if it works or not

The email line will depend on what line your email is located in your git config file

To edit the line number your email or url is located at just change the `9p` or `7p` to the correct number
```
URL=$(sed -n 9p .git/config)
EMAIL=$(sed -n 7p ~/.gitconfig)
```


To add your email and GPG key that you want to automatically switch between
Change the GITLAB_EMAIL to your email and so on for the rest of them in the gitSwitcher.zsh file

> GPG key line could be commented out if you do not use GPG

```
if [[ "$SITE" = "gitlab" && "git$SUB" != gitlab ]]; then		
		git config --global user.email GITLAB_EMAIL
		git config --global user.signingkey GITLAB_SIGNING_KEY
		echo "Switched to GitLab!"
	elif [[ "$SITE" = "github" && "git$SUB" != github ]]; then
		git config --global user.email GITHUB_EMAIL
		git config --global user.signingkey GITHUB_SIGNING_KEY
		echo "Switched to GitHub!"
```

More sites could also be added as needed, by simply expanding the elif

Finally add the path to your gitSwitcher.zsh script in to the .zprofile
```
function chpwd() {
    emulate -L zsh
    # PUT BELOW PATH TO GIT SWITCHER SCRIPT
	
}
```
