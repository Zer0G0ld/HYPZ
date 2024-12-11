#!/bin/bash

# Função para exibir uma mensagem de boas-vindas
welcome_message() {
    echo -e "\e[32mBem-vindo ao HYPZ Customizer!\e[0m"
}

# Função para atualizar o prompt
update_prompt() {
    local shell_config=$1
    local prompt_style=$2

    echo -e "\e[34mAtualizando prompt no arquivo $shell_config...\e[0m"
    
    if [ ! -f "$shell_config" ]; then
        echo -e "\e[31mArquivo de configuração não encontrado: $shell_config\e[0m"
        return 1
    fi

    if [ "$prompt_style" = "default" ]; then
        echo 'export PS1="%F{green}%n@%m %F{cyan}%~%f %# "' >> "$shell_config"
    elif [ "$prompt_style" = "minimalist" ]; then
        echo 'export PS1="%F{yellow}%n@%m%f %# "' >> "$shell_config"
    else
        echo -e "\e[31mEstilo de prompt não reconhecido! Escolha entre 'default' ou 'minimalist'.\e[0m"
        return 1
    fi
    echo -e "\e[32mPrompt atualizado com sucesso!\e[0m"
}

# Função para adicionar aliases personalizados
add_custom_aliases() {
    local shell_config=$1

    echo -e "\e[34mAdicionando aliases personalizados em $shell_config...\e[0m"

    if [ ! -f "$shell_config" ]; then
        echo -e "\e[31mArquivo de configuração não encontrado: $shell_config\e[0m"
        return 1
    fi

    echo "alias gs='git status'" >> "$shell_config"
    echo "alias ga='git add'" >> "$shell_config"
    echo "alias gl='git log'" >> "$shell_config"

    echo -e "\e[32mAliases personalizados adicionados com sucesso!\e[0m"
}

# Função para escolher o tema
choose_theme() {
    local theme=$1
    echo -e "\e[34mEscolhendo tema: $theme...\e[0m"

    if [ ! -d "$HYPZ/themes" ]; then
        echo -e "\e[31mDiretório de temas não encontrado! Verifique sua instalação do HYPZ.\e[0m"
        return 1
    fi

    if [ "$theme" = "default" ]; then
        cp "$HYPZ/themes/default.zsh-theme" "$HOME/.zsh-theme"
    elif [ "$theme" = "minimalist" ]; then
        cp "$HYPZ/themes/minimalist.zsh-theme" "$HOME/.zsh-theme"
    elif [ "$theme" = "vibrant" ]; then
        cp "$HYPZ/themes/vibrant.zsh-theme" "$HOME/.zsh-theme"
    else
        echo -e "\e[31mTema não encontrado! Escolha entre 'default', 'minimalist' ou 'vibrant'.\e[0m"
        return 1
    fi
    echo -e "\e[32mTema $theme aplicado com sucesso!\e[0m"
}

# Função para recarregar configurações do shell
reload_shell() {
    echo -e "\e[34mRecarregando configurações do shell...\e[0m"
    source "$HOME/.zshrc"
    echo -e "\e[32mConfigurações recarregadas com sucesso!\e[0m"
}

# Função para exibir o menu e processar a escolha do usuário
choose_option() {
    echo -e "\nEscolha uma opção de personalização:"
    echo "1. Atualizar o prompt"
    echo "2. Adicionar aliases personalizados"
    echo "3. Escolher tema"
    echo "4. Sair"
    read -p "Digite o número da opção: " option
}

# Função principal para gerenciar o menu
customize() {
    while true; do
        choose_option
        
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
                echo -e "\e[32mSaindo do personalizador. Até logo!\e[0m"
                break
                ;;
            *)
                echo -e "\e[31mOpção inválida! Por favor, escolha 1, 2, 3 ou 4.\e[0m"
                ;;
        esac

        # Se o arquivo foi modificado, recarregar o shell
        echo -e "\e[34mDeseja recarregar as configurações do shell agora? (y/n)\e[0m"
        read reload_choice
        if [[ "$reload_choice" =~ ^[Yy]$ ]]; then
            reload_shell
        fi
    done
}

# Iniciar o processo
welcome_message
customize
