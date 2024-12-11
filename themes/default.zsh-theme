# Tema Padrão para ZSH
# Este tema exibe o nome do usuário em verde, o nome do host em ciano, e o diretório atual em ciano

# Definindo o prompt com cores e formato agradáveis
PROMPT='%F{green}%n@%m %F{cyan}%~%f %# '

# Se o último comando falhou, altere o prompt para indicar erro (com cor vermelha)
RPROMPT='%F{red}%?%f'
