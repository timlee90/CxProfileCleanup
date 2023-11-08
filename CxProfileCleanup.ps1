# Static Variables
$ScriptPath = "C:\Scripts\ProfileCleanup\"
$w7ProfilePath = "C:\Citrix\Profiles\Win7\"
$w2012ProfilePath = "C:\Citrix\Profiles\w2012\"

$DeletionInMonths = "2" # Enter how far you want to go, e.g. 2 to go back 2 months.

# Todays date with format YEAR/MONTH/DAY
$LogTitle = get-date -format yyyymmdd-hhmm

# Date Check for User to ensure that script has written 
$DateCheck = (Get-Date)
$DateLessThan = (Get-Date).AddMonths(-$DeletionInMonths)

write-host "Check current date and date with your chosen value."
write-host "Todays date is $DateCheck."
write-host "You're looking to delete folders older than this date: $DateLessThan, if this is incorrect, you have 10 seconds to CTRL+C"
Start-Sleep 10

get-childitem -path $w7ProfilePath | Where-Object {$_.CreationTime -lt (get-date).AddMonths(-$DeletionInMonths)} | remove-item -recurse -force -ErrorAction SilentlyContinue -verbose | set-content "$logtitle-ProfileCleanup.txt"
