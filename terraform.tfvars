auth_token = "h9FYNNnc3sbdcSr3PUyptriEyRQPqwhg"
project_id = "95f7bcfe-71c5-4dec-a875-74097bc1e74c"

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

## ESX PROVISIONING VARS ##
esx_names                    = [
  { esxname = "da-01-esx05"},
]
esx_ips = [
  { esxip = "172.16.11.105" },
]
esx_subnet    = "255.255.255.0"
esx_gateway   = "172.16.11.253"
esx_dns       = "172.16.11.4"
esx_domain    = "eqx.vmware.com"
esx_mgmtvlan  = "1611"
esx_ntp       = "172.16.11.253"
esx_pw        = "$6$qLziTgXpz$m.NoSunRpyY8uaBMEke5ZXLiHToFrhzS4KH6Ui98qP3STQd3B9nt1/KOascxZTxi2ipZ.ofQw3AJusFE5S8CQ."
esx_size      = "m3.large.x86"
vcf_version   = "vmware_esxi_7_0_vcf"
billing_cycle = "hourly"
