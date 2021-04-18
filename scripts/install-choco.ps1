<# Init Log #>;
Start-Transcript -Path 'C:/Automation/setup.txt' -append;
<#$DebugPreference = 'Continue' #>;
<#$VerbosePreference = 'Continue'; #>;
$InformationPreference = 'Continue';

Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
# Install VMware Tools and powershell-core
choco install powershell-core -y
choco install vmware-tools -y