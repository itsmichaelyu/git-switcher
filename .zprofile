for i in {1..$[ $(wc -l < ~/.gitconfig) ]}; do
	EMAIL=$(sed -n $[$i]p ~/.gitconfig)
	SUBEMAIL=$(echo $EMAIL | cut -c2-6)
	if [[ "$SUBEMAIL" = "email" ]]; then
		break
	fi
done

STREND=$(echo $((${#EMAIL}-4)))
STRBEG=$((STREND-2))
SUB=$(echo $EMAIL | cut -c$STRBEG-$STREND)
echo Git$SUB Set!

function chpwd() {
    emulate -L zsh
    # REPLACE PATH WITH YOUR PATH TO GIT SWITCHER SCRIPT
    # EX:
    # ~/.oh-my-zsh/custom/gitSwitcher.zsh 2>/dev/null
    PATH 2>/dev/null	
}
