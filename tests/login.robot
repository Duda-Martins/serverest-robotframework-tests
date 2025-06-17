# *** Settings ***
# Documentation    Cenarios autenticaçao  de cadastro de usuarios 
# Resource    ../resources/common/common.resource

# Test Teardown    Take Screenshot

# *** Test Cases ***

# Cenario: Login com credenciais valido
#     Abrir página

#     ${user}=    Criar login valido

#     Enviar formulário de login   ${user}
#     O usuário deve estar logado   ${user}[name]