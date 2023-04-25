*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input To Fil
    [Arguments]    ${to}
    Click Element    toc
    Input Text    to    ${to}    clear=${True}

Input Nonce Fil
    [Arguments]    ${nonce}
    Click Element    noncec
    Input Text    nonce    ${nonce}    clear=${True}

Input Value Fil
    [Arguments]    ${value}
    Click Element    valuec
    Input Text    value    ${value}    clear=${True}

Input Method Fil
    [Arguments]    ${method}
    Click Element    methodc
    Input Text    method    ${method}    clear=${True}

Input Gas_Limit Fil
    [Arguments]    ${gasLimit}
    Click Element    gasLimitc
    Input Text    gasLimit    ${gasLimit}    clear=${True}

Input Gas_Fee_Cap Fil
    [Arguments]    ${gasFeeCap}
    Click Element    gasFeeCapc
    Input Text    gasFeeCap    ${gasFeeCap}    clear=${True}

Input Gas_Premium Fil
    [Arguments]    ${gasPremium}
    Click Element    gasPremiumc
    Input Text    gasPremium    ${gasPremium}    clear=${True}

Input Params Fil
    [Arguments]    ${params}
    TRY
        Click Element    paramsc
    EXCEPT
        Log    Info params is empty!
    END
    Input Text    params    ${params}    clear=${True}

Input Transaction Field Fil
    [Arguments]    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
    Input To Fil    ${to}
    Input Nonce Fil    ${nonce}
    Input Value Fil    ${value}
    Input Method Fil    ${method}
    Input Gas_Limit Fil    ${gasLimit}
    Input Gas_Fee_Cap Fil    ${gasFeeCap}
    Input Gas_Premium Fil    ${gasPremium}
    Input Params Fil    ${params}

Sign Fil
    [Tags]    filecoin    sign
    [Arguments]    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
    Input Transaction Field Fil
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
