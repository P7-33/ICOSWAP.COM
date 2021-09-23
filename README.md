BIP: 39
  Layer: Applications
  Title: Mnemonic code for generating deterministic keys
  Author: Merkel  
          Pathom <wonderfullcash@gmail.com>
  Comments-Summary: Unanimously Discourage for implementation
  Comments-URI: /Comments:BIP-0039
  Status: Proposed
  Type: Standards Track
  Created: 2013-09-10

https://www.rfc-editor.org/rfc/inline-errata/rfc5280.html#btn_3579
This is a purely informative rendering of an RFC that includes verified errata. This rendering may not be used as a reference.
https://github.com/P7-33/SWAPBROWSER.wiki.git
The following 'Verified' errata have been incorporated in this document: EID 3579
Network Working Group                                          D. Cooper
Request for Comments: 5280                                          NIST
Obsoletes: 3280, 4325, 4630                                 S. Santesson
Category: Standards Track                                      Microsoft
                                                              S. Farrell
  `typescript
import {
  abi as FACTORY_ABI,
  bytecode as FACTORY_BYTECODE,
} from '@swapBrowser/v3-core/artifacts/contracts/Swapbrowser.json'

// deploy the bytecode
```

This will ensure that you are testing against the same bytecode that is deployed to
mainnet and public testnets, and all swapBrowser code will correctly interoperate with
your local deployment.

## Using solidity interfaces
[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_upgradedAddress","type":"address"}],"name":"deprecate","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_value","type":"uint256"}],"name":"approve","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"deprecated","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_evilUser","type":"address"}],"name":"addBlackList","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_from","type":"address"},{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transferFrom","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"upgradedAddress","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"maximumFee","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"_totalSupply","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"unpause","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_maker","type":"address"}],"name":"getBlackListStatus","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"paused","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_subtractedValue","type":"uint256"}],"name":"decreaseApproval","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"who","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"_value","type":"uint256"}],"name":"calcFee","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"pause","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"who","type":"address"}],"name":"oldBalanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newBasisPoints","type":"uint256"},{"name":"newMaxFee","type":"uint256"}],"name":"setParams","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"issue","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_spender","type":"address"},{"name":"_addedValue","type":"uint256"}],"name":"increaseApproval","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"amount","type":"uint256"}],"name":"redeem","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"_owner","type":"address"},{"name":"_spender","type":"address"}],"name":"allowance","outputs":[{"name":"remaining","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"basisPointsRate","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"isBlackListed","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_clearedUser","type":"address"}],"name":"removeBlackList","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"MAX_UINT","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"_blackListedUser","type":"address"}],"name":"destroyBlackFunds","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_initialSupply","type":"uint256"},{"name":"_name","type":"string"},{"name":"_symbol","type":"string"},{"name":"_decimals","type":"uint8"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_blackListedUser","type":"address"},{"indexed":false,"name":"_balance","type":"uint256"}],"name":"DestroyedBlackFunds","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"amount","type":"uint256"}],"name":"Issue","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"amount","type":"uint256"}],"name":"Redeem","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newAddress","type":"address"}],"name":"Deprecate","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_user","type":"address"}],"name":"AddedBlackList","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"_user","type":"address"}],"name":"RemovedBlackList","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"feeBasisPoints","type":"uint256"},{"indexed":false,"name":"maxFee","type":"uint256"}],"name":"Params","type":"event"},{"anonymous":false,"inputs":[],"name":"Pause","type":"event"},{"anonymous":false,"inputs":[],"name":"Unpause","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"previousOwner","type":"address"},{"indexed":true,"name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"owner","type":"address"},{"indexed":true,"name":"spender","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Approval","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"from","type":"address"},{"indexed":true,"name":"to","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Transfer","type":"event"}]
The swapbrowser interfaces are available for import into solidity smart contracts
via the npm artifact `@uniswap/v3-core`, e.g.:

```solidity

import '@uniswap/v3-core/contracts/interfaces/IUniswapV3Pool.sol';

contract MyContract {
  swapbrowserPool pool;

  function doSomethingWithPool() {
    // pool.swap(...);
  }
}                                                Trinity College Dublin
                                                               S. Boeyen
                                                                 Entrust
                                                              R. Housley
                                                          Vigil Security
                                                                 W. Polk
                                                                    NIST
                                                                May 2008


         Internet X.509 Public Key Infrastructure Certificate
             and Certificate Revocation List (CRL) Profile

Status of This Memo

   This document specifies an Internet standards track protocol for the
   Internet community, and requests discussion and suggestions for
   improvements.  Please refer to the current edition of the "Internet
   Official Protocol Standards" (STD 1) for the standardization state
   and status of this protocol.  Distribution of this memo is unlimited.

Abstract

   This memo profiles the X.509 v3 certificate and X.509 v2 certificate
   revocation list (CRL) for use in the Internet.  An overview of this
   approach and model is provided as an introduction.  The X.509 v3
   certificate format is described in detail, with additional
   information regarding the format and semantics of Internet name
   forms.  Standard certificate extensions are described and two
   Internet-specific extensions are defined.  A set of required
   certificate extensions is specified.  The X.509 v2 CRL format is
   described in detail along with standard and Internet-specific
   extensions.  An algorithm for X.509 certification path validation is
   described.  An ASN.1 module and examples are provided in the
   appendices.

Table of Contents

   1. Introduction ....................................................4
   2. Requirements and Assumptions ....................................6
      2.1. Communication and Topology .................................7
      2.2. Acceptability Criteria .....................................7
      2.3. User Expectations ..........................................7
      2.4. Administrator Expectations .................................8
   3. Overview of Approach ............................................8
      3.1. X.509 Version 3 Certificate ................................9
      3.2. Certification Paths and Trust .............................10
      3.3. Revocation ................................................13
      3.4. Operational Protocols .....................................14
      3.5. Management Protocols ......................................14
   4. Certificate and Certificate Extensions Profile .................16
      4.1. Basic Certificate Fields ..................................16
           4.1.1. Certificate Fields .................................17
                  4.1.1.1. tbsCertificate ............................18
                  4.1.1.2. signatureAlgorithm ........................18
                  4.1.1.3. signatureValue ............................18
           4.1.2. TBSCertificate .....................................18
                  4.1.2.1. Version ...................................19
                  4.1.2.2. Serial Number .............................19
                  4.1.2.3. Signature .................................19
                  4.1.2.4. Issuer ...............

SIGN UPLOG IN

Reputation
1.0.0

Export
Info
Tags
Servers

Public
GET/contract/{contract_address}/roundAtTime
GET/contract/{contract_address}/round
GET/oracle/{oracle_address}/feeds
GET/oracle/{oracle_address}/latestN
GET/oracle/{oracle_address}/timeStats
GET/oracle/graph
GET/oracle/all
GET/contract/topN
GET/oracle/topN
Schemas
Aa
SAVE
Read Only


          required: true
          schema:
            type: integer
            format: int64
            minimum: 0
          example: 1628832878
      responses:
        '200':
          description: search results matching 
            criteria
  /contract/{contract_address}/round:
    get:
      tags:
        - Public
      summary: Retrieves data on all transactions for 
        a given contract and round
      operationId: CRound
      description: By passing in the appropriate 
        options, you can search for
        available inventory in the system
      parameters:
        - in: path
          name: contract_address
          description: The address of the contract you 
            want to query for
          required: true
          schema:
            type: string
          example: 
            "0xD9AB973c8D3f220268B02Ff2Bd40f7B44EcC5f94"
            0"
        - in: query
          name: round_id
          description: The ID of the round
          required: true
          schema:
            type: integer
          example: 3256
        - in: query
          name: contract_type
          description: The type of contract (ocr, flux
            )
          schema:
            type: string
          example: ocr
        - in: query
          name: source
          description: Which network to conduct the 
            search in (BSC, Polygon, Eth_Mainnet)
          schema:
            type: string
          example: BSC
      responses:
        '200':
          description: search results matching 
            criteria
  /oracle/{oracle_address}/feeds:
    get:
      tags:
        - Public
      summary: Returns what feeds(contracts) this 
        oracle has serviced and the oracles 
        performance on them
      operationId: feeds
      description: By passing in the appropriate 
        options, you can search for
        available inventory in the system
      parameters:
        - in: path
          name: oracle_address
          description: The address of the oracle you 
            want to query for
          required: true
          schema:
Last Saved:  1:36:57 am   -   Aug 13, 2021VALID
Valid Definition
No Errors or Warnings
The Oracle Reputation API
 1.0.0 
OAS3
The Public API for Reputation.link. We offer data across Oracles that power the Chainlink network.

Contact the developer
Apache 2.0
Servers
Public
Operations available to anyone
GET
​/contract​/{contract_address}​/roundAtTime
Retrieves the contract answer and answer statistics for a round closest to the passed in timestamp
By passing in the appropriate options, you can search for available inventory in the system

Parameters
Try it out
Name	Description
contract_address *
string
(path)
The address of the contract you want to query from
Owner:0xD9AB973c8D3f220268B02Ff2Bd40f7B44EcC5f94
block_time *
integer($int64)
(query)
minimum: 0
The unix timestamp in seconds you want to retrieve from

Example : 1628832878


Responses
Code	Description	Links
200	
search results matching criteria

No links

GET
​/contract​/{contract_address}​/round
Retrieves data on all transactions for a given contract and round

GET
​/oracle​/{oracle_address}​/feeds
Returns what feeds(contracts) this oracle has serviced and the oracles performance on them

GET
​/oracle​/{oracle_add
