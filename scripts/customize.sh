#!/bin/bash

# Função para atualizar o prompt
update_prompt() {
    local shell_config=$1
    local prompt_style=$2

    echo "Atualizando prompt no arquivo $shell_config..."
    if [ "$prompt_style" = "default" ]; then
        echo 'export PS1="%F{green}%n@%m %F{cyan}%~%f %# "' >> "$shell_config"
    elif [ "$prompt_style" = "minimalist" ]; then
        echo 'export PS1="%F{yellow}%n@%m%f %# "' >> "$shell_config"
    else
        echo "Estilo de prompt não reconhecido!"
    fi
}

# Função para adicionar aliases personalizados
add_custom_aliases() {
    local shell_config=$1

    echo "Adicionando aliases personalizados em $shell_config..."
    echo "alias gs='git status'" >> "$shell_config"
    echo "alias ga='git add'" >> "$shell_config"
    echo "alias gl='git log'" >> "$shell_config"
}

# Função para escolher o tema
choose_theme() {
    local theme=$1
    echo "Escolhendo tema $theme..."

    if [ "$theme" = "default" ]; then
        cp "$HYPZ/themes/default.zsh-theme" "$HOME/.zsh-theme"
    elif [ "$theme" = "minimalist" ]; then
        cp "$HYPZ/themes/minimalist.zsh-theme" "$HOME/.zsh-theme"
    elif [ "$theme" = "vibrant" ]; then
        cp "$HYPZ/themes/vibrant.zsh-theme" "$HOME/.zsh-theme"
    else
        echo "Tema não encontrado!"
    fi
}

# Perguntar ao usuário qual personalização ele deseja
echo "Bem-vindo ao HYPZ Customizer!"
echo "Escolha uma opção de personalização:"
echo "1. Atualizar o prompt"
echo "2. Adicionar aliases personalizados"
echo "3. Escolher tema"
echo "4. Sair"

read -p "Digite o número da opção: " option

case $option in
    1)
        echo "Escolha o estilo de prompt (default/minimalist):"
        read prompt_style
        update_prompt "$HOME/.zshrc" "$prompt_style"
        ;;
    2)
        add_custom_aliases "$HOME/.zshrc"
        ;;
    3)
        echo "Escolha o tema (default/minimalist/vibrant):"
        read theme_choice
        choose_theme "$theme_choice"
        ;;
    4)
        echo "Saindo do personalizador."
        exit 0
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac

# Recarregar configurações do shell
echo "Recarregando configurações..."
source "$HOME/.zshrc"
echo "Personalização concluída!"
