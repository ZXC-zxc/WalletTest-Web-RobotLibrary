*** Settings ***
Documentation       Crypto Example.

Resource            ..${/}case${/}crypto/crypto_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser
Test Setup          To Page    crypto


*** Test Cases ***
Schnorr    Sign    ${CRYPTO TYPE SCHNORR}    ${PRIVATE KEY}

Ecdsa    Sign    ${CRYPTO TYPE ECDSA}    ${PRIVATE KEY}

Ed25519    Sign    ${CRYPTO TYPE ED25519}    ${PRIVATE KEY}
