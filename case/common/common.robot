*** Settings ***
Documentation       A resource file with reusable keywords and variables.

Library             String
Library             SeleniumLibrary


*** Variables ***
${SERVER}           http://192.168.17.84:8000    # 服务器地址
${BROWSER}          chrome    # chrome
${DELAY}            0    # 延迟
${INDEX}            0    # path    index    默认 0
${MNEMONIC}         gauge hole clog property soccer idea cycle stadium utility slice hold chief    # 助记码
${APTOS PATH}       m/44'/637'/0'/0'/INDEX'    # aptos默认path
${ETHEREUM PATH}    m/44'/60'/0'/0/INDEX    # Ethereum默认path
${EOS PATH}         m/44'/194'/0'/0/INDEX    # Eos默认path
${TRX PATH}         m/44'/195'/0'/0/INDEX    # Trx 默认path
${DOT PATH}         //polkadot//INDEX    # Polkadot 默认path
${FILECOIN PATH}    m/44'/461'/0'/0/INDEX    # filecoin 默认path
${XRP PATH}         m/44'/144'/0'/0/INDEX    # XRP 默认path


*** Keywords ***
Open Browser To Home Page
    Open Browser    ${SERVER}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Setup Main Suite
    Open Browser To Home Page

Setup Template Suite
    [Arguments]    ${coin}
    Open Browser To Home Page
    Get Account    ${coin}

To Page
    [Arguments]    ${coin}
    Go To    ${SERVER}/${coin}

Get Account
    [Arguments]    ${coin}
    Go To    ${SERVER}/${coin}
    Input Mnemonic    ${MNEMONIC}
    Obtain Account

Obtain Account
    Click Element    obtainAccount

Sign Transaction
    Click Element    signTx

Random Message
    Click Element    random

Sign Message
    Click Element    signMessage

Input Mnemonic
    [Arguments]    ${mnemonic}
    Click Element    mnemonicc
    Input Text    mnemonic    ${mnemonic}    clear=${True}

Input Path
    [Arguments]    ${path}
    Click Element    pathc
    Input Text    path    ${path}    clear=${True}

Input Message
    [Arguments]    ${message}
    Click Element    messagec
    Input Text    message    ${message}    clear=${True}

Get Mnemonic
    ${mnemonic} =    Get Value    mnemonic
    RETURN    ${mnemonic}

Get Path
    ${path} =    Get Value    path
    RETURN    ${path}

Get Payload
    ${payload} =    Get Value    payload
    RETURN    ${payload}

Get Raw Transaction
    ${transactonRaw} =    Get Value    txRaw
    RETURN    ${transactonRaw}

Get Path By Index
    [Arguments]    ${PATH}    ${index}
    ${indexStr} =    Convert To String    ${index}
    ${path} =    Replace String    ${PATH}    INDEX    ${indexStr}
    RETURN    ${path}

Get Platform
    ${platform} =    BuiltIn.Evaluate    sys.platform    sys
    RETURN    ${platform}

Get Signature
    ${signature} =    Get Value    signature
    RETURN    ${signature}

Get PublicKey
    ${publicKey} =    Get Value    publicKey
    RETURN    ${publicKey}

Get Address
    ${address} =    Get Value    address
    RETURN    ${address}

Get Message
    ${message} =    Get Value    message
    RETURN    ${message}

Address Derive From Index
    [Tags]    address    derive
    [Arguments]    ${index}    ${coin}
    ${Path Prefix} =    Set Variable    ${EMPTY}
    IF    ${coin == 'aptos'}
        ${Path Prefix } =    Set Variable    ${APTOS PATH}
    ELSE IF    ${coin == 'polkadot'}
        ${Path Prefix } =    Set Variable    ${DOT PATH}
    ELSE IF    ${coin == 'eth'}
        ${Path Prefix} =    Set Variable    ${ETHEREUM PATH}
    ELSE IF    ${coin == 'eos'}
        ${Path Prefix} =    Set Variable    ${EOS PATH}
    ELSE IF    ${coin == 'tron'}
        ${Path Prefix} =    Set Variable    ${TRX PATH}
    ELSE IF    ${coin == 'filecoin'}
        ${Path Prefix} =    Set Variable    ${FILECOIN PATH}
    ELSE IF    ${coin == 'xrp'}
        ${Path Prefix} =    Set Variable    ${XRP PATH}
    END
    ${path} =    Get Path By Index    ${Path Prefix}    ${index}
    Input Path    ${path}
    Obtain Account
    ${address} =    Get Value    address
    RETURN    ${address}

PublicKey Derive From Path
    [Arguments]    ${path}
    Input Path    ${path}
    Obtain Account
    ${publicKey} =    Get PublicKey
    ${publicKey} =    Replace String    ${publicKey}    0x    ${EMPTY}
    RETURN    ${publicKey}

Obtain Account From Mnemonic And Path
    [Arguments]    ${mnemonic}    ${path}
    Input Path    ${path}
    Input Mnemonic    ${mnemonic}
    Obtain Account
