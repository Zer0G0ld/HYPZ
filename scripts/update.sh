#!/bin/bash

echo "Atualizando HYPZ..."

# Atualizando o sistema
echo "Atualizando o sistema..."
sudo apt-get update -y && sudo apt-get upgrade -y

# Verificando se o Git está instalado e atualizando
echo "Verificando e atualizando o Git..."
if command -v git &> /dev/null; then
    echo "Git encontrado. Atualizando..."
    sudo apt-get install --only-upgrade git -y
else
    echo "Git não encontrado. Instalando..."
    sudo apt-get install git -y
fi

# Verificando se o ZSH está instalado e atualizando
echo "Verificando e atualizando o ZSH..."
if command -v zsh &> /dev/null; then
    echo "ZSH encontrado. Atualizando..."
    sudo apt-get install --only-upgrade zsh -y
else
    echo "ZSH não encontrado. Instalando..."
    sudo apt-get install zsh -y
fi

# Verificando e instalando dependências de pacotes adicionais (se houver)
echo "Verificando e instalando dependências adicionais..."
sudo apt-get install -y figlet

# Atualizando o repositório HYPZ
echo "Atualizando repositório HYPZ..."
git pull origin main

# Informando que o processo de atualização foi concluído
echo "Atualização concluída com sucesso!"
