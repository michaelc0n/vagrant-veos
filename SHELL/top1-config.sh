#!/usr/bin/env bash
FastCli -p 15 -c"
enable
configure
hostname top1
!
interface Ethernet1
description EBGP-TO-LEAF
no switchport
ip address 10.10.10.2/30
!
ip routing
!
interface Loopback0
description ROUTER-ID
ip address 100.100.100.0/32
!
interface loopback11
description TEST-NETWORK
ip add 11.11.11.1/24
!
router bgp 65000
maximum-paths 4 ecmp 4
router-id 100.100.100.0
neighbor EBGP-TO-LEAF peer-group
neighbor EBGP-TO-LEAF remote-as 65001
neighbor EBGP-TO-LEAF send-community
neighbor 10.10.10.1 peer-group EBGP-TO-LEAF
network 11.11.11.0/24
network 10.10.10.0/30
network 100.100.100.0/32
"