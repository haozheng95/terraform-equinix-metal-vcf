auth_token = "h9FYNNnc3sbdcSr3PUyptriEyRQPqwhg"
project_id = "a95dc06b-8c3a-4d3b-8dad-c9c0217db111"

# Metro for this stack
metro = "sv"

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
edge_hardware_reservation_id = "743fcb68-8f12-4a05-8889-695560d90614"
## ESX PROVISIONING VARS ##
esx_names                    = [
  { esxname = "sfo01-m01-esx01", hardware_reservation_id = "80fe8ca1-673e-49a6-9c3f-5bb1168694da" },
  { esxname = "sfo01-m01-esx02", hardware_reservation_id = "bc45471d-cf87-47ec-b0d1-908f38377132" },
  { esxname = "sfo01-m01-esx03", hardware_reservation_id = "b8502ef9-4770-4bb4-9143-ed5422ad86e6" },
  { esxname = "sfo01-m01-esx04", hardware_reservation_id = "e9250785-e25c-4b8d-ab94-e2319437a774" }
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
vcf_version   = "vmware_esxi_7_0_vcf"
billing_cycle = "hourly"
