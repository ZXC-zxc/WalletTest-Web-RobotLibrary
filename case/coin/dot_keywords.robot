*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Transaction_Version Dot
    [Arguments]    ${transactionVersion}
    Click Element    transactionVersionc
    Input Text    transactionVersion    ${transactionVersion}    clear=${True}

Input Nonce Dot
    [Arguments]    ${nonce}
    Click Element    noncec
    Input Text    nonce    ${nonce}    clear=${True}

Input Spec_Version Dot
    [Arguments]    ${specVersion}
    Click Element    specVersionc
    Input Text    specVersion    ${specVersion}    clear=${True}

Input Block_Hash Dot
    [Arguments]    ${blockHash}
    Click Element    blockHashc
    Input Text    blockHash    ${blockHash}    clear=${True}

Input Tip Dot
    [Arguments]    ${tip}
    TRY
        Click Element    tipc
    EXCEPT
        Log    Info tip is empty!
    END
    Input Text    tip    ${tip}    clear=${True}

Input Call Dot
    [Arguments]    ${call}
    TRY
        Click Element    callc
    EXCEPT
        Log    Info call is empty!
    END
    Input Text    call    ${call}    clear=${True}

Input Transaction Field Dot
    [Arguments]    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
    Input Transaction_Version Dot    ${transactionVersion}
    Input Nonce Dot    ${nonce}
    Input Spec_Version Dot    ${specVersion}
    Input Block_Hash Dot    ${blockHash}
    Input Tip Dot    ${tip}
    Input Call Dot    ${call}

Sign Dot
    [Tags]    dot    sign
    [Arguments]    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
    Input Transaction Field Dot
    ...    ${transactionVersion}
    ...    ${nonce}
    ...    ${specVersion}
    ...    ${blockHash}
    ...    ${tip}
    ...    ${call}
    Sign Transaction
    Wait Until Element Contains    signature    0x    timeout=20
    ${signature} =    Get Signature
    RETURN    ${signature}
