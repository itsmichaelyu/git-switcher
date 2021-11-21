#!/bin/zsh

if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then
	URL=$(sed -n 9p .git/config)
	SITE=$(echo $URL | cut -c12-17)
	EMAIL=$(sed -n 7p ~/.gitconfig)
	STREND=$(echo $((${#EMAIL}-4)))
	STRBEG=$((STREND-2))
	SUB=$(echo $EMAIL | cut -c$STRBEG-$STREND)
	if [[ "$SITE" = "gitlab" && "git$SUB" != gitlab ]]; then		
		git config --global user.email GITLAB_EMAIL
		git config --global user.signingkey GITLAB_SIGNING_KEY
		echo "Switched to GitLab!"
	elif [[ "$SITE" = "github" && "git$SUB" != github ]]; then
		git config --global user.email GITHUB_EMAIL
		git config --global user.signingkey GITHUB_SIGNING_KEY
		echo "Switched to GitHub!"
	else
		:
	fi	
else
	:
fi