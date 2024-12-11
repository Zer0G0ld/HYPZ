#!/bin/bash

# Função para listar todos os contêineres em execução
list_containers() {
    echo "Listando contêineres Docker em execução..."
    docker ps
}

# Função para listar todos os contêineres (em execução e parados)
list_all_containers() {
    echo "Listando todos os contêineres (em execução e parados)..."
    docker ps -a
}

# Função para iniciar um contêiner
start_container() {
    read -p "Digite o ID ou nome do contêiner para iniciar: " container_id
    echo "Iniciando o contêiner $container_id..."
    docker start "$container_id"
}

# Função para parar um contêiner
stop_container() {
    read -p "Digite o ID ou nome do contêiner para parar: " container_id
    echo "Parando o contêiner $container_id..."
    docker stop "$container_id"
}

# Função para remover um contêiner
remove_container() {
    read -p "Digite o ID ou nome do contêiner para remover: " container_id
    echo "Removendo o contêiner $container_id..."
    docker rm "$container_id"
}

# Função para reiniciar um contêiner
restart_container() {
    read -p "Digite o ID ou nome do contêiner para reiniciar: " container_id
    echo "Reiniciando o contêiner $container_id..."
    docker restart "$container_id"
}

# Menu de opções
echo "Escolha uma opção de Docker Helper:"
echo "1. Listar contêineres em execução"
echo "2. Listar todos os contêineres"
echo "3. Iniciar um contêiner"
echo "4. Parar um contêiner"
echo "5. Remover um contêiner"
echo "6. Reiniciar um contêiner"
echo "7. Sair"

read -p "Digite o número da opção: " option

case $option in
    1)
        list_containers
        ;;
    2)
        list_all_containers
        ;;
    3)
        start_container
        ;;
    4)
        stop_container
        ;;
    5)
        remove_container
        ;;
    6)
        restart_container
        ;;
    7)
        echo "Saindo do Docker Helper."
        exit 0
        ;;
    *)
        echo "Opção inválida!"
        ;;
esac
