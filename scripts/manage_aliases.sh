#!/bin/bash

# Função para adicionar alias
add_alias() {
    local alias_name=$1
    local alias_command=$2
    local shell_config_file=$3

    if ! grep -q "$alias_name" "$shell_config_file"; then
        echo "Adicionando alias $alias_name..."
        echo "alias $alias_name='$alias_command'" >> "$shell_config_file"
    else
        echo "Alias $alias_name já existe em $shell_config_file."
    fi
}

# Detectando qual shell está em uso
SHELL_NAME=$(basename $SHELL)

# Adicionando aliases para o shell
if [ "$SHELL_NAME" = "bash" ]; then
    CONFIG_FILE=~/.bashrc
elif [ "$SHELL_NAME" = "zsh" ]; then
    CONFIG_FILE=~/.zshrc
else
    echo "Shell não suportado. Apenas Bash e ZSH são suportados."
    exit 1
fi

# Adicionando aliases comuns
add_alias "ll" "ls -alF" "$CONFIG_FILE"
add_alias "gs" "git status" "$CONFIG_FILE"
add_alias "gd" "git diff" "$CONFIG_FILE"
add_alias "ga" "git add" "$CONFIG_FILE"
add_alias "gl" "git log" "$CONFIG_FILE"
add_alias "gco" "git checkout" "$CONFIG_FILE"

# Confirmando que os aliases foram adicionados
echo "Aliases adicionados com sucesso ao $CONFIG_FILE."

# Recarregando o arquivo de configuração para aplicar os aliases
echo "Recarregando as configurações do shell..."
source "$CONFIG_FILE"
