#!/bin/bash

echo "Detectando o shell..."

# Detectar o shell atual
SHELL=$(basename $SHELL)

# Verifica o shell e configura os arquivos correspondentes
if [ "$SHELL" = "bash" ]; then
    # Copia o template de bashrc para o diretório do usuário
    cp config/bashrc.template ~/.bashrc
    echo ".bashrc configurado com sucesso!"
elif [ "$SHELL" = "zsh" ]; then
    # Copia o template de zshrc para o diretório do usuário
    cp config/zshrc.tamplate ~/.zshrc
    echo ".zshrc configurado com sucesso!"
else
    echo "Shell não suportado. Apenas Bash e ZSH são suportados."
    exit 1
fi

# Instalar dependências
echo "Instalando dependências necessárias..."
sudo apt-get update -y
sudo apt-get install -y zsh figlet

# Verifica se o ZSH foi instalado corretamente
if ! command -v zsh &> /dev/null; then
    echo "Erro: O ZSH não foi instalado corretamente."
    exit 1
else
    echo "ZSH instalado com sucesso!"
fi

# Se o shell for ZSH, pode ser interessante sugerir a instalação do Oh My Zsh
if [ "$SHELL" = "zsh" ]; then
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh não encontrado. Instalando..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "Oh My Zsh instalado com sucesso!"
    else
        echo "Oh My Zsh já está instalado."
    fi
fi

echo "Instalação concluída!"
