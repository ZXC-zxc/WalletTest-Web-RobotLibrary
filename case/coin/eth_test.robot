*** Settings ***
Documentation       Ethereum    Example.

Resource            eth_keywords.robot

Suite Setup         Setup Main Suite
Suite Teardown      Close Browser


*** Test Cases ***
To ETH Page    To Page    ethereum

ETH Mnemonic-Derivation-Address     Address Derive From Index    ${INDEX}    eth

ETH Transfer    Sign
    ...    0x0000000000000000000000000000000000000000
    ...    0
    ...    100000000
    ...    0x
    ...    1
    ...    21000
    ...    100000000
    ...    1
    ...    100000000
    ...    200000000

ETH Typed Data    Sign Typed Data
    ...    {"types":{"EIP712Domain":[{"name":"name","type":"string"},{"name":"version","type":"string"},{"name":"chainId","type":"uint256"},{"name":"verifyingContract","type":"address"}],"Person":[{"name":"name","type":"string"},{"name":"wallet","type":"address"}],"Mail":[{"name":"from","type":"Person"},{"name":"to","type":"Person"},{"name":"contents","type":"string"}]},"primaryType":"Mail","domain":{"name":"Ether Mail","version":"1","chainId":1,"verifyingContract":"0x1e0Ae8205e9726E6F296ab8869160A6423E2337E"},"message":{"from":{"name":"Cow","wallet":"0xc0004B62C5A39a728e4Af5bee0c6B4a4E54b15ad"},"to":{"name":"Bob","wallet":"0x54B0Fa66A065748C40dCA2C7Fe125A2028CF9982"},"contents":"Hello, Bob!"}}
