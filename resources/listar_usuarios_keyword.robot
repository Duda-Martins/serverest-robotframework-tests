*** Settings ***
Resource       ../tests/listar_usuarios_tests.robot
Library    SeleniumLibrary

*** Keywords ***
Acessar o site serverest
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//h1[text()="Login"]
Logar com usuário administrador válido
    Input Text      css=input[data-testid="email"]     ${EMAIL_ADMIN}
    Input Text      css=input[data-testid="senha"]      ${SENHA_ADMIN}
    Click Button    css=button[data-testid="entrar"] 
Acessar página de lista de usuários
    Wait Until Page Contains Element    css=[data-testid="listar-usuarios"]
    Click Element                       css=[data-testid="listar-usuarios"]
