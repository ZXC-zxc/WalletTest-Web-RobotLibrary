*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input To Aptos
    [Arguments]    ${to}
    Click Element    toc
    Input Text    to    ${to}    clear=${True}

Input Amount Aptos
    [Arguments]    ${amount}
    Click Element    amountc
    Input Text    amount    ${amount}    clear=${True}

Input Max_Gas_Amount Aptos
    [Arguments]    ${maxGasAmount}
    Click Element    maxGasAmountc
    Input Text    maxGasAmount    ${maxGasAmount}    clear=${True}

Input Gas_Unit_Price Aptos
    [Arguments]    ${gasUnitPrice}
    Click Element    gasUnitPricec
    Input Text    gasUnitPrice    ${gasUnitPrice}    clear=${True}

Input Chain_Id Aptos
    [Arguments]    ${chainId}
    Click Element    chainIdc
    Input Text    chainId    ${chainId}    clear=${True}

Input Sequence_Number Aptos
    [Arguments]    ${sequenceNumber}
    Click Element    sequenceNumberc
    Input Text    sequenceNumber    ${sequenceNumber}    clear=${True}

Select Module Aptos
    [Arguments]    ${module}
    Click Element    module
    Click Element    ${module}

Select Func Aptos
    [Arguments]    ${func}
    Click Element    func
    Click Element    ${func}

Select Type_Tag Aptos
    [Arguments]    ${typeTag}
    Click Element    typeTag
    Click Element    ${typeTag}

Input Exp_TimeStamp Aptos
    [Arguments]    ${expTimeStamp}
    Click Element    expTimeStampc
    Input Text    expTimeStamp    ${expTimeStamp}    clear=${True}

Input Transaction Field Aptos
    [Arguments]    ${to}    ${amount}    ${module}    ${func}    ${maxGasAmount}    ${typeTag}    ${gasUnitPrice}    ${chainId}    ${sequenceNumber}    ${expTimeStamp}
    Input To Aptos    ${to}
    Input Amount Aptos    ${amount}
    Select Module Aptos    ${module}
    Select Func Aptos    ${func}
    Select Type_Tag Aptos    ${typeTag}
    Input Max_Gas_Amount Aptos    ${maxGasAmount}
    Input Gas_Unit_Price Aptos    ${gasUnitPrice}
    Input Chain_Id Aptos    ${chainId}
    Input Sequence_Number Aptos    ${sequenceNumber}
    Input Exp_TimeStamp Aptos    ${expTimeStamp}

Sign Aptos
    [Tags]    aptos    sign
    [Arguments]    ${to}    ${amount}    ${module}    ${func}    ${maxGasAmount}    ${typeTag}    ${gasUnitPrice}    ${chainId}    ${sequenceNumber}    ${expTimeStamp}
    Input Transaction Field Aptos
    ...    ${to}
    ...    ${amount}
    ...    ${module}
    ...    ${func}
    ...    ${maxGasAmount}
    ...    ${typeTag}
    ...    ${gasUnitPrice}
    ...    ${chainId}
    ...    ${sequenceNumber}
    ...    ${expTimeStamp}
    Sign Transaction
    ${txRaw} =    Get Raw Transaction
    RETURN    ${txRaw}
