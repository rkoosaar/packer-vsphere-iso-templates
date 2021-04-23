# Packer templates for Windows Server 2019, Ubuntu and Debian using vSphere-ISO provider

## Note: this code is compatible with Packer v1.7.x or later.

This repository contains **HashiCorp Packer** templates to deploy **Windows Server 2019** and/or **Ubuntu** and **Debian** in **VMware vSphere (with vCenter)**, using the **vsphere-iso** builder.

These templates create the Template (or VM) directly on the vSphere server and install the latest VMware Tools.

# Content: #

## Windows Templates: #
* [./answer_files/win2019/autounattend.xml](./answer_files/win2019/autounattend.xml) --> Answer file for unattended Windows 2019 setup
* [./answer_files/win2019_core/autounattend.xml](./answer_files/win2019_core/autounattend.xml) --> Answer file for unattended Windows 2019 Core setup
* [builds.windows.pkr.hcl](./builds.pkr.hcl) --> Contains configuration for a specific combination of builders, provisioners, and post-processors used to create the image artifact.
* [source.windows.pkr.hcl](./source.pkr.hcl) --> Contains configuration for builder plugins.
* [variables.common.pkr.hcl](./variables.pkr.hcl) --> Contains configuration for variables that can either be defaulted in configuration or set by the user at runtime.
* [variables.windows.pkr.hcl](./variables.pkr.hcl) --> Contains configuration for variables related to Windows Templates

## Linux Templates: #
* [./ubuntu/http/meta-data](./ubuntu/http/meta-data) --> empty file needed for ubuntu subiquity
* [./ubuntu/http/user-data](./ubuntu/http/user-data) --> Answer file for unattended Ubuntu setup
* [./debian/http/preseed.cfg](./debian/http/preseed.cfg) --> Answer file for unattended Debian setup
* [builds.linux.pkr.hcl](builds.linux.pkr.hcl) --> Contains configuration for a specific combination of builders, provisioners, and post-processors used to create the Linux image artifact
* [source.ubuntu.pkr.hcl](source.ubuntu.pkr.hcl) --> Contains configuration for Ubuntu builder plugins
* [source.debian.pkr.hcl](source.debian.pkr.hcl) --> Contains configuration for Debian builder plugins.
* [variables.linux.pkr.hcl](variables.ubuntu.pkr.hcl) --> Contains configuration for variables related to Ubuntu and Debian Templates

## Windows Scripts: #
* [scripts/disable-network-discovery.cmd](./scripts/disable-network-discovery.cmd) --> Script to Disable network discovery
* [scripts/disable-server-manager.ps1](./scripts/disable-server-manager.ps1) --> Script to Disable Server Manager
* [scripts/disable-winrm.ps1](./scripts/disable-winrm.ps1) --> Script to Disable WinRM
* [scripts/enable-rdp.cmd](./scripts/enable-rdp.cmd) --> Script to Enable Remote Desktop
* [scripts/enable-winrm.ps1](./scripts/enable-winrm.ps1) --> Script to Enable WinRM
* [scripts/install-vm-tools.cmd](./scripts/install-vm-tools.cmd) --> Script to Install VMware Tools
* [scripts/set-temp.ps1](./scripts/set-temp.ps1) --> Script to Set Temp Folders
* [scripts/install-choco.ps1](./scripts/install-choco.ps1) --> Script to Install Chocolatey
* [scripts/install-chocoPKGs.ps1](./scripts/install-chocoPKGs.ps1) --> Script to Install PowerShell-Core and VMware Tools (via chocolatey for easy updating) 
* [scripts/win-updates.ps1](./scripts/win-updates.ps1) --> Install Windows Updates

Tested with **VMware ESX 7.0**

# Requirements: #

* Packer --> https://www.packer.io

# How to use: #
export env variables(example below):

```
 export VCENTER_SERVER_NAME=server.vsphere.local
 export VSPHERE_USER=admin@vsphere.local
 export VSPHERE_PASSWORD="Enter Password"
 export VSPHERE_DATACENTER_NAME="vSAN Datacenter"
 export VSPHERE_CLUSTER_NAME="vSAN Cluster"
 export WINADMIN_PASSWORD="Password"
 export LINUXADMIN_PASSWORD="Password"
```

execute **packer build -debug .** --> To build all templates\
execute **packer build -debug -only "*.win2019" .** --> For Windows Server 2019\
execute **packer build -debug -only "*.win2019_core" .** --> For Windows Server 2019 Core\
execute **packer build -debug -only "*.ubuntu" .** --> For Ubuntu\
execute **packer build -debug -only "*.debian" .** --> For Debian

* Use -force if you want to override the template/vm.

# NOTES: #
## Windows Templates: #
* Windows templates are not joined to Active Directory domain
* Windows "Administrator" PASSWORD needs to be changed, currently set as Password in answerfile for easy template creation.
* Windows Updates have been commented out in answer files, remove comments if you wish to use.

## Linux templates: ##
* Ubuntu "uadmin" PASSWORD needs to be changed, currently set as Password in preseed.cfg (encrypted with crypt) for easy template creation.
* Debian "dadmin" PASSWORD needs to be changed, currently set as Password in user-data  (encrypted with crypt) for easy template creation.
