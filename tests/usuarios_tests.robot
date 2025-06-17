*** Settings ***
Documentation    Cenarios de testes de cadastro de usuarios 
Resource    ../resources/common/common.resource

Test Setup       Criar Sessao
Test Teardown    Take Screenshot

*** Test Cases ***
Cenario: Criar um novo usuário com administrador valido
    
    ${user}        Create Dictionary
    ...    name=fulano
    ...    email=fulano20@teste.com
    ...    password=senha123
    ...    administrador=true
    
    Ir para a página de inscrição

    Excluir usuário - API    ${user['email']}

    Enviar formulário de inscrição    ${user}

    
    

    

    


