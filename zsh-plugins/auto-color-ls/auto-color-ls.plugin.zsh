auto-color-ls() {
	emulate -L zsh
	echo
	colorls -A --sd
}

chpwd_functions=(auto-color-ls $chpwd_functions)
