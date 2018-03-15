#!/usr/bin/env bash
FastCli -p 15 -c"
enable
configure
hostname top2
!
interface Ethernet1
description EBGP-TO-LEAF
no switchport
ip address 20.20.20.2/30
!
ip routing
!
interface Loopback0
description ROUTER-ID
ip address 100.100.100.3/32
!
interface loopback22
description TEST-NETWORK
ip add 22.22.22.1/24
!
router bgp 65000
maximum-paths 4 ecmp 4
router-id 100.100.100.3
neighbor EBGP-TO-LEAF peer-group
neighbor EBGP-TO-LEAF remote-as 65001
neighbor EBGP-TO-LEAF send-community
neighbor 20.20.20.1 peer-group EBGP-TO-LEAF
network 22.22.22.0/24
network 20.20.20.0/30
network 100.100.100.3/32
"