*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input To
    [Arguments]    ${to}
    Click Element    toc
    Input Text    to    ${to}    clear=${True}

Input Nonce
    [Arguments]    ${nonce}
    Click Element    noncec
    Input Text    nonce    ${nonce}    clear=${True}

Input Value
    [Arguments]    ${value}
    Click Element    valuec
    Input Text    value    ${value}    clear=${True}

Input Method
    [Arguments]    ${method}
    Click Element    methodc
    Input Text    method    ${method}    clear=${True}

Input Gas_Limit
    [Arguments]    ${gasLimit}
    Click Element    gasLimitc
    Input Text    gasLimit    ${gasLimit}    clear=${True}

Input Gas_Fee_Cap
    [Arguments]    ${gasFeeCap}
    Click Element    gasFeeCapc
    Input Text    gasFeeCap    ${gasFeeCap}    clear=${True}

Input Gas_Premium
    [Arguments]    ${gasPremium}
    Click Element    gasPremiumc
    Input Text    gasPremium    ${gasPremium}    clear=${True}

Input Params
    [Arguments]    ${params}
    TRY
        Click Element    paramsc
    EXCEPT
        Log    Info params is empty!
    END
    Input Text    params    ${params}    clear=${True}

Input Transaction Field
    [Arguments]    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
    Input To    ${to}
    Input Nonce    ${nonce}
    Input Value    ${value}
    Input Method    ${method}
    Input Gas_Limit    ${gasLimit}
    Input Gas_Fee_Cap    ${gasFeeCap}
    Input Gas_Premium    ${gasPremium}
    Input Params    ${params}

Sign Fil
    [Tags]    filecoin    sign
    [Arguments]    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
    Input Transaction Field
    ...    ${to}
    ...    ${nonce}
    ...    ${value}
    ...    ${method}
    ...    ${gasLimit}
    ...    ${gasFeeCap}
    ...    ${gasPremium}
    ...    ${params}
    Sign Transaction
    ${signatrue} =    Get Signature
    RETURN    ${signatrue}
