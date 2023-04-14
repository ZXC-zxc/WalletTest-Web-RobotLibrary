*** Settings ***
Documentation       Test Template .

Library             DataDriver    file=.${/}data${/}TestCase.xls    sheet_name=EthereumSignTx
Resource            ..${/}case${/}coin${/}eth_keywords.robot

Suite Setup         Open Browser To Home Page
Suite Teardown      Close Browser
Task Setup          Get Account    ethereum
Test Template       Sign Ethereum


*** Test Cases ***    to    nonce    value    data    type    gasLimit    gasPrice    chainId    maxPriorityFeePerGas    maxFeePerGas
Template Example    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}


*** Keywords ***
Sign Ethereum
    [Tags]    ethereum    sign
    [Arguments]    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
    Sign Eth
    ...    ${to}
    ...    ${nonce}
    ...    ${value}
    ...    ${data}
    ...    ${type}
    ...    ${gasLimit}
    ...    ${gasPrice}
    ...    ${chainId}
    ...    ${maxPriorityFeePerGas}
    ...    ${maxFeePerGas}
