#!/usr/bin/env bash
FastCli -p 15 -c"
enable
configure
hostname edge1
!
interface Ethernet1
desc TO-LEAF1
no switchport
ip address 192.168.1.2/30
!
ip routing
!
interface Loopback0
description ROUTER-ID
ip address 192.1.1.1/32
!
interface loopback33
description TEST-NETWORK
ip add 33.1.1.1/24
!
router bgp 65002
maximum-paths 4 ecmp 4
router-id 192.1.1.1
neighbor EBGP-TO-LEAF peer-group
neighbor EBGP-TO-LEAF remote-as 65001
neighbor EBGP-TO-LEAF send-community
neighbor 192.168.1.1 peer-group EBGP-TO-LEAF
network 33.1.1.0/24
network 192.1.1.1/32
"