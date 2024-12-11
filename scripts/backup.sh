#!/bin/bash

# Diretório de backup
BACKUP_DIR="$HOME/.hypz_backup"
DATE=$(date +%Y%m%d%H%M%S)

# Criando diretório de backup se não existir
mkdir -p "$BACKUP_DIR"

# Função para fazer backup de um arquivo
backup_file() {
    local file_path=$1
    if [ -f "$file_path" ]; then
        cp "$file_path" "$BACKUP_DIR/$(basename $file_path).backup.$DATE"
        echo "Backup de $file_path criado em $BACKUP_DIR/$(basename $file_path).backup.$DATE"
    else
        echo "Arquivo $file_path não encontrado. Nenhum backup necessário."
    fi
}

# Fazendo backup de arquivos de configuração do shell
echo "Iniciando backup..."

backup_file "$HOME/.bashrc"
backup_file "$HOME/.zshrc"

# Backup adicional de arquivos importantes do HYPZ
backup_file "$HOME/.hype"  # Supondo que você tenha configurações adicionais para o HYPZ

echo "Backup concluído!"
