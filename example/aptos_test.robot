*** Settings ***
Documentation       Aptos    Example.

Resource            ..${/}case${/}coin${/}aptos_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To Aptos Page    To Page    aptos

Aptos Mnemonic-Derivation-Address    Address Derive From Index    ${INDEX}    aptos

Aptos Transfer    Sign Aptos
    ...    0x29cf83251eba17b6043f469e60b426c945f6a6c26fba02874961ceedd62ad6c9
    ...    1000000
    ...    0x1::aptos_account
    ...    transfer
    ...    100000
    ...    ${EMPTY}
    ...    5000
    ...    1
    ...    0
    ...    1670485050
