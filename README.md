# DotNetCore.EfTools

EfTools provides alias for common EntityFramework CLI commands

efam => Add-Migration -p ProjectName

efrm (-f optional) => Remove-Migration -p ProjectName

You do not need to change your startup project anymore to the one that has the DbContext class. All you need to do just add EFProject to your appsettings.json

Sample

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
