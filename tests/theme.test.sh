#!/bin/bash

echo "Iniciando o teste de temas..."

# Teste 1: Verificar se o tema padrão foi aplicado corretamente
source ~/.zshrc  # Ou ~/.bashrc, dependendo do shell
if [[ "$PROMPT" == "%F{green}%n@%m %F{cyan}%~%f %# " ]]; then
    echo "Tema padrão (default.zsh-theme) foi aplicado corretamente."
else
    echo "Erro: Tema padrão não foi aplicado corretamente."
    exit 1
fi

# Teste 2: Verificar se o tema minimalista foi aplicado corretamente
source ~/HYPZ/themes/minimalist.zsh-theme
if [[ "$PROMPT" == "%F{yellow}%n@%m%f %# " ]]; then
    echo "Tema minimalista (minimalist.zsh-theme) foi aplicado corretamente."
else
    echo "Erro: Tema minimalista não foi aplicado corretamente."
    exit 1
fi

# Teste 3: Verificar se o tema vibrante foi aplicado corretamente
source ~/HYPZ/themes/vibrant.zsh-theme
if [[ "$PROMPT" == "%F{magenta}%n@%m %F{yellow}%~%f %# " ]]; then
    echo "Tema vibrante (vibrant.zsh-theme) foi aplicado corretamente."
else
    echo "Erro: Tema vibrante não foi aplicado corretamente."
    exit 1
fi

echo "Teste de temas concluído com sucesso!"
