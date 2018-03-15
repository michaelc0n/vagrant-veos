#!/usr/bin/env bash
FastCli -p 15 -c"
enable
configure
hostname leaf1
!
interface Ethernet1
description EBGP-TO-TOP
no switchport
ip address 10.10.10.1/30
!
interface Ethernet2
description IBGP-TO-LEAF-PEER
no switchport
ip address 1.1.1.1/30
!
interface Ethernet3
desc TO-EDGE
no switchport
ip address 192.168.1.1/30
!
ip routing
!
interface Loopback0
description ROUTER-ID
ip address 100.100.100.1/32
!
router bgp 65001
maximum-paths 4 ecmp 4
router-id 100.100.100.1
neighbor EBGP-TO-TOP peer-group
neighbor EBGP-TO-TOP remote-as 65000
neighbor EBGP-TO-TOP send-community
neighbor IBGP-TO-LEAF-PEER peer-group
neighbor IBGP-TO-LEAF-PEER remote-as 65001
neighbor IBGP-TO-LEAF-PEER next-hop-self
neighbor IBGP-TO-LEAF-PEER send-community
neighbor EBGP-TO-EDGE peer-group
neighbor EBGP-TO-EDGE remote-as 65002
neighbor EBGP-TO-EDGE send-community
neighbor 1.1.1.2 peer-group IBGP-TO-LEAF-PEER
neighbor 10.10.10.2 peer-group EBGP-TO-TOP
neighbor 192.168.1.2 peer-group EBGP-TO-EDGE
network 10.10.10.0/30
network 100.100.100.1/32
"