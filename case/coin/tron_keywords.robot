*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Ref_Block_Num
    [Arguments]    ${refBlockNum}
    Click Element    refBlockNumc
    Input Text    refBlockNum    ${refBlockNum}    clear=${True}

Input Ref_Block_Hash
    [Arguments]    ${refBlockHash}
    Click Element    refBlockHashc
    Input Text    refBlockHash    ${refBlockHash}    clear=${True}

Input Ref_Block_Bytes
    [Arguments]    ${refBlockBytes}
    Click Element    refBlockBytesc
    Input Text    refBlockBytes    ${refBlockBytes}    clear=${True}

Input Expiration
    [Arguments]    ${expiration}
    Click Element    expirationc
    Input Text    expiration    ${expiration}    clear=${True}

Input Timestamp
    [Arguments]    ${timestamp}
    Click Element    timestampc
    Input Text    timestamp    ${timestamp}    clear=${True}

Input Fee_Limit
    [Arguments]    ${feeLimit}
    Click Element    feeLimitc
    Input Text    feeLimit    ${feeLimit}    clear=${True}

Input Contracts
    [Arguments]    ${contracts}
    Click Element    contractsc
    Input Text    contracts    ${contracts}    clear=${True}

Input Transaction Field
    [Arguments]    ${refBlockHash}    ${refBlockBytes}    ${refBlockNum}    ${expiration}    ${timestamp}    ${feeLimit}    ${contracts}
    Input Ref_Block_Hash    ${refBlockHash}
    Input Ref_Block_Bytes    ${refBlockBytes}
    Input Ref_Block_Num    ${refBlockNum}
    Input Expiration    ${expiration}
    Input Timestamp    ${timestamp}
    Input Fee_Limit    ${feeLimit}
    Input Contracts    ${contracts}

Get Payload
    ${payload} =    Get Value    payload
    RETURN    ${payload}
Sign
    [Tags]    tron    sign
    [Arguments]    ${refBlockHash}    ${refBlockBytes}    ${refBlockNum}    ${expiration}    ${timestamp}    ${feeLimit}    ${contracts}
    Input Transaction Field
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
