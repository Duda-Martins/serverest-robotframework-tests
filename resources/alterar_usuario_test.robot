*** Settings ***
Library    SeleniumLibrary
Resource    ../tests/alterar_usuario_keyword.robot

*** Variables ***
${URL}              https://compassuolfront.serverest.dev
${BROWSER}          Chrome
${NOME_ATUAL}       TesteBre
${EMAIL_ADMIN}      qabre@admin.com
${SENHA_ADMIN}      admin123
${NOVO_NOME}        Nome Editado
${NOVO_EMAIL}       novo@email.com
${NOVA_SENHA}       123456

*** Test Cases ***
Cenário de teste 03 - Validar o campo de alteração/edição de um usuário válido
    Acessar o site serverest
    Logar com usuário administrador válido
    Acessar página de usuários
    Clicar no botão editar do primeiro usuário
    Verificar o campo de preenchimento dos novos dados do usuário


    
    
