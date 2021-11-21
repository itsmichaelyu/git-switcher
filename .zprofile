EMAIL=$(sed -n 7p ~/.gitconfig)
STREND=$(echo $((${#EMAIL}-4)))
STRBEG=$((STREND-2))
SUB=$(echo $EMAIL | cut -c$STRBEG-$STREND)
echo Git$SUB Set!

function chpwd() {
    emulate -L zsh
    # PUT BELOW PATH TO GIT SWITCHER SCRIPT
	
}