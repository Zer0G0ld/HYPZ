# Tema Vibrante para ZSH
# Este tema usa cores vibrantes para criar um visual mais energético e dinâmico.

# Definindo o prompt com cores vibrantes
PROMPT='%F{magenta}%n@%m %F{yellow}%~%f %# '

# Adicionando uma parte do prompt (RPROMPT) que exibe o status de git, caso esteja em um repositório git
RPROMPT='%F{blue}$(git_prompt_info)%f'

# Definir o status do último comando (erro ou sucesso) em cores
precmd() {
    if [[ $? -eq 0 ]]; then
        PROMPT='%F{magenta}%n@%m %F{yellow}%~%f %# '
    else
        PROMPT='%F{red}%n@%m %F{yellow}%~%f %# '
    fi
}

# Função para exibir informações do Git, se em um repositório Git
git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2>/dev/null) || return
    echo " (%F{green}${ref#refs/heads/}%f)"
}
