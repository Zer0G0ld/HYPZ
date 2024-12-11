
# Configuração do HYPZ

Este documento fornece detalhes sobre como configurar o HYPZ para personalizar o seu terminal, incluindo variáveis de ambiente, temas e aliases.

## 1. Personalização do Prompt

No HYPZ, o prompt do terminal pode ser facilmente personalizado. Você pode configurar o prompt de acordo com suas preferências no arquivo de configuração do shell.

- Para **ZSH**, o arquivo de configuração é o `~/.zshrc`.
- Para **Bash**, o arquivo de configuração é o `~/.bashrc`.

### Exemplo de configuração de prompt:

#### ZSH
```bash
# Prompt com usuário, host e diretório atual
PROMPT='%F{green}%n@%m %F{cyan}%~%f %# '
```

#### Bash
```bash
# Prompt com usuário, host e diretório atual
export PS1="\[\033[01;32m\]\u@\h \[\033[00m\]\w$ "
```

## 2. Aliases

O HYPZ já configura alguns aliases padrão que podem ser personalizados. Por exemplo, o alias para listar arquivos com detalhes e o alias para verificar o status do Git:

```bash
# Alias para listar arquivos detalhadamente
alias ll='ls -alF'

# Alias para verificar status do Git
alias gs='git status'
```

Você pode adicionar ou modificar aliases diretamente no arquivo `~/.bashrc` ou `~/.zshrc`.

## 3. Temas

O HYPZ vem com alguns temas básicos para ZSH que você pode configurar facilmente.

- **default.zsh-theme**: Tema padrão com um prompt verde para o usuário e azul para o diretório.
- **minimalist.zsh-theme**: Tema minimalista com um prompt simples e amarelo.
- **vibrant.zsh-theme**: Tema vibrante com cores mais vivas e um prompt dinâmico.

### Para aplicar um tema, edite o arquivo `~/.zshrc` e adicione a linha:

```bash
source ~/HYPZ/themes/default.zsh-theme  # Ou outro tema de sua escolha
```

## 4. Configuração de Plugins

Você pode adicionar plugins ao seu ambiente ZSH para melhorar a funcionalidade. Use o `oh-my-zsh` ou `antigen` para gerenciar plugins.

```bash
# Exemplo com oh-my-zsh
plugins=(git docker)

# Exemplo com antigen
antigen bundle git
antigen bundle docker
```
