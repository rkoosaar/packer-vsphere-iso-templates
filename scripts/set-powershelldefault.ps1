<# Init Log #>;
Start-Transcript -Path 'C:/Automation/setup.txt' -append;
<#$DebugPreference = 'Continue' #>;
$VerbosePreference = 'Continue';
$InformationPreference = 'Continue';

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name Shell -Value powershell.exe