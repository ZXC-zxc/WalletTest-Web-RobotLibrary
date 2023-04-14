*** Settings ***
Documentation       Filecoin    Example.

Resource            ..${/}case${/}coin${/}filecoin_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To Filecoin Page    To Page    fil

Filecoin Mnemonic-Derivation-Address    Address Derive From Index    ${INDEX}    filecoin

Filecoin Transfer    Sign Fil   f1w4rg3kwujtvoyguae7zflcd7ojml6hn7sxk6eny    1    10000    2    10000    10000    10000    ${EMPTY}
