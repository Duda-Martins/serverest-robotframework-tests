*** Settings ***
Documentation    Testes de exclusão de produtos.
Resource    ../resources/common/common.resource
 
Test Teardown     Take Screenshot
Suite Setup      Silenciar InsecureRequestWarning
 
*** Test Cases ***
 
Excluir produto valido - Maria Eduarda
    Criar produto - API
    Abrir página
    Logar
    Listar produtos e excluir o produto criado
    Validar se o produto some
    Excluir usuário - API    ${data}[usuario][email]