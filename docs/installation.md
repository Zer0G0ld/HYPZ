# Instalação do HYPZ

Este documento fornece instruções para instalar e configurar o HYPZ no seu sistema.

## Requisitos

- **Linux** ou **macOS**.
- **Bash** ou **ZSH** como shell.
- **Git** para gerenciar repositórios.

## Passos de Instalação

### 1. Baixe o Repositório HYPZ

Clone o repositório do HYPZ no seu sistema usando o Git:

```bash
git clone https://github.com/seu_usuario/HYPZ.git
cd HYPZ
```

### 2. Execute o Script de Instalação

O script `install.sh` configura automaticamente o seu ambiente de terminal. Ele detecta se você está usando Bash ou ZSH e configura o shell adequado.

```bash
chmod +x install.sh
./install.sh
```

Este script irá:
- Detectar o shell usado (Bash ou ZSH).
- Copiar o arquivo de configuração correspondente (`.bashrc` ou `.zshrc`).
- Instalar dependências necessárias, como ZSH e Figlet.

### 3. Verifique a Instalação

Após executar o script, reinicie o terminal ou execute o comando:

```bash
source ~/.bashrc  # Para Bash
source ~/.zshrc   # Para ZSH
```

Isso irá aplicar as configurações e o prompt personalizado.

### 4. Teste a Configuração

Execute o comando `update.sh` para verificar se o ambiente está configurado corretamente:

```bash
./scripts/update.sh
```

