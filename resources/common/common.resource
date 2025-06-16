*** Settings ***
Documentation    Keywords e imports comuns para todos os testes

Library    RequestsLibrary
Library    Collections
Library    String
Library    JSONLibrary

*** Variables ***
${API_URL}    https://compassuol.serverest.dev
${URL_BASE}    https://compassuolfront.serverest.dev/
${STATUS_REQ}    any

*** Keywords ***
Sessão - API
    Create Session    alias=restful-serverest    url=${API_URL}

Excluir usuário - API
    [Arguments]    ${email-usuario}

    Sessão - API

    ${response}    GET On Session
        ...          alias=restful-serverest
        ...          url=/usuarios
        ...          expected_status=${STATUS_REQ}

    ${json}    Set Variable    ${response.json()}

    ${usuarios}=      Get From Dictionary    ${json}    usuarios

    FOR    ${usuario}    IN    @{usuarios}
        ${email}    Get From Dictionary    ${usuario}    email
        IF    '''${email}''' == '''${email-usuario}'''
            ${id}    Set Variable    ${usuario["_id"]}
        END
    END

    DELETE On Session
    ...          alias=restful-serverest
    ...          url=/usuarios/${id}
    ...          expected_status=${STATUS_REQ}

Criar usuário - API
    Sessão - API

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/api.json
    ...    encoding=utf-8

    ${body}    Set Variable    ${data}[usuario]

    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/usuarios
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}

Login usuário - API
    Sessão - API

    Criar usuário - API

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/api.json
    ...    encoding=utf-8

    ${body}    Set Variable    ${data}[usuario-login]

    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/login
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}

    Set Test Variable    ${RESPOSTA}    ${resposta.json()}

    ${token}=   Get From Dictionary    ${RESPOSTA}    authorization
    ${token_parte}    Split String    ${token}    ${SPACE}
    Set Test Variable    ${TOKEN}    ${token_parte}[1]

    Log    ${TOKEN}
    Log To Console    ${TOKEN}

Excluir produto - API
    [Arguments]    ${nome-produto}

    Sessão - API

    ${response}    GET On Session
    ...            alias=restful-serverest
    ...            url=/produtos
    ...            expected_status=${STATUS_REQ}

    ${json}         To Json    ${response.content}
    ${produtos}=    Get From Dictionary    ${json}    produtos

    FOR    ${produto}    IN    @{produtos}
        ${nome}=    Get From Dictionary    ${produto}    nome
        IF    '${nome}' == '${nome-produto}'
            ${id}=    Set Variable    ${produto["_id"]}
            Exit For Loop
        END
    END

    Login usuário - API

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    DELETE On Session
    ...            alias=restful-serverest
    ...            url=/produtos/${id}
    ...            headers=${headers}
    ...            expected_status=${STATUS_REQ}

Criar produto - API

    Sessão - API

    Login usuário - API

    ${headers}=    Create Dictionary    Authorization=Bearer ${TOKEN}

    ${data}    Load Json From File
    ...    ${EXECDIR}/resources/fixtures/api.json
    ...    encoding=utf-8

    ${body}    Set Variable    ${data}[produto]

    ${resposta}  POST On Session
        ...          alias=restful-serverest
        ...          url=/produtos
        ...          json=${body}
        ...          expected_status=${STATUS_REQ}
        ...          headers=${headers}

        Set Test Variable    ${RESPOSTA}    ${resposta.json()}
        Log    ${RESPOSTA}
        Log to Console    ${RESPOSTA}