# Set Temp Variable using PowerShell

<# Init Log #>;
Start-Transcript -Path 'C:/Automation/setup.txt' -append;
<#$DebugPreference = 'Continue' #>;
$VerbosePreference = 'Continue';
$InformationPreference = 'Continue';

#Set home location to United Kingdom
Set-WinHomeLocation 0xf2

#Override language list with just English GB
$1 = New-WinUserLanguageList en-GB
$1[0].Handwriting = 1
Set-WinUserLanguageList $1 -force

#Set system local
Set-WinSystemLocale en-GB

#Set the timezone
Set-TimeZone "GMT Standard Time"
