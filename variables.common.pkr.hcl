# vSphere related
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

# VM generic
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
