# Static Variables
$ScriptPath = "C:\Scripts\ProfileCleanup\"
$w7ProfilePath = "C:\Citrix\Profiles\Win7\"
$w2012ProfilePath = "C:\Citrix\Profiles\w2012\"

$LogDay = (Get-Date).Day
$LogMonth = (Get-date).Month
$LogYear = (Get-date).Year
$LogTimeHours = (Get-Date).TimeOfDay.Hours
$LogTimeMinutes = (Get-Date).Timeofday.Minutes

$LogTitle = get-date -format yyyymmdd-hhmm

$DateCheck = (Get-Date).AddMonths(-1)
write-verbose $DateCheck
get-childitem -path $w7ProfilePath | ? {$_.CreationTime -lt (get-date).AddMonths(-1)} | remove-item -recurse -force -ErrorAction SilentlyContinue -verbose | set-content "$logtitle-ProfileCleanup.txt"
