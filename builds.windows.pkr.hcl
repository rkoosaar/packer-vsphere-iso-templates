build {
  sources = ["source.vsphere-iso.win2019" ]

  provisioner "windows-shell" {
    inline = ["ipconfig /all"]
  }
}

build {
  sources = ["source.vsphere-iso.win2019_core" ]

  provisioner "windows-shell" {
    inline = ["ipconfig /all"]
  }
}
