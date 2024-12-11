#!/bin/bash

# Função para exibir uma mensagem de boas-vindas com estilo
welcome_message() {
    clear
    figlet "HYPZ - Setup" | lolcat
    echo -e "\e[32mBem-vindo ao HYPZ Setup! Vamos configurar seu shell de uma forma divertida e estilosa!\e[0m"
    echo ""
}

# Função para instalar dependências
install_dependencies() {
    echo -e "\e[34mInstalando dependências necessárias...\e[0m"
    sudo apt update -y
    sudo apt install -y figlet zsh cowsay lolcat curl git
}

# Função para instalar o Oh My Zsh
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "\e[34mInstalando Oh My Zsh...\e[0m"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo -e "\e[32mOh My Zsh já está instalado!\e[0m"
    fi
}

# Função para configurar o Bash
configure_bash() {
    echo -e "\e[33mConfigurando o .bashrc...\e[0m"
    if [ -f "$HOME/.bashrc" ]; then
        echo -e "\e[31m.bashrc já existe. Fazendo backup...\e[0m"
        mv "$HOME/.bashrc" "$HOME/.bashrc.backup"
    fi
    cp ./config/bashrc.template "$HOME/.bashrc"
    echo -e "\e[32m.bashrc configurado com sucesso!\e[0m"
}

# Função para configurar o ZSH
configure_zsh() {
    echo -e "\e[33mConfigurando o .zshrc...\e[0m"
    if [ -f "$HOME/.zshrc" ]; then
        echo -e "\e[31m.zshrc já existe. Fazendo backup...\e[0m"
        mv "$HOME/.zshrc" "$HOME/.zshrc.backup"
    fi
    cp ./config/zshrc.template "$HOME/.zshrc"
    echo -e "\e[32m.zshrc configurado com sucesso!\e[0m"

    # Instalar temas e plugins para o ZSH
    echo -e "\e[34mInstalando temas e plugins do ZSH...\e[0m"
    mkdir -p "$HOME/.oh-my-zsh/themes"
    cp ./themes/* "$HOME/.oh-my-zsh/themes/"

    mkdir -p "$HOME/.oh-my-zsh/plugins"
    cp ./plugins/* "$HOME/.oh-my-zsh/plugins/"

    # Instalar o Oh My Zsh se ainda não estiver instalado
    install_oh_my_zsh
}

# Função para verificar se a instalação foi bem-sucedida
verify_installation() {
    if [ $? -eq 0 ]; then
        echo -e "\e[32mInstalação concluída com sucesso!\e[0m"
    else
        echo -e "\e[31mOcorreu um erro durante a instalação. Por favor, verifique os logs.\e[0m"
        exit 1
    fi
}

# Menu de escolha de shell
choose_shell() {
    while true; do
        echo -e "\e[32mEscolha o shell que deseja usar:\e[0m"
        echo "1) Bash"
        echo "2) ZSH"
        echo -e "\e[34mDigite o número correspondente (1 ou 2):\e[0m"
        read -p "Sua escolha: " shell_choice

        if [[ "$shell_choice" == "1" || "$shell_choice" == "2" ]]; then
            break
        else
            echo -e "\e[31mOpção inválida! Por favor, escolha 1 ou 2.\e[0m"
        fi
    done
}

# Função para aplicar a escolha do shell
apply_choice() {
    if [ "$shell_choice" -eq 1 ]; then
        echo -e "\e[33mVocê escolheu o Bash!\e[0m"
        install_dependencies
        configure_bash
        verify_installation
    elif [ "$shell_choice" -eq 2 ]; then
        echo -e "\e[33mVocê escolheu o ZSH!\e[0m"
        install_dependencies
        configure_zsh
        verify_installation
        # Mudar para ZSH se escolhido
        chsh -s $(which zsh)
        echo -e "\e[32mZSH será o seu shell padrão! Reinicie o terminal para aplicar.\e[0m"
    fi
}

# Finalização
finish_up() {
    echo -e "\e[32mInstalação concluída com sucesso! Agora é só se divertir com o seu novo shell!\e[0m"
    echo -e "\e[33mReinicie o terminal para que todas as mudanças tenham efeito.\e[0m"
}

# Iniciar o processo
welcome_message
choose_shell
apply_choice
finish_up
