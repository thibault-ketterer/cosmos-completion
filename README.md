# description
bash and zsh completion for cosmos like cli (with a genereic approach)

tested on:

- namada: https://github.com/anoma/namada
- sided: https://side.one/
- osmosisd
- lavad

# features
parse the cli output to auto generate the completion (if the cli evolves, the completion will auto update itself)

# install and use
for bash

    wget https://raw.githubusercontent.com/thibault-ketterer/cosmos-completion/main/autocomplete-cosmos.bash
	mv autocomplete-cosmos.bash ~/
	echo "source ~/autocomplete-cosmos.bash" >> ~/.bashrc


for zsh

    wget https://raw.githubusercontent.com/thibault-ketterer/cosmos-completion/main/autocomplete-cosmos.zsh
	mv autocomplete-cosmos.zsh ~/
	echo "source ~/autocomplete-cosmos.zsh" >> ~/.zshrc

# demo with namada

![Demo asciinema namada completion](demo.gif "demo asciinema namada completion")
