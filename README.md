# DotNetCore.EfTools

EfTools provides alias for common EntityFramework CLI commands and simplifies working with EF. No need to change your startup project anymore to the one that contains DbContext, since you can specify EFProject in your appsettings.json

Prerequisites
1. Install Microsoft.EntityFrameworkCore.Tools to your host project
2. Install DotNetCore.EfTools to your host project
3. Add "EFProject": "Project_Name_Contains_DbContext" in your appsettings.json

New CLI alias:
```
efam // the same as Add-Migration -p EFProject
  
efrm (-f optional) // the same as Remove-Migration -p EFProject
```
  
appsettings.json sample
```
{
  "EFProject":  "App.DB",
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "AllowedHosts": "*"
}
```
