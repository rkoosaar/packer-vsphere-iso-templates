source "vsphere-iso" "ubuntu" {
    # Connection Configuration
    vcenter_server          = "${var.vcenter_server}"
    username                = "${var.vsphere_user}"
    password                = "${var.vsphere_password}"
    insecure_connection     = "true"
    datacenter              = "${var.vsphere_datacenter}"

    # Location Configuration
    vm_name                 = "${var.vm_name_ubuntu}"
    folder                  = "${var.vsphere_folder}"
    cluster                 = "${var.vsphere_cluster}"
    datastore               = "${var.vsphere_datastore}"

    # Hardware Configuration
    CPUs                    = "${var.vm_cpu_num}"
    RAM                     = "${var.vm_mem_size}"
    RAM_reserve_all         = true
    firmware                = "bios"
    # Set VM hardware version, goes up to 19 (ESX 7.0 U2 / 7.0.2)
    vm_version              = "13"
    # Enable nested hardware virtualization for VM. Defaults to false.
    NestedHV                = "false"
 
    # Boot Configuration
    boot_command           = ["<enter><enter><f6><esc><wait> ", "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<enter>"]
    boot_wait              = "5s"

    # Http directory Configuration
    http_directory         = "ubuntu/http"
    # only use below config if your ubuntu template gets stuck on "Timeout waiting for IP"
    http_ip                = "10.17.2.106"

    # Shutdown Configuration
    shutdown_command        = "sudo shutdown -P now"

    # ISO Configuration
    iso_checksum            = "file:https://releases.ubuntu.com/20.04/SHA256SUMS"
    iso_url                 = "https://releases.ubuntu.com/20.04.2/ubuntu-20.04.2-live-server-amd64.iso"

    # VM Configuration
    guest_os_type           = "ubuntu64Guest"
    network_adapters {
        network             = "${var.vsphere_network}"
        network_card        = "vmxnet3"
    }
    notes                   = ""
    disk_controller_type    = ["pvscsi"]
    storage {
        disk_size             = "${var.os_disk_size}"
        disk_thin_provisioned = "true"
    }

    # Communicator Configuration
    communicator            = "ssh"
    ssh_username           = "uadmin"
    ssh_password           = "${var.linuxadmin_password}"
    ssh_handshake_attempts = "20"
    ssh_timeout           = "1h30m"

    # Create as template
    convert_to_template     = "true"
}
