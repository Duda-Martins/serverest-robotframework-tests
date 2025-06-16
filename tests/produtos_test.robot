*** Settings ***
Library     Collections
Library     Browser
Resource    ../resources/produtos_keywords.resource
Resource    ../resources/login_keywords.resource

*** Test Cases ***
Cenário: Cadastrar um produto valido
    [Tags]    CADPROD
    # Criar um novo usuário Administrador valido    #Thais
    Realizar login com credenciais de administrador valido    #Thais
    Cadastrar um produto valido    #Pedro

Cenário: Listagem de produtos validos
    [Tags]    LISTUSU
    # Criar um novo usuário Administrador valido    #Thais
    Realizar login com credenciais de administrador valido    #Thais
    Cadastrar um produto valido    #Pedro
    Listagem de produtos validos   #Pedro