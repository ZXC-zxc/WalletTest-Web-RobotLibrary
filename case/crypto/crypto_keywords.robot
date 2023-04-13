*** Settings ***
Documentation       Crypto (Schnorr Ecdsa Ed25519 ...)

Resource            ..${/}common${/}common.robot


*** Variables ***
${CRYPTO TYPE SCHNORR}      Schnorr
${CRYPTO TYPE ECDSA}        Ecdsa
${CRYPTO TYPE ED25519}      Ed25519
${PRIVATE KEY}              4B3867D80E66A985176A4942B98D523F0E1E7DFF8203A8DB85385636090EC67F


*** Keywords ***
Input Private_Key
    [Arguments]    ${privateKey}
    Click Element    privateKeyc
    Input Text    privateKey    ${privateKey}    clear=${True}

Input Message
    [Arguments]    ${message}
    Click Element    messagec
    Input Text    message    ${message}    clear=${True}

Input AuxRand
    [Arguments]    ${auxRand}
    Click Element    auxRandc
    Input Text    auxRand    ${auxRand}    clear=${True}

Select Crypto_Type
    [Arguments]    ${cryptoType}
    Click Element    cryptoType
    Click Element    ${cryptoType}

Sign
    [Tags]    crypto
    [Arguments]    ${cryptoType}    ${privateKey}
    Select Crypto_Type    ${cryptoType}
    Input Private_Key    ${privateKey}
    Random Message
    Sign Message
    ${signature} =    Get Signature
    RETURN    ${signature}
