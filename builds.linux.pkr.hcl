build {
  sources = ["source.vsphere-iso.ubuntu" ]

  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}

build {
  sources = ["source.vsphere-iso.debian" ]

  provisioner "shell" {
    inline = ["echo 'Packer Template Build -- Complete'"]
  }
}
