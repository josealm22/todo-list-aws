#!/bin/bash

STACK_NAME="todo-list-staging"

# Función para obtener la URL de una clave específica
get_output() {
  aws cloudformation describe-stacks --stack-name $STACK_NAME \
    --query "Stacks[0].Outputs[?OutputKey=='$1'].OutputValue" \
    --output text
}

# Crear o vaciar el archivo si ya existe
> api_urls.env

# Obtener cada URL y añadirlas al archivo api_urls.env
echo "BaseUrlApi=$(get_output 'BaseUrlApi')" >> api_urls.env
echo "CreateTodoApi=$(get_output 'CreateTodoApi')" >> api_urls.env
echo "DeleteTodoApi=$(get_output 'DeleteTodoApi')" >> api_urls.env
echo "GetTodoApi=$(get_output 'GetTodoApi')" >> api_urls.env
echo "ListTodosApi=$(get_output 'ListTodosApi')" >> api_urls.env
echo "UpdateTodoApi=$(get_output 'UpdateTodoApi')" >> api_urls.env

