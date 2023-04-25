*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Ref_Block_Num Tron
    [Arguments]    ${refBlockNum}
    Click Element    refBlockNumc
    Input Text    refBlockNum    ${refBlockNum}    clear=${True}

Input Ref_Block_Hash Tron
    [Arguments]    ${refBlockHash}
    Click Element    refBlockHashc
    Input Text    refBlockHash    ${refBlockHash}    clear=${True}

Input Ref_Block_Bytes Tron
    [Arguments]    ${refBlockBytes}
    Click Element    refBlockBytesc
    Input Text    refBlockBytes    ${refBlockBytes}    clear=${True}

Input Expiration Tron
    [Arguments]    ${expiration}
    Click Element    expirationc
    Input Text    expiration    ${expiration}    clear=${True}

Input Timestamp Tron
    [Arguments]    ${timestamp}
    Click Element    timestampc
    Input Text    timestamp    ${timestamp}    clear=${True}

Input Fee_Limit Tron
    [Arguments]    ${feeLimit}
    Click Element    feeLimitc
    Input Text    feeLimit    ${feeLimit}    clear=${True}

Input Contracts Tron
    [Arguments]    ${contracts}
    Click Element    contractsc
    Input Text    contracts    ${contracts}    clear=${True}

Input Transaction Field Tron
    [Arguments]    ${refBlockHash}    ${refBlockBytes}    ${refBlockNum}    ${expiration}    ${timestamp}    ${feeLimit}    ${contracts}
    Input Ref_Block_Hash Tron    ${refBlockHash}
    Input Ref_Block_Bytes Tron    ${refBlockBytes}
    Input Ref_Block_Num Tron    ${refBlockNum}
    Input Expiration Tron    ${expiration}
    Input Timestamp Tron    ${timestamp}
    Input Fee_Limit Tron    ${feeLimit}
    Input Contracts Tron    ${contracts}

Sign Tron
    [Tags]    tron    sign
    [Arguments]    ${refBlockHash}    ${refBlockBytes}    ${refBlockNum}    ${expiration}    ${timestamp}    ${feeLimit}    ${contracts}
    Input Transaction Field Tron
    ...    ${refBlockHash}
    ...    ${refBlockBytes}
    ...    ${refBlockNum}
    ...    ${expiration}
    ...    ${timestamp}
    ...    ${feeLimit}
    ...    ${contracts}
    Sign Transaction
    Wait Until Element Contains    signature    txID    timeout=2
    ${signature} =    Get Signature
    RETURN    ${signature}
