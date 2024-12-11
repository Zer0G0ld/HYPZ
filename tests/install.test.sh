#!/bin/bash

echo "Iniciando o teste de instalação..."

# Teste 1: Verificar se o arquivo de configuração do Bash ou ZSH foi copiado corretamente
if [ -f ~/.bashrc ]; then
    echo "~/.bashrc foi configurado corretamente."
else
    echo "Erro: ~/.bashrc não foi configurado."
    exit 1
fi

if [ -f ~/.zshrc ]; then
    echo "~/.zshrc foi configurado corretamente."
else
    echo "Erro: ~/.zshrc não foi configurado."
    exit 1
fi

# Teste 2: Verificar se as dependências foram instaladas
if command -v zsh &> /dev/null; then
    echo "ZSH está instalado."
else
    echo "Erro: ZSH não está instalado."
    exit 1
fi

if command -v figlet &> /dev/null; then
    echo "Figlet está instalado."
else
    echo "Erro: Figlet não está instalado."
    exit 1
fi

# Teste 3: Verificar se o script de instalação foi executado corretamente
if grep -q "source ~/HYPZ/themes/default.zsh-theme" ~/.zshrc || grep -q "source ~/HYPZ/themes/default.zsh-theme" ~/.bashrc; then
    echo "Tema foi configurado corretamente."
else
    echo "Erro: Tema não foi configurado."
    exit 1
fi

echo "Teste de instalação concluído com sucesso!"
