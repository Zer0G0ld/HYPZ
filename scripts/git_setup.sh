#!/bin/bash

# Função para configurar o Git
configure_git() {
    echo "Configurando o Git..."

    # Definindo o nome do usuário no Git
    read -p "Digite seu nome para o Git: " name
    git config --global user.name "$name"

    # Definindo o e-mail do usuário no Git
    read -p "Digite seu e-mail para o Git: " email
    git config --global user.email "$email"

    # Verificando se a configuração foi bem-sucedida
    echo "Git configurado com sucesso!"
    echo "Nome: $(git config --global user.name)"
    echo "E-mail: $(git config --global user.email)"
}

# Verificando se as configurações já existem
echo "Verificando configurações atuais do Git..."
if git config --global user.name &>/dev/null && git config --global user.email &>/dev/null; then
    echo "Configurações de Git já definidas:"
    echo "Nome: $(git config --global user.name)"
    echo "E-mail: $(git config --global user.email)"
    
    # Perguntando se o usuário deseja atualizar
    read -p "Deseja atualizar as configurações de Git? (y/n): " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        configure_git
    else
        echo "Manutenção das configurações atuais."
    fi
else
    configure_git
fi
