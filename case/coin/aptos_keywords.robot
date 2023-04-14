*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input To
    [Arguments]    ${to}
    Click Element    toc
    Input Text    to    ${to}    clear=${True}

Input Amount
    [Arguments]    ${amount}
    Click Element    amountc
    Input Text    amount    ${amount}    clear=${True}

Input Max_Gas_Amount
    [Arguments]    ${maxGasAmount}
    Click Element    maxGasAmountc
    Input Text    maxGasAmount    ${maxGasAmount}    clear=${True}

Input Gas_Unit_Price
    [Arguments]    ${gasUnitPrice}
    Click Element    gasUnitPricec
    Input Text    gasUnitPrice    ${gasUnitPrice}    clear=${True}

Input Chain_Id
    [Arguments]    ${chainId}
    Click Element    chainIdc
    Input Text    chainId    ${chainId}    clear=${True}

Input Sequence_Number
    [Arguments]    ${sequenceNumber}
    Click Element    sequenceNumberc
    Input Text    sequenceNumber    ${sequenceNumber}    clear=${True}

Select Module
    [Arguments]    ${module}
    Click Element    module
    Click Element    ${module}

Select Func
    [Arguments]    ${func}
    Click Element    func
    Click Element    ${func}

Select Type_Tag
    [Arguments]    ${typeTag}
    Click Element    typeTag
    Click Element    ${typeTag}

Input Exp_TimeStamp
    [Arguments]    ${expTimeStamp}
    Click Element    expTimeStampc
    Input Text    expTimeStamp    ${expTimeStamp}    clear=${True}

Input Transaction Field
    [Arguments]    ${to}    ${amount}    ${module}    ${func}    ${maxGasAmount}    ${typeTag}    ${gasUnitPrice}    ${chainId}    ${sequenceNumber}    ${expTimeStamp}
    Input To    ${to}
    Input Amount    ${amount}
    Select Module    ${module}
    Select Func    ${func}
    Select Type_Tag    ${typeTag}
    Input Max_Gas_Amount    ${maxGasAmount}
    Input Gas_Unit_Price    ${gasUnitPrice}
    Input Chain_Id    ${chainId}
    Input Sequence_Number    ${sequenceNumber}
    Input Exp_TimeStamp    ${expTimeStamp}

Get Raw Transaction
    ${transactonRaw} =    Get Value    txRaw
    RETURN    ${transactonRaw}

Sign Aptos
    [Tags]    aptos    sign
    [Arguments]    ${to}    ${amount}    ${module}    ${func}    ${maxGasAmount}    ${typeTag}    ${gasUnitPrice}    ${chainId}    ${sequenceNumber}    ${expTimeStamp}
    Input Transaction Field
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

Get Payload
    [Tags]    payload
    [Arguments]    ${to}    ${amount}    ${module}    ${func}    ${typeTag}
    ${payload} =    Get Payload    ${to}    ${amount}    ${module}    ${func}    ${typeTag}
    RETURN    ${payload}
