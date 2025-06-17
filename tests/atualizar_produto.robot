*** Settings ***
Documentation    Testes de edição de produtos.
Resource    ../resources/common/common.resource

Test Teardown     Take Screenshot

*** Test Cases ***

Atualizar produto valido - Maria Eduarda
    Criar produto - API
    Abrir página
    Logar
    Listar produtos e editar o produto criado
    # Validar se aparece o formulário de edição
    Excluir produto - API    ${data}[produto][nome]