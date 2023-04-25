*** Settings ***
Documentation       Crypto Example.

Resource            ..${/}case${/}crypto/crypto_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To Crypto Page    To Page    crypto

Schnorr Select    Select Crypto_Type Crypto    ${CRYPTO TYPE SCHNORR}

Schnorr Sign    Sign Random Message Crypto

Ecdsa Select    Select Crypto_Type Crypto    ${CRYPTO TYPE ECDSA}

Ecdsa Sign    Sign Random Message Crypto

Ed25519 Select    Select Crypto_Type Crypto    ${CRYPTO TYPE ED25519}

Ed25519 Sign    Sign Random Message Crypto
