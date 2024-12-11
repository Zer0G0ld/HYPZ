# ---------------------------------
# Aliases Padrões
# ---------------------------------

# Lista de arquivos (com cores e detalhes)
alias ll='ls -alF --color=auto'

# Navegar rapidamente para os diretórios comuns
alias ..='cd ..'                      # Voltar um diretório
alias ...='cd ../..'                   # Voltar dois diretórios
alias ....='cd ../../..'               # Voltar três diretórios

# Navegar para diretórios frequentemente usados
alias docs='cd ~/Documents'            # Ir para a pasta de documentos
alias proj='cd ~/Projetos'             # Ir para a pasta de projetos

# Limpar o terminal
alias clr='clear'                      # Limpar a tela

# Mostrar o uso de disco de forma fácil
alias df='df -h'                       # Exibir espaço em disco de forma legível
alias du='du -sh'                      # Tamanho total de um diretório
alias free='free -h'                   # Exibir memória disponível

# Git
alias gs='git status'                  # Ver status do repositório
alias gl='git log --oneline --graph'    # Ver histórico do git de forma simplificada
alias ga='git add .'                   # Adicionar todos os arquivos para commit
alias gc='git commit -m'               # Comitar com mensagem
alias gp='git push'                    # Enviar as alterações para o repositório remoto
alias gpo='git push origin $(git branch --show-current)' # Enviar alterações para o branch atual

# Docker
alias dps='docker ps'                  # Ver containers em execução
alias dpsa='docker ps -a'              # Ver todos os containers, em execução ou não
alias dc='docker-compose'              # Usar o docker-compose de forma simplificada
alias dcd='docker-compose down'        # Parar os containers do docker-compose
alias dcu='docker-compose up'          # Subir os containers com docker-compose
alias dcrestart='docker-compose restart' # Reiniciar os containers

# Atalhos para processos comuns
alias e='exit'                         # Sair do terminal rapidamente
alias h='history'                      # Exibir o histórico de comandos

# Função para buscar arquivos de forma eficiente
alias ff='find . -name'                # Encontrar arquivos pelo nome

# ---------------------------------
# Funções customizadas
# ---------------------------------

# Função para buscar uma string em um arquivo
function search_file() {
    if [ -z "$1" ]; then
        echo "Por favor, forneça o nome do arquivo ou string."
    else
        grep -r "$1" . # Pesquisa recursiva
    fi
}

# Função para mostrar a data atual de forma amigável
function show_date() {
    echo "Data atual: $(date)"
}

# Função para exibir o diretório atual de forma destacada
function show_dir() {
    echo "Você está no diretório: $(pwd)"
}
