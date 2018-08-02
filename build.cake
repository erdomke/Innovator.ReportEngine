#tool "nuget:?package=ilmerge"

//////////////////////////////////////////////////////////////////////
// ARGUMENTS
//////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");
var configuration = Argument("configuration", "Release");
var versionSuffix = string.Format(".{0}.{1}"
	, (int)((DateTime.UtcNow - new DateTime(2000, 1, 1, 0, 0, 0, DateTimeKind.Utc)).TotalDays)
	, (int)((DateTime.UtcNow - DateTime.UtcNow.Date).TotalSeconds / 2));
var version = "1.0" + versionSuffix;

//////////////////////////////////////////////////////////////////////
// TASKS
//////////////////////////////////////////////////////////////////////

Task("Clean")
  .Does(() =>
{
  CleanDirectory(Directory("./Innovator.ReportEngine/bin/" + configuration + "/"));
  CleanDirectory(Directory("./artifacts/"));
});

Task("Patch-Version")
  .IsDependentOn("Clean")
  .Does(() =>
{
  CreateAssemblyInfo("./Innovator.ReportEngine/Properties/AssemblyInfo.cs", new AssemblyInfoSettings {
    Product = "Innovator.ReportEngine",
    Version = version,
    FileVersion = version,
    Description = "Report generation command-line tool for Aras"
  });
});

Task("Restore-NuGet-Packages")
  .IsDependentOn("Patch-Version")
  .Does(() =>
{
  NuGetRestore("./Innovator.ReportEngine.sln");
});

Task("Build")
  .IsDependentOn("Restore-NuGet-Packages")
  .Does(() =>
{
  var dir = MakeAbsolute(Directory("./artifacts/"));
  if (!DirectoryExists(dir))
    CreateDirectory(dir);
  
  Information("Building to {0}", dir);
  if(IsRunningOnWindows())
  {
    MSBuild("./Innovator.ReportEngine.sln", settings =>
      settings.SetConfiguration(configuration));
  }
  else
  {
    XBuild("./Innovator.ReportEngine.sln", settings =>
      settings.SetConfiguration(configuration));
  }
});

Task("IlMerge")
  .IsDependentOn("Build")
  .Does(() =>
{
  var buildFolder = "./Innovator.ReportEngine/bin/" + configuration;
  var dlls = GetFiles(buildFolder + "/*.dll");
  ILMerge("./artifacts/Innovator.ReportEngine.exe", buildFolder + "/msxsl.exe", dlls);
});

//////////////////////////////////////////////////////////////////////
// TASK TARGETS
//////////////////////////////////////////////////////////////////////

Task("Default")
    .IsDependentOn("IlMerge");

//////////////////////////////////////////////////////////////////////
// EXECUTION
//////////////////////////////////////////////////////////////////////

RunTarget(target);
