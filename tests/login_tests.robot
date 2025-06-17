*** Settings ***
Documentation    Cenarios autenticaçao  de cadastro de usuarios 
Resource    ../resources/common/common.resource

Test Setup       Criar Sessao
Test Teardown    Take Screenshot

*** Test Cases ***

Cenario: Login com credenciais valido

    ${user}=    Criar login valido

    Enviar formulário de login   ${user}
    O usuário deve estar logado   ${user}[name]

    ${token_login}=    Gerar token usuario - API    ${user}
    Log To Console                Token gerado: ${token_login}
