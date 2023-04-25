*** Settings ***
Documentation       Test Template .

Library             DataDriver    file=.${/}data${/}TestCase.xls    sheet_name=PolkadotSignTx
Resource            ..${/}case${/}coin${/}dot_keywords.robot

Suite Setup         Setup Template Suite    polkadot    #aptos;ethereum;polkadot;xrp;filecoin;eos;tron
Suite Teardown      Close Browser
Test Template       Sign POLKADOT Transaction


*** Test Cases ***
# Template ETHEREUM Example    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
# Template XRP Example    ${transaction}
# Template FILECOIN Example    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
# Template EOS Example    ${expiration}    ${refBlockNum}    ${refBlockPrefix}    ${maxNetUsageWords}    ${maxCpuUsageMs}    ${delaySec}    ${actions}
# Template APTOS Example    ${to}    ${amount}    ${module}    ${func}    ${maxGasAmount}    ${typeTag}    ${gasUnitPrice}    ${chainId}    ${sequenceNumber}    ${expTimeStamp}
# Template TRON Example    ${refBlockHash}    ${refBlockBytes}    ${refBlockNum}    ${expiration}    ${timestamp}    ${feeLimit}    ${contracts}
Template POLKADOT Example    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}


*** Keywords ***
# Sign ETHEREUM Transaction
#    [Tags]    ethereum    sign
#    [Arguments]    ${to}    ${nonce}    ${value}    ${data}    ${type}    ${gasLimit}    ${gasPrice}    ${chainId}    ${maxPriorityFeePerGas}    ${maxFeePerGas}
#    Sign Eth
#    ...    ${to}
#    ...    ${nonce}
#    ...    ${value}
#    ...    ${data}
#    ...    ${type}
#    ...    ${gasLimit}
#    ...    ${gasPrice}
#    ...    ${chainId}
#    ...    ${maxPriorityFeePerGas}
#    ...    ${maxFeePerGas}
# Sign XRP Transaction
#    [Arguments]    ${transaction}
#    Sign Xrp    ${transaction}
# Sign FILECOIN Transaction
#    [Tags]    filecoin    sign
#    [Arguments]    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
#    Sign Fil    ${to}    ${nonce}    ${value}    ${method}    ${gasLimit}    ${gasFeeCap}    ${gasPremium}    ${params}
# Sign EOS Transaction
#    [Arguments]    ${expiration}    ${refBlockNum}    ${refBlockPrefix}    ${maxNetUsageWords}    ${maxCpuUsageMs}    ${delaySec}    ${actions}
#    Sign Eos
#    ...    ${expiration}
#    ...    ${refBlockNum}
#    ...    ${refBlockPrefix}
#    ...    ${maxNetUsageWords}
#    ...    ${maxCpuUsageMs}
#    ...    ${delaySec}
#    ...    ${actions}
# Sign APTOS Transaction
#    [Tags]    aptos    sign
#    [Arguments]    ${to}    ${amount}    ${module}    ${func}    ${maxGasAmount}    ${typeTag}    ${gasUnitPrice}    ${chainId}    ${sequenceNumber}    ${expTimeStamp}
#    Sign Aptos
#    ...    ${to}
#    ...    ${amount}
#    ...    ${module}
#    ...    ${func}
#    ...    ${maxGasAmount}
#    ...    ${typeTag}
#    ...    ${gasUnitPrice}
#    ...    ${chainId}
#    ...    ${sequenceNumber}
#    ...    ${expTimeStamp}
# Sign TRON Transaction
#    [Tags]    tron    sign
#    [Arguments]    ${refBlockHash}    ${refBlockBytes}    ${refBlockNum}    ${expiration}    ${timestamp}    ${feeLimit}    ${contracts}
#    Sign Tron
#    ...    ${refBlockHash}
#    ...    ${refBlockBytes}
#    ...    ${refBlockNum}
#    ...    ${expiration}
#    ...    ${timestamp}
#    ...    ${feeLimit}
#    ...    ${contracts}
Sign POLKADOT Transaction
    [Tags]    dot    sign
    [Arguments]    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
    dot_keywords.Sign Dot    ${transactionVersion}    ${nonce}    ${specVersion}    ${blockHash}    ${tip}    ${call}
