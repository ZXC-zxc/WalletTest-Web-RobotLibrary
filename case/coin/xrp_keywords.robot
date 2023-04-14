*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Transaction
    [Arguments]    ${transaction}
    TRY
        Click Element    transactionc
    EXCEPT
        Log    Info transaction is empty!
    END
    Input Text    transaction    ${transaction}

Input Transaction Field
    [Arguments]    ${transaction}
    Input Transaction    ${transaction}

Sign Xrp
    [Tags]    xrp    sign
    [Arguments]    ${transaction}
    Input Transaction Field    ${transaction}
    Sign Transaction
    ${signatrue} =    Get Signature
    RETURN    ${signatrue}
