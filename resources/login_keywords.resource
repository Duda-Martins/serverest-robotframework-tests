*** Settings ***
Library     Collections
Library     Browser

*** Keywords ***
Realizar login com credenciais de administrador valido
    # Abrir Navegador
    New Browser    browser=firefox    headless=false
    New Page       https://compassuolfront.serverest.dev/

    # Login
    Fill Text    [data-testid="email"]     fulano@qa.com
    Fill Text    [data-testid="senha"]     teste
    Get Text     [data-testid="entrar"]    ==    Entrar
    Click        [data-testid="entrar"]
    
    # Aguarda e valida mensagem de boas-vindas
    Wait For Elements State    p.lead         visible    5s
    ${mensagem}=               Get Text       p.lead
    Should Be Equal            ${mensagem}    Este é seu sistema para administrar seu ecommerce.