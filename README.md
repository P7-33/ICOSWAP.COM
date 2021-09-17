https://www.rfc-editor.org/rfc/inline-errata/rfc5280.html#btn_3579
This is a purely informative rendering of an RFC that includes verified errata. This rendering may not be used as a reference.

The following 'Verified' errata have been incorporated in this document: EID 3579
Network Working Group                                          D. Cooper
Request for Comments: 5280                                          NIST
Obsoletes: 3280, 4325, 4630                                 S. Santesson
Category: Standards Track                                      Microsoft
                                                              S. Farrell
                                                  Trinity College Dublin
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

40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
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
            "0xed3a0ac63d7e48399d05d9a25925e8fcb0cd98d
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
Owner:0x15ABC36db169Ca06670791B143A19bEc7Ba4e83f
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
