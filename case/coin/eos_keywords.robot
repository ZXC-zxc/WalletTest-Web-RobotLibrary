*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Expiration
    [Arguments]    ${expiration}
    Click Element    expirationc
    Input Text    expiration    ${expiration}    clear=${True}

Input Ref_Block_Num
    [Arguments]    ${refBlockNum}
    Click Element    refBlockNumc
    Input Text    refBlockNum    ${refBlockNum}    clear=${True}

Input Ref_Block_Prefix
    [Arguments]    ${refBlockPrefix}
    Click Element    refBlockPrefixc
    Input Text    refBlockPrefix    ${refBlockPrefix}    clear=${True}

Input Max_Net_Usage_Words
    [Arguments]    ${maxNetUsageWords}
    Click Element    maxNetUsageWordsc
    Input Text    maxNetUsageWords    ${maxNetUsageWords}    clear=${True}

Input Max_Cpu_Usage_Ms
    [Arguments]    ${maxCpuUsageMs}
    Click Element    maxCpuUsageMsc
    Input Text    maxCpuUsageMs    ${maxCpuUsageMs}    clear=${True}

Input Delay_Sec
    [Arguments]    ${delaySec}
    Click Element    delaySecc
    Input Text    delaySec    ${delaySec}    clear=${True}

Input Actions
    [Arguments]    ${actions}
    Click Element    actionsc
    Input Text    actions    ${actions}    clear=${True}

Input Transaction Field
    [Arguments]    ${expiration}    ${refBlockNum}    ${refBlockPrefix}    ${maxNetUsageWords}    ${maxCpuUsageMs}    ${delaySec}    ${actions}
    Input Expiration    ${expiration}
    Input Ref_Block_Num    ${refBlockNum}
    Input Ref_Block_Prefix    ${refBlockPrefix}
    Input Max_Net_Usage_Words    ${maxNetUsageWords}
    Input Max_Cpu_Usage_Ms    ${maxCpuUsageMs}
    Input Delay_Sec    ${delaySec}
    Input Actions    ${actions}

Sign Eos
    [Tags]    eos    sign
    [Arguments]    ${expiration}    ${refBlockNum}    ${refBlockPrefix}    ${maxNetUsageWords}    ${maxCpuUsageMs}    ${delaySec}    ${actions}
    Input Transaction Field
    ...    ${expiration}
    ...    ${refBlockNum}
    ...    ${refBlockPrefix}
    ...    ${maxNetUsageWords}
    ...    ${maxCpuUsageMs}
    ...    ${delaySec}
    ...    ${actions}
    Sign Transaction
    Wait Until Element Contains    signature    SIG_K1    timeout=20
    ${signature} =    Get Signature
    RETURN    ${signature}
