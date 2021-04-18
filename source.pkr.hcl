source "vsphere-iso" "win2019" {
    # Connection Configuration
    vcenter_server          = "${var.vcenter_server}"
    username                = "${var.vsphere_user}"
    password                = "${var.vsphere_password}"
    insecure_connection     = "true"
    datacenter              = "${var.vsphere_datacenter}"

    # Location Configuration
    vm_name                 = "${var.vm_name_win2019}"
    folder                  = "${var.vsphere_folder}"
    cluster                 = "${var.vsphere_cluster}"
    datastore               = "${var.vsphere_datastore}"

    # Hardware Configuration
    CPUs                    = "${var.vm_cpu_num}"
    RAM                     = "${var.vm_mem_size}"
    RAM_reserve_all         = true
    firmware                = "bios"
    # Floppy Configuration
    floppy_files            = ["answer_files/win2019/autounattend.xml", "scripts/disable-network-discovery.cmd", "scripts/disable-servermanager.ps1", "scripts/enable-rdp.cmd", "scripts/enable-winrm.ps1", "scripts/install-vm-tools.cmd", "scripts/set-temp.ps1", "scripts/set-gblocale.ps1", "scripts/install-choco.ps1", "scripts/set-powershelldefault.ps1", "scripts/win-updates.ps1"]
     
    # Shutdown Configuration
    shutdown_command        = "shutdown /s /t 90"

    # CDRom Configuration
    iso_paths               = ["${var.os_iso_path}", "[] /vmimages/tools-isoimages/windows.iso"]
    convert_to_template     = "true"

    # VM Configuration
    guest_os_type           = "windows9Server64Guest"
    network_adapters {
        network             = "${var.vsphere_network}"
        network_card        = "vmxnet3"
    }
    notes                   = ""
    disk_controller_type    = ["lsilogic-sas"]
    storage {
        disk_size             = "${var.os_disk_size}"
        disk_thin_provisioned = "true"
    }

    # Communicator configuration
    communicator            = "winrm" 
    winrm_password          = "${var.winadmin_password}"
    winrm_timeout           = "1h30m"
    winrm_username          = "Administrator"
}

source "vsphere-iso" "win2019_core" {
    # Connection Configuration
    vcenter_server          = "${var.vcenter_server}"
    username                = "${var.vsphere_user}"
    password                = "${var.vsphere_password}"
    insecure_connection     = "true"
    datacenter              = "${var.vsphere_datacenter}"

    # Location Configuration
    vm_name                 = "${var.vm_name_win2019_core}"
    folder                  = "${var.vsphere_folder}"
    cluster                 = "${var.vsphere_cluster}"
    datastore               = "${var.vsphere_datastore}"

    # Hardware Configuration
    CPUs                    = "${var.vm_cpu_num}"
    RAM                     = "${var.vm_mem_size}"
    RAM_reserve_all         = true
    firmware                = "bios"
    # Floppy Configuration
    floppy_files            = ["answer_files/win2019_core/autounattend.xml", "scripts/disable-network-discovery.cmd", "scripts/disable-servermanager.ps1", "scripts/enable-rdp.cmd", "scripts/enable-winrm.ps1", "scripts/install-vm-tools.cmd", "scripts/set-temp.ps1", "scripts/set-gblocale.ps1", "scripts/install-choco.ps1", "scripts/set-powershelldefault.ps1", "scripts/win-updates.ps1"]
     
    # Shutdown Configuration
    shutdown_command        = "shutdown /s /t 90"

    # CDRom Configuration
    iso_paths               = ["${var.os_iso_path}", "[] /vmimages/tools-isoimages/windows.iso"]
    convert_to_template     = "true"

    # VM Configuration
    guest_os_type           = "windows9Server64Guest"
    network_adapters {
        network             = "${var.vsphere_network}"
        network_card        = "vmxnet3"
    }
    notes                   = ""
    disk_controller_type    = ["lsilogic-sas"]
    storage {
        disk_size             = "${var.os_disk_size}"
        disk_thin_provisioned = "true"
    }

    # Communicator configuration
    communicator            = "winrm" 
    winrm_password          = "${var.winadmin_password}"
    winrm_timeout           = "1h30m"
    winrm_username          = "Administrator"
}