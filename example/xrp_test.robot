*** Settings ***
Documentation       XRP    Example.

Resource            ..${/}case${/}coin${/}xrp_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To XRP Page    To Page    xrp

XRP Mnemonic-Derivation-Address    Address Derive From Index    ${INDEX}    xrp

XRP Payment    Sign Xrp
    ...    {"TransactionType":"Payment","Account":"rhP2Fs6XobyXGGUwJYagkZ5AV5gEaqzwZv","Destination":"ra5nK24KXen9AHvsdFTKHSANinZseWnPcX","Amount":{"currency":"USD","value":"1","issuer":"rhP2Fs6XobyXGGUwJYagkZ5AV5gEaqzwZv"},"Fee":"12","Flags":2147483648,"Sequence":2}
XRP DepositPreauth    Sign Xrp
    ...    {"TransactionType":"DepositPreauth","Account":"rhP2Fs6XobyXGGUwJYagkZ5AV5gEaqzwZv","Authorize":"rhP2Fs6XobyXGGUwJYagkZ5AV5gEaqzwZv","Fee":"10","Flags":2147483648,"Sequence":2}
