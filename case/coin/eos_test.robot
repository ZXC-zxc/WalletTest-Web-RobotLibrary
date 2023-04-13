*** Settings ***
Documentation       Eos    Example.

Resource            eos_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To EOS Page    To Page    eos

Eos Mnemonic-Derivation-Address   Address Derive From Index    ${INDEX}    eos
EOS Transfer    Sign
    ...    2020-08-06T09:50:56
    ...    13949
    ...    241701672
    ...    0
    ...    0
    ...    0
    ...    [{"account":"eosio.token","name":"transfer","authorization":[{"actor":"zijunzimo555","permission":"active"}],"data":{"from":"zijunzimo555","to":"jubitertest4","quantity":"50.0000 EOS","memo":"from jwallet_core"}}]
