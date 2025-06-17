*** Settings ***
Documentation    Variaveis globais e configuraçoes de ambiente

Library    Browser
Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

Resource    ../usuarios_keywords.resource


*** Variables ***
${BASE_URL}    https://compassuolfront.serverest.dev
${API_URL}      https://compassuol.serverest.dev
${STATUS_REQ}    any


*** Keywords ***

Criar Sessao
    New Browser    browser=chromium    headless=False
    New Page       ${BASE_URL}

    Create Session    alias=restful-serverest    url=${API_URL}

    
Excluir usuário - API
    
    [Arguments]    ${email_usuario}

    ${response}=    GET On Session    restful-serverest    /usuarios    expected_status=${STATUS_REQ}
    ${usuarios}=    Get From Dictionary    ${response.json()}    usuarios

    ${id}=    Set Variable    None
    FOR    ${usuario}    IN    @{usuarios}
        IF    $usuario["email"] == $email_usuario
            ${id}=    Set Variable    ${usuario["_id"]}
        END
    END

    DELETE On Session    restful-serverest    /usuarios/${id}    expected_status=${STATUS_REQ}

