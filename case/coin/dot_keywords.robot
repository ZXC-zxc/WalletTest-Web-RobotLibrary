*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Tansaction_Version
    [Arguments]    ${tansactionVersion}
    Click Element    tansactionVersionc
    Input Text    tansactionVersion    ${tansactionVersion}    clear=${True}

Input Nonce
    [Arguments]    ${nonce}
    Click Element    noncec
    Input Text    nonce    ${nonce}    clear=${True}

Input Sepc_Version
    [Arguments]    ${sepcVersion}
    Click Element    sepcVersionc
    Input Text    sepcVersion    ${sepcVersion}    clear=${True}

Input Block_Hash
    [Arguments]    ${blockHash}
    Click Element    blockHashc
    Input Text    blockHash    ${blockHash}    clear=${True}

Input Tip
    [Arguments]    ${tip}
    Click Element    tipc
    Input Text    tip    ${tip}    clear=${True}

Input Call
    [Arguments]    ${call}
    Click Element    callc
    Input Text    call    ${call}    clear=${True}

Input Transaction Field
    [Arguments]    ${tansactionVersion}    ${nonce}    ${sepcVersion}    ${blockHash}    ${tip}    ${call}
    Input Tansaction_Version    ${tansactionVersion}
    Input Nonce    ${nonce}
    Input Sepc_Version    ${sepcVersion}
    Input Block_Hash    ${blockHash}
    Input Tip    ${tip}
    Input Call    ${call}

Sign
    [Tags]    dot    sign
    [Arguments]    ${tansactionVersion}    ${nonce}    ${sepcVersion}    ${blockHash}    ${tip}    ${call}
    Input Transaction Field    ${tansactionVersion}    ${nonce}    ${sepcVersion}    ${blockHash}    ${tip}    ${call}
    Sign Transaction
    Wait Until Element Contains    signature    0x    timeout=2
    ${signature} =    Get Signature
    RETURN    ${signature}
