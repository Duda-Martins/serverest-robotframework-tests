*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/listar_usuarios_keyword.robot

*** Variables ***
${BASE_URL}              https://compassuolfront.serverest.dev
${BROWSER}          Chrome
${NOME_ATUAL}       TesteBre
${EMAIL_ADMIN}      qabre@admin.com
${SENHA_ADMIN}      admin123

*** Test Cases ***
Cenário de teste 04 - Validar a lista de usuários no Serverest para usuário adm
    Acessar o site serverest
    Logar com usuário administrador válido
    Acessar página de lista de usuários