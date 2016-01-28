if ((Get-PSSnapIn -Name Microsoft.TeamFoundation.PowerShell -ErrorAction SilentlyContinue) -eq $null)
{
    Add-PSSnapin Microsoft.TeamFoundation.PowerShell
}

[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.Client")  
[void][System.Reflection.Assembly]::LoadWithPartialName("Microsoft.TeamFoundation.WorkItemTracking.Client")

[string] $tfsCollectionUrl = "http://server:8080/tfs"
[string] $projectName = 'test'

$server = New-Object Microsoft.TeamFoundation.Client.TeamFoundationServer($tfsCollectionUrl)
 
$teamProjectCollection = [Microsoft.TeamFoundation.Client.TfsTeamProjectCollectionFactory]::GetTeamProjectCollection($tfsCollectionUrl)	
$csService = $teamProjectCollection.GetService([type]"Microsoft.TeamFoundation.Server.ICommonStructureService")
$wiStore = $teamProjectCollection.GetService([type]"Microsoft.TeamFoundation.WorkItemTracking.Client.WorkItemStore")
$project = $wiStore.Projects[$projectName]
$ls = $csService.ListStructures($project.Uri)

$iterationUri = ($ls | ?{$_.StructureType -eq "ProjectLifecycle"}).Uri
$csService.CreateNode("iteration 100500", $iterationUri)
