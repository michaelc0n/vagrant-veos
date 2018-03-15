#!/usr/bin/env bash
FastCli -p 15 -c"
enable
configure
hostname edge2
!
interface Ethernet1
desc TO-LEAF2
no switchport
ip address 192.168.2.2/30
!
ip routing
!
interface Loopback0
description ROUTER-ID
ip address 192.2.2.2/32
!
interface loopback33
description TEST-NETWORK
ip add 33.2.2.2/24
!
router bgp 65002
maximum-paths 4 ecmp 4
router-id 192.2.2.2
neighbor EBGP-TO-LEAF peer-group
neighbor EBGP-TO-LEAF remote-as 65001
neighbor EBGP-TO-LEAF send-community
neighbor 192.168.2.1 peer-group EBGP-TO-LEAF
network 33.2.2.0/24
network 192.2.2.2/32
"