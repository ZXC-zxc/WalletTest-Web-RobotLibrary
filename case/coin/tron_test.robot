*** Settings ***
Documentation       Tron    Example.

Resource            tron_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To Tron Page    To Page    Tron

Tron Mnemonic-Derivation-Address    Address Derive From Index    ${INDEX}    tron

Tron Transfer    Sign
    ...    2b72b05b7674b257
    ...    9148
    ...    0
    ...    2021-09-28T14:46:18
    ...    1603346193445
    ...    0
    ...    [{"name":"transfer","to_address":"TLb2e2uRhzxvrxMcC8VkL2N7zmxYyg3Vfc","amount":1000000000000000000}]
