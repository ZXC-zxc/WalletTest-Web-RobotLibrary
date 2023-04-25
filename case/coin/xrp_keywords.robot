*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input Transaction Xrp
    [Arguments]    ${transaction}
    TRY
        Click Element    transactionc
    EXCEPT
        Log    Info transaction is empty!
    END
    Input Text    transaction    ${transaction}

Input Transaction Field Xrp
    [Arguments]    ${transaction}
    Input Transaction Xrp  ${transaction}

Sign Xrp
    [Tags]    xrp    sign
    [Arguments]    ${transaction}
    Input Transaction Field Xrp   ${transaction}
    Sign Transaction
    ${signatrue} =    Get Signature
    RETURN    ${signatrue}
