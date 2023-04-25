*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Expiration Eos
    [Arguments]    ${expiration}
    Click Element    expirationc
    Input Text    expiration    ${expiration}    clear=${True}

Input Ref_Block_Num Eos
    [Arguments]    ${refBlockNum}
    Click Element    refBlockNumc
    Input Text    refBlockNum    ${refBlockNum}    clear=${True}

Input Ref_Block_Prefix Eos
    [Arguments]    ${refBlockPrefix}
    Click Element    refBlockPrefixc
    Input Text    refBlockPrefix    ${refBlockPrefix}    clear=${True}

Input Max_Net_Usage_Words Eos
    [Arguments]    ${maxNetUsageWords}
    Click Element    maxNetUsageWordsc
    Input Text    maxNetUsageWords    ${maxNetUsageWords}    clear=${True}

Input Max_Cpu_Usage_Ms Eos
    [Arguments]    ${maxCpuUsageMs}
    Click Element    maxCpuUsageMsc
    Input Text    maxCpuUsageMs    ${maxCpuUsageMs}    clear=${True}

Input Delay_Sec Eos
    [Arguments]    ${delaySec}
    Click Element    delaySecc
    Input Text    delaySec    ${delaySec}    clear=${True}

Input Actions Eos
    [Arguments]    ${actions}
    Click Element    actionsc
    Input Text    actions    ${actions}    clear=${True}

Input Transaction Field Eos
    [Arguments]    ${expiration}    ${refBlockNum}    ${refBlockPrefix}    ${maxNetUsageWords}    ${maxCpuUsageMs}    ${delaySec}    ${actions}
    Input Expiration Eos    ${expiration}
    Input Ref_Block_Num Eos    ${refBlockNum}
    Input Ref_Block_Prefix Eos    ${refBlockPrefix}
    Input Max_Net_Usage_Words Eos    ${maxNetUsageWords}
    Input Max_Cpu_Usage_Ms Eos    ${maxCpuUsageMs}
    Input Delay_Sec Eos    ${delaySec}
    Input Actions Eos    ${actions}

Sign Eos
    [Tags]    eos    sign
    [Arguments]    ${expiration}    ${refBlockNum}    ${refBlockPrefix}    ${maxNetUsageWords}    ${maxCpuUsageMs}    ${delaySec}    ${actions}
    Input Transaction Field Eos
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
