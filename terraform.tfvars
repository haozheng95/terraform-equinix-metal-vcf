auth_token = "h9FYNNnc3sbdcSr3PUyptriEyRQPqwhg"
project_id = "42207fc3-dda2-471e-8c84-179908f64f7b"

# Metro for this stack
metro = "DA"

# VLAN provisioning
vlans = [
  {
    vxlan = "1611"
    name  = "Management_Network"
  },
  {
    vxlan = "1612"
    name  = "vMotion Network"
  },
  {
    vxlan = "1613"
    name  = "vSAN Network"
  },
  {
    vxlan = "1614"
    name  = "NSXt_Host_Overlay"
  },
  {
    vxlan = "2711"
    name  = "NSXt_Edge_Uplink1"
  },
  {
    vxlan = "2712"
    name  = "NSXt_Edge_Uplink2"
  },
  {
    vxlan = "2713"
    name  = "NSXt_Edge_overlay"
  }
]

## EDGE PROVISIONING VARS ##
# Routed IP block size /29=8 /28=16 /27=32
public_ips_net               = "8"
edge_hostname                = "vcf-edge-gateway"
edge_size                    = "m3.large.x86"
edge_os                      = "ubuntu_20_04"
pub_ip                       = ""
edge_hardware_reservation_id = "1179304b-9c64-4b41-aa86-3a4524e4dd6d"
## ESX PROVISIONING VARS ##
#Reservation ID3427b365-cebe-4d9a-a4a7-a096ecb42825
#Reservation ID6969869a-23d7-4faf-b687-fc8561079f50
esx_names                    = [
  { esxname = "sfo01-m01-esx01", hardware_reservation_id = "6969869a-23d7-4faf-b687-fc8561079f50" },
  { esxname = "sfo01-m01-esx02", hardware_reservation_id = "3427b365-cebe-4d9a-a4a7-a096ecb42825" },
  { esxname = "sfo01-m01-esx03", hardware_reservation_id = "fc5b8746-c298-4235-821b-4cc4a83b909d" },
  { esxname = "sfo01-m01-esx04", hardware_reservation_id = "fcbebd83-dc75-4dd0-9006-79fb64d1d565" }
]
esx_ips = [
  { esxip = "172.16.11.101" },
  { esxip = "172.16.11.102" },
  { esxip = "172.16.11.103" },
  { esxip = "172.16.11.104" }
]
esx_subnet    = "255.255.255.0"
esx_gateway   = "172.16.11.253"
esx_dns       = "172.16.11.4"
esx_domain    = "sfo.rainpole.io"
esx_mgmtvlan  = "1611"
esx_ntp       = "172.16.11.253"
esx_pw        = "$6$rounds=4096$H7lGcpu7$wwdCf1BOTdhGFoWlfNx9r3tkxmDuGYEGZmJMJ2Y1Quks6ps6Uv7aow5xrGJIzBG2zAZyu32UzZ5um2Gr40ac81"
esx_size      = "m3.large.x86"
vcf_version   = "vmware_esxi_7_0"
billing_cycle = "hourly"
