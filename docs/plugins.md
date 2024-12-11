# Gerenciamento de Plugins no HYPZ

HYPZ suporta a utilização de plugins para estender as funcionalidades do seu terminal. Plugins podem ser adicionados para melhorar a produtividade, facilitar o gerenciamento de Docker, Git, e muito mais.

## Tipos de Plugins Suportados

### 1. **Git Plugins**

Plugins como `git` são comuns para facilitar o uso de Git no terminal. Com HYPZ, o plugin básico de Git já está incluído no arquivo `~/.zshrc` quando o usuário escolhe o ZSH.

```bash
# Ativa o plugin Git no ZSH
plugins=(git)
```

### 2. **Docker Helper**

O HYPZ vem com um plugin para facilitar o gerenciamento de contêineres Docker diretamente no terminal. O script `docker-helper.sh` oferece uma interface interativa para listar, iniciar, parar e remover contêineres Docker.

```bash
# Para ativar o Docker Helper no seu terminal
source ~/HYPZ/plugins/docker-helper.sh
```

### 3. **Adicionando Plugins com Oh My Zsh**

Se você está usando o **Oh My Zsh** para gerenciar plugins, basta adicionar os plugins ao seu arquivo `~/.zshrc`:

```bash
# Exemplo de plugins do Oh My Zsh
plugins=(git docker zsh-autosuggestions)
```

### 4. **Gerenciamento de Plugins com Antigen**

Se você está usando o **Antigen**, adicione plugins ao seu arquivo `~/.zshrc` como segue:

```bash
# Exemplo com antigen
antigen bundle git
antigen bundle docker
antigen bundle zsh-users/zsh-autosuggestions
```

## Como Criar um Novo Plugin

Você pode criar seus próprios plugins e adicioná-los ao diretório `~/HYPZ/plugins/`. Cada plugin deve ser um arquivo `.sh` que pode ser executado diretamente no terminal.

Para adicionar um novo plugin:
1. Crie um arquivo `.sh` no diretório `~/HYPZ/plugins/`.
2. No seu `~/.zshrc` ou `~/.bashrc`, adicione a linha para incluir o novo plugin:

```bash
source ~/HYPZ/plugins/novo-plugin.sh
```
