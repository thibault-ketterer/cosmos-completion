# description
bash and zsh completion for namada cli

https://github.com/anoma/namada

# features
parse namada cli output to auto generate the completion (if the namada cli evolves, the completion will auto update itself)

# install and use
for bash

    wget https://raw.githubusercontent.com/thibault-ketterer/namada-completion/main/autocomplete-namada.bash
	mv autocomplete-namada.bash ~/
	echo "source ~/autocomplete-namada.bash" >> ~/.bashrc


for zsh

    wget https://raw.githubusercontent.com/thibault-ketterer/namada-completion/main/autocomplete-namada.zsh
	mv autocomplete-namada.zsh ~/
	echo "source ~/autocomplete-namada.zsh" >> ~/.zshrc

# demo

![Demo asciinema namada completion](demo.gif "demo asciinema namada completion")
