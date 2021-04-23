
# Windows Specific
variable "vm_name_win2019" {
  type    = string
  default = "pkr-template-win2019"
}

variable "vm_name_win2019_core" {
  type    = string
  default = "pkr-template-win2019-core"
}

variable "os_iso_path_win2019" {
  type    = string
  default = "[ISO] en_windows_server_2019_updated_march_2021_x64_dvd_ec2626a1.iso"
}

variable "winadmin_password" {
  type    = string
  default = "${env("WINADMIN_PASSWORD")}"
}
