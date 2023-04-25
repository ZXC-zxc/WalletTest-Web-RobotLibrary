*** Settings ***
Resource    ..${/}common${/}common.robot


*** Keywords ***
Input To Eth
    [Arguments]    ${to}
    Click Element    toc
    Input Text    to    ${to}    clear=${True}

Input Nonce Eth
    [Arguments]    ${nonce}
    Click Element    noncec
    Input Text    nonce    ${nonce}    clear=${True}

Input Value Eth
    [Arguments]    ${value}
    Click Element    valuec
    Input Text    value    ${value}    clear=${True}

Input Gas_Limit Eth
    [Arguments]    ${gasLimit}
    Click Element    gasLimitc
    Input Text    gasLimit    ${gasLimit}    clear=${True}

Input Gas_Price Eth
    [Arguments]    ${gasPrice}
    Click Element    gasPricec
    Input Text    gasPrice    ${gasPrice}    clear=${True}

Input Chain_Id Eth
    [Arguments]    ${chainId}
    Click Element    chainIdc
    Input Text    chainId    ${chainId}    clear=${True}

Select Type Eth
    [Arguments]    ${type}
    Click Element    type
    Click Element    ${type}

Input Max_Fee_Per_Gas Eth
    [Arguments]    ${maxFeePerGas}
    Click Element    maxFeePerGasc
    Input Text    maxFeePerGas    ${maxFeePerGas}    clear=${True}

Input Max_Priority_Fee_Per_Gas Eth
    [Arguments]    ${maxPriorityFeePerGas}
    Click Element    maxPriorityFeePerGasc
    Input Text    maxPriorityFeePerGas    ${maxPriorityFeePerGas}    clear=${True}

Input Data Eth
    [Arguments]    ${data}
    TRY
        Click Element    datac
    EXCEPT
        Log    Info data is empty!
    END
    Input Text    data    ${data}    clear=${True}

Input Transaction Field Eth
    [Arguments]    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
    Input To Eth    ${to}
    Input Nonce Eth    ${nonce}
    Input Value Eth    ${value}
    Select Type Eth    ${type}
    Input Gas_Limit Eth    ${gasLimit}
    Input Gas_Price Eth    ${gasPrice}
    Input Chain_Id Eth    ${chainId}
    Input Data Eth    ${data}
    IF    ${type == 2 }
        Input Max_Fee_Per_Gas Eth    ${maxFeePerGas}
        Input Max_Priority_Fee_Per_Gas Eth    ${maxPriorityFeePerGas}
    END

Sign Eth
    [Tags]    ethereum    sign
    [Arguments]    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
    Input Transaction Field Eth
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

Sign Typed Data Eth
    [Tags]    ethereum    signtypeddata
    [Arguments]    ${typedData}
    Click Element    typedDatac
    Input Text    typedData    ${typedData}    clear=${True}
    Click Element    signTypedData
    ${signature} =    Get Value    signatureTypedData
    RETURN    ${signature}
