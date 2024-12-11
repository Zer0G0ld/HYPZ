#!/bin/bash

# Função para verificar o status do Git
git_status() {
    echo "Verificando status do repositório Git..."
    git status
}

# Função para verificar a branch atual
current_branch() {
    echo "Branch atual: $(git rev-parse --abbrev-ref HEAD)"
}

# Função para verificar commits pendentes
pending_commits() {
    echo "Commits pendentes..."
    git log --oneline --decorate --stat
}

# Função para limpar o terminal
clear_terminal() {
    echo "Limpando o terminal..."
    clear
}

# Menu de opções
echo "Escolha uma opção do Git Status Helper:"
echo "1. Verificar status do repositório"
echo "2. Verificar branch atual"
echo "3. Verificar commits pendentes"
echo "4. Limpar o terminal"
echo "5. Sair"

read -p "Digite o número da opção: " option

case $option in
    1)
        git_status
        ;;
    2)
        current_branch
        ;;
    3)
        pending_commits
        ;;
    4)
        clear_terminal
        ;;
    5)
        echo "Saindo do Git Status Helper."
        exit 0
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac
