# Static Variables
$ScriptPath = "C:\Scripts\ProfileCleanup\"
$w7ProfilePath = "C:\Citrix\Profiles\Win7\"
$w2012ProfilePath = "C:\Citrix\Profiles\w2012\"

$LogDay = (Get-Date).Day
$LogMonth = (Get-date).Month
$LogYear = (Get-date).Year
$LogTimeHours = (Get-Date).TimeOfDay.Hours
$LogTimeMinutes = (Get-Date).Timeofday.Minutes

$LogDate = "$LogDay$LogMonth$LogYear"
$LogTime = "$LogTimeHours$LogTimeMinutes"
$LogTitle = "ProfileCleanup-$LogDate-$LogTime"

$DateCheck = (Get-Date).AddMonths(-1)
write-host $DateCheck
get-childitem -path $w7ProfilePath | ? {$_.CreationTime -lt (get-date).AddMonths(-1)} | remove-item -recurse -force -ErrorAction SilentlyContinue -verbose 4>"$LogTitle.txt"
