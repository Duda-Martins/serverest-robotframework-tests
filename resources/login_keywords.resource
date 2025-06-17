*** Settings ***
Documentation    Keywords para testes  das pagina de login
Library     Browser
Resource    ./common/common.resource        

*** Keywords ***


 Enviar formulário de login

    [Arguments]    ${user}    

    Fill Text    css=input[placeholder$="Digite seu email"]     ${user}[email]
    Fill Text    css=input[placeholder="Digite sua senha"]    ${user}[password]

    #Click        xpath=//button[text()="Entrar"]
    Click        css=button >> text=Entrar


 O usuário deve estar logado

    [Arguments]    ${name} 

    @{nome_inicial}    Split String    ${name}
    ${element}    Set Variable    css=h1  

    Wait For Elements State    ${element}   
    ...    visible     5
    
    Get Text    ${element}    equal    Bem Vindo ${nome_inicial}[0] 

    