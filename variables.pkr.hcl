variable "vcenter_server" {
  type    = string
  default = "${env("VCENTER_SERVER_NAME")}"
}

variable "vsphere_user" {
  type    = string
  default = "${env("VSPHERE_USER")}"
}

variable "vsphere_password" {
  type    = string
  default = "${env("VSPHERE_PASSWORD")}"
}

variable "vsphere_datacenter" {
  type    = string
  default = "${env("VSPHERE_DATACENTER_NAME")}"
}

variable "vsphere_cluster" {
  type    = string
  default = "${env("VSPHERE_CLUSTER_NAME")}"
}

variable "vsphere_datastore" {
  type    = string
  default = "Templates"
}

variable "vsphere_folder" {
  type    = string
  default = "Sandbox/rk_sandbox"
}

variable "vsphere_network" {
  type    = string
  default = "PG-Engineering-Network"
}

variable "vm_name_win2019" {
  type    = string
  default = "pkr-template-win2019"
}

variable "vm_name_win2019_core" {
  type    = string
  default = "pkr-template-win2019-core"
}

variable "vm_cpu_num" {
  type    = string
  default = "2"
}

variable "vm_mem_size" {
  type    = string
  default = "4096"
}

variable "os_disk_size" {
  type    = string
  default = "122880"
}

variable "winadmin_password" {
  type    = string
  default = "${env("WINADMIN_PASSWORD")}"
}

variable "os_iso_path" {
  type    = string
  default = "[ISO] en_windows_server_2019_updated_march_2021_x64_dvd_ec2626a1.iso"
}
