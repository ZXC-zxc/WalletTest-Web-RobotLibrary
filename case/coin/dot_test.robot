*** Settings ***
Documentation       dot    Example.

Resource            dot_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To Dot Page    To Page    dot

Dot Mnemonic-Derivation-Address    Address Derive From Index    ${INDEX}    dot

Dot Transfer    Sign
    ...    8
    ...    0
    ...    9130
    ...    5d2143bb808626d63ad7e1cda70fa8697059d670a992e82cd440fbb95ea40351
    ...    ${EMPTY}
    ...    {"name":"transfer_keep_alive","transfer_keep_alive":{"keep_alive":true,"dest":"5FCAiG8aXJBYh4QLMViWhn8ZHBM3VjX2D6DK1uWvZC43wG2P","value":"100000"}}
