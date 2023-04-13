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

Input Gas_Limit
    [Arguments]    ${gasLimit}
    Click Element    gasLimitc
    Input Text    gasLimit    ${gasLimit}    clear=${True}

Input Gas_Price
    [Arguments]    ${gasPrice}
    Click Element    gasPricec
    Input Text    gasPrice    ${gasPrice}    clear=${True}

Input Chain_Id
    [Arguments]    ${chainId}
    Click Element    chainIdc
    Input Text    chainId    ${chainId}    clear=${True}

Select Type
    [Arguments]    ${type}
    Click Element    type
    Click Element    ${type}

Input Max_Fee_Per_Gas
    [Arguments]    ${maxFeePerGas}
    Click Element    maxFeePerGasc
    Input Text    maxFeePerGas    ${maxFeePerGas}    clear=${True}

Input Max_Priority_Fee_Per_Gas
    [Arguments]    ${maxPriorityFeePerGas}
    Click Element    maxPriorityFeePerGasc
    Input Text    maxPriorityFeePerGas    ${maxPriorityFeePerGas}    clear=${True}

Input Data
    [Arguments]    ${data}
    TRY
        Click Element    datac
    EXCEPT
        Log    Info data is empty!
    END
    Input Text    data    ${data}    clear=${True}

Input Transaction Field
    [Arguments]    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
    Input To    ${to}
    Input Nonce    ${nonce}
    Input Value    ${value}
    Select Type    ${type}
    Input Gas_Limit    ${gasLimit}
    Input Gas_Price    ${gasPrice}
    Input Chain_Id    ${chainId}
    Input Data    ${data}
    IF    ${type == 2 }
        Input Max_Fee_Per_Gas    ${maxFeePerGas}
        Input Max_Priority_Fee_Per_Gas    ${maxPriorityFeePerGas}
    END

Get Raw Transaction
    ${transactonRaw} =    Get Value    txRaw
    RETURN    ${transactonRaw}

Sign
    [Tags]    ethereum    sign
    [Arguments]    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
    Input Transaction Field
    ...    ${to}
    ...    ${nonce}
    ...    ${value}
    ...    ${data}
    ...    ${type}
    ...    ${gasLimit}
    ...    ${gasPrice}
    ...    ${chainId}
    ...    ${maxPriorityFeePerGas}
    ...    ${maxFeePerGas}
    Sign Transaction
    ${txRaw} =    Get Raw Transaction
    RETURN    ${txRaw}

Sign Typed Data
    [Tags]    ethereum    signtypeddata
    [Arguments]    ${typedData}
    Click Element    typedDatac
    Input Text    typedData    ${typedData}    clear=${True}
    Click Element    signTypedData
    ${signature} =    Get Value    signatureTypedData
    RETURN    ${signature}


