*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Transaction_Version
    [Arguments]    ${transactionVersion}
    Click Element    transactionVersionc
    Input Text    transactionVersion    ${transactionVersion}    clear=${True}

Input Nonce
    [Arguments]    ${nonce}
    Click Element    noncec
    Input Text    nonce    ${nonce}    clear=${True}

Input Spec_Version
    [Arguments]    ${specVersion}
    Click Element    specVersionc
    Input Text    specVersion    ${specVersion}    clear=${True}

Input Block_Hash
    [Arguments]    ${blockHash}
    Click Element    blockHashc
    Input Text    blockHash    ${blockHash}    clear=${True}

Input Tip
    [Arguments]    ${tip}
    TRY
        Click Element    tipc
    EXCEPT
        Log    Info tip is empty!
    END
    Input Text    tip    ${tip}    clear=${True}

Input Call
    [Arguments]    ${call}
    TRY
        Click Element    callc
    EXCEPT
        Log    Info call is empty!
    END
    Input Text    call    ${call}    clear=${True}

Input Transaction Field
    [Arguments]    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
    Input Transaction_Version    ${transactionVersion}
    Input Nonce    ${nonce}
    Input Spec_Version    ${specVersion}
    Input Block_Hash    ${blockHash}
    Input Tip    ${tip}
    Input Call    ${call}

Sign
    [Tags]    dot    sign
    [Arguments]    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
    Input Transaction Field    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
    Sign Transaction
    Wait Until Element Contains    signature    0x    timeout=20
    ${signature} =    Get Signature
    RETURN    ${signature}
