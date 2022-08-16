param($installPath, $toolsPath, $package, $project)

if (!$PSScriptRoot)
{
    $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
}

$moduleToImport = Join-Path $PSScriptRoot 'eftools.psm1'

import-module $moduleToImport -Force -DisableNameChecking