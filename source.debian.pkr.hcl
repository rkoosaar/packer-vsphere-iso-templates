source "vsphere-iso" "debian" {
    # Connection Configuration
    vcenter_server          = "${var.vcenter_server}"
    username                = "${var.vsphere_user}"
    password                = "${var.vsphere_password}"
    insecure_connection     = "true"
    datacenter              = "${var.vsphere_datacenter}"

    # Location Configuration
    vm_name                 = "${var.vm_name_debian}"
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
    boot_command          = ["<esc><wait>", "install <wait>", " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg <wait>", "debian-installer=en_GB.UTF-8 <wait>", "auto <wait>", 
    "locale=en_GB.UTF-8 <wait>", "kbd-chooser/method=gb <wait>", "keyboard-configuration/xkb-keymap=gb <wait>", "netcfg/get_hostname={{ .Name }} <wait>", "netcfg/get_domain=bromium.net <wait>", 
    "fb=false <wait>", "debconf/frontend=noninteractive <wait>", "console-setup/ask_detect=false <wait>", "console-keymaps-at/keymap=gb <wait>", "grub-installer/bootdev=/dev/sda <wait>", "<enter><wait>"]
    boot_order            = "disk,cdrom"
    boot_wait              = "5s"

    # Http directory Configuration
    http_directory         = "debian/http"
    # only use below config if your debian template gets stuck on "Timeout waiting for IP"
    http_ip                = "10.17.2.106"

    # Shutdown Configuration
    shutdown_command        = "sudo -S /sbin/shutdown -hP now"

    # ISO Configuration
    iso_checksum            = "file:https://cdimage.debian.org/cdimage/release/10.9.0/amd64/iso-cd/SHA256SUMS"
    iso_url                 = "https://cdimage.debian.org/cdimage/release/10.9.0/amd64/iso-cd/debian-10.9.0-amd64-netinst.iso"

    # CDRom Configuration
    # iso_paths               = ["${var.os_iso_path_ubuntu}"]
    # cdrom_type              = "sata"
    # remove_cdrom            = "true"

    # VM Configuration
    guest_os_type           = "debian10_64Guest"
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
    ssh_username           = "dadmin"
    ssh_password           = "${var.linuxadmin_password}"
    ssh_handshake_attempts = "20"
    ssh_timeout           = "10000s"

    # Create as template
    convert_to_template     = "true"
}
