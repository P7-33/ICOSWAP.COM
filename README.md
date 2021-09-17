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
