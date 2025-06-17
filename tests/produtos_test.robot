*** Settings ***
Documentation    Testes do Endpoint Produtos
Library     Collections
Library     Browser
Resource    ../resources/produtos_keywords.resource
Resource    ../resources/login_keywords.resource

Test Setup       Criar Sessao
Test Teardown    Take Screenshot

*** Test Cases ***
Cenário: Cadastrar um produto valido
    [Tags]    CADPROD
    ${user}=    Criar usuario como administrador    #Thais
    Ir para a página de inscrição    #Thais
    Excluir usuário - API    ${user['email']}
    Enviar formulário de inscrição    ${user}    #Thais
    Cadastrar um produto valido    #Pedro

Cenário: Listagem de produtos validos
    [Tags]    LISTUSU


    Cadastrar um produto valido    #Pedro
    Listagem de produtos validos   #Pedro