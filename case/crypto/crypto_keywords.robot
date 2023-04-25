*** Settings ***
Documentation       Crypto (Schnorr Ecdsa Ed25519 ...)

Resource            ..${/}common${/}common.robot


*** Variables ***
${CRYPTO TYPE SCHNORR}      Schnorr
${CRYPTO TYPE ECDSA}        Ecdsa
${CRYPTO TYPE ED25519}      Ed25519


*** Keywords ***
Input AuxRand Crypto
    [Arguments]    ${auxRand}
    Click Element    auxRandc
    Input Text    auxRand    ${auxRand}    clear=${True}

Select Crypto_Type Crypto
    [Arguments]    ${cryptoType}
    Click Element    cryptoType
    Click Element    ${cryptoType}

Sign Random Message Crypto
    [Tags]    crypto
    Random Message
    ${signature} =    Sign Crypto
    RETURN    ${signature}

Sign Message Crypto
    [Tags]    crypto
    [Arguments]    ${message}
    Input Message    ${message}
    ${signature} =    Sign Crypto
    RETURN    ${signature}

Sign Crypto
    [Tags]    crypto
    Sign Message
    ${signature} =    Get Signature
    RETURN    ${signature}
