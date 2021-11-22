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
    # PUT BELOW PATH TO GIT SWITCHER SCRIPT
	
}
