*** Settings ***
Documentation       Crypto Example.

Resource            ..${/}case${/}crypto/crypto_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To Crypto Page    To Page    crypto

Schnorr    Sign    ${CRYPTO TYPE SCHNORR}    ${PRIVATE KEY}

Ecdsa    Sign    ${CRYPTO TYPE ECDSA}    ${PRIVATE KEY}

Ed25519    Sign    ${CRYPTO TYPE ED25519}    ${PRIVATE KEY}
