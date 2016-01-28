if ((Get-PSSnapIn -Name Microsoft.TeamFoundation.PowerShell -ErrorAction SilentlyContinue) -eq $null)
{
    Add-PSSnapin Microsoft.TeamFoundation.PowerShell
}

[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client")  
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.VersionControl.Client")

[string] $tfsCollectionUrl = "http://server:8080/tfs"

$tfServer = New-Object Microsoft.TeamFoundation.Client.TeamFoundationServer($tfsCollectionUrl)
 
$vcServer = $tfServer.GetService([Microsoft.TeamFoundation.VersionControl.Client.VersionControlServer]); 

$fromPath = '$/test/Test folder'
$toPath = '$/test/Test folder-realise-' + $currentWeekNumber

$changesetId = $vcServer.CreateBranch($fromPath, $toPath, [Microsoft.TeamFoundation.VersionControl.Client.VersionSpec]::Latest, $null, "branch bot", $null, $null, $null)
