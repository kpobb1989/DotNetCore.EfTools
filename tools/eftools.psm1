function Add-MigrationEx {
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [Parameter(Position = 0)]
        [string] $Name)
        
    $efProject = GetEFProject
        
    Add-Migration $Name -p $efProject
}

function Remove-MigrationEx {
    [CmdletBinding(PositionalBinding = $false)]
    param(
        [switch] $f)

    $efProject = GetEFProject
    
    if ($f) {
        Remove-Migration -Force -p $efProject
    }
    else {
        Remove-Migration -p $efProject
    } 
}

function GetEFProject {
    $startupProject = GetStartupProject
 
    if (!$startupProject) {
        throw "Startup project was not found"
    }
    
    $appSettings = $startupProject.ProjectItems.Item("appsettings.json")
            
    if (!$appSettings) {
        throw "appsettings.json was not found in the root of the startup project"
    }
            
    $config = Get-Content -Path $appSettings.Properties.Item("FullPath").Value | ConvertFrom-Json
                
    if (!$config.EFProject) {
        throw "EFProject property is missing in your appsettings.json"
    }
                
    return $config.EFProject
}

function GetStartupProject {
    $projects = $DTE.Solution.SolutionBuild.StartupProjects
    
    if ($projects.Length -eq 1) {    
        return Get-Project $projects[0].Split("\")[0]
    }
    else {
        throw "Multiple startup projects are not supported"
    }
}

Set-Alias -Name efam -Value Add-MigrationEx
Set-Alias -Name efrm -Value Remove-MigrationEx
Export-ModuleMember -Function Add-MigrationEx, Remove-MigrationEx -Alias efam, efrm