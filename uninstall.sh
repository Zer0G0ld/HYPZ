#!/bin/bash

echo "Iniciando a desinstalação do HYPZ..."

# Criar backup de arquivos de configuração
echo "Verificando arquivos de configuração..."

if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.backup
    echo "~/.bashrc foi movido para ~/.bashrc.backup"
else
    echo "~/.bashrc não encontrado. Nenhuma alteração realizada."
fi

if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
    echo "~/.zshrc foi movido para ~/.zshrc.backup"
else
    echo "~/.zshrc não encontrado. Nenhuma alteração realizada."
fi

# Verifica se o ZSH está em uso e pergunta se o usuário deseja removê-lo
if command -v zsh &> /dev/null; then
    read -p "Você está usando o ZSH. Deseja removê-lo? (y/n): " REMOVE_ZSH
    if [ "$REMOVE_ZSH" = "y" ]; then
        sudo apt-get remove --purge -y zsh
        echo "ZSH foi removido com sucesso!"
    else
        echo "ZSH não foi removido."
    fi
else
    echo "ZSH não está instalado."
fi

# Oferece remover o Oh My Zsh se estiver presente
if [ -d "$HOME/.oh-my-zsh" ]; then
    read -p "Oh My Zsh está instalado. Deseja removê-lo? (y/n): " REMOVE_OHMYZSH
    if [ "$REMOVE_OHMYZSH" = "y" ]; then
        rm -rf ~/.oh-my-zsh
        echo "Oh My Zsh foi removido com sucesso!"
    else
        echo "Oh My Zsh não foi removido."
    fi
else
    echo "Oh My Zsh não está instalado."
fi

echo "Desinstalação concluída."
