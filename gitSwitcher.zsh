#!/bin/zsh

if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ]; then

	for i in {1..$[ $(wc -l < .git/config) ]}; do
		URL=$(sed -n $[$i]p .git/config)
		SUBURL=$(echo $URL | cut -c2-4)
		if [[ "$SUBURL" = "url" ]]; then
			break
		fi
	done

	for i in {1..$[ $(wc -l < ~/.gitconfig)]}; do
		EMAIL=$(sed -n $[$i]p ~/.gitconfig)
		SUBEMAIL=$(echo $EMAIL | cut -c2-6)
		if [[ "$SUBEMAIL" = "email" ]]; then
			break
		fi
	done
	
	STREND=$(echo $((${#EMAIL}-4)))
	STRBEG=$((STREND-2))
	SUB=$(echo $EMAIL | cut -c$STRBEG-$STREND)
	
	for i in {1..$[ ${#URL} ]}; do
		SITE=$(echo $URL | cut -c$[$i]-$[$i+5])
		if [[ "$SITE" = "gitlab" ]]; then
			if [[ "git$SUB" != gitlab ]]; then
				git config --global user.email GITLAB_EMAIL
				git config --global user.signingkey GITLAB_SIGNING_KEY
				echo "Switched to GitLab!"
			fi
			break
		elif [[ "$SITE" = "github" ]]; then
			if [[ "git$SUB" != github ]]; then
				git config --global user.email GITHUB_EMAIL
				git config --global user.signingkey GITHUB_SIGNING_KEY
				echo "Switched to GitHub!"
			fi
			break
		fi
	done
fi
