*** Settings ***
Documentation    Testes de exclusão de produtos.
Resource    ../resources/common/common.resource
 
*** Keywords ***
Listar produtos e excluir o produto criado
    Go To    ${BASE_URL}/admin/listarprodutos
 
    Wait For Elements State    css=table tbody td >> text=${data}[produto][nome]
    ...    visible
    ...    5
 
    ${element}    Set Variable
    ...    xpath=//td[text()="${data}[produto][nome]"]/..//button[@class="btn btn-danger"]
 
    Wait For Elements State    ${element}
    ...    visible
    ...    5
 
    Click    ${element}
 
Validar se o produto some
    Wait For Elements State    css=table tbody td >> text=${data}[produto][nome]
    ...    detached
    ...    5