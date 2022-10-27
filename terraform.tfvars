auth_token = "h9FYNNnc3sbdcSr3PUyptriEyRQPqwhg"
project_id = "42207fc3-dda2-471e-8c84-179908f64f7b"

# Metro for this stack
metro = "da"

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

esx_names                    = [
#  { esxname = "da-1-esx1", hardware_reservation_id = "fc5b8746-c298-4235-821b-4cc4a83b909d" },
  { esxname = "da-1-esx2", hardware_reservation_id = "fcbebd83-dc75-4dd0-9006-79fb64d1d565" },
  { esxname = "da-1-esx3", hardware_reservation_id = "fcbebd83-dc75-4dd0-9006-79fb64d1d565" },
  { esxname = "da-1-esx4", hardware_reservation_id = "fcbebd83-dc75-4dd0-9006-79fb64d1d565" },
]
esx_ips = [
#  { esxip = "10.232.11.104" },
  { esxip = "10.232.11.105" },
  { esxip = "10.232.11.106" },
  { esxip = "10.232.11.107" },
]
esx_subnet    = "255.255.255.0"
esx_gateway   = "10.232.11.253"
esx_dns       = "10.232.11.4"
esx_domain    = "eqx.vmware.com"
esx_mgmtvlan  = "1611"
esx_ntp       = "10.232.11.250"
esx_pw        = "$6$D.KxPk3h$bNEqmLU5IRUjlwm/kZ0NFMcdb9vLILgDjo3JYGqGruipKb2dW2KjU3D1FeC7BgFvc5ZTB6KRfRbkIWpQ9N4Ql."
esx_size      = "m3.large.x86"
vcf_version   = "vmware_esxi_7_0_vcf"
billing_cycle = "hourly"
