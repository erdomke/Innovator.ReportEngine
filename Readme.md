# Innovator.ReportEngine

Innovator.ReportEngine is a command-line application which extends [Aras Innovator](http://www.aras.com/) 
to support using [Razor templates](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/getting-started/introducing-razor-syntax-c)
in addition to [XSLT](https://msdn.microsoft.com/en-us/library/ms256069(v=vs.110).aspx) for reports. 
It replaces the `msxsl.exe` application used by Aras.

# Installation

1. Copy `Innovator.ReportEngine.exe` to your server (e.g. `c:\Program Files (x86)\Aras\Innovator11sp12\Innovator\Server\bin`)
1. Modify your [InnovatorServerConfig.xml](https://github.com/erdomke/Innovator.Client/wiki/Innovator-Server-Config)
   to use the application with the parameter `<operating_parameter key="xslt_processor" value="Innovator.ReportEngine.exe" />`
   (Alternatively, rename the application to `msxsl.exe`.)
1. Set the "XSLT" of your report to be a razor file wrapped in the `<razor>` element.  For example:

```xml
<razor><![CDATA[
@using Innovator.Client;
@using System.Linq;

@{
  var label = Model.Property("label").AsString(Model.Property("name").Value);
}

<!DOCTYPE html>
<html>
<head>
  <title>ItemType</title>
</head>
  <body>
    <h1>@label</h1>
    <p>Created: @Model.CreatedOn().AsDateTime().Value.ToString("MMM yyyy")</p>
    <ul>
      @foreach (var prop in @Model.Relationships("Property").OrderBy(p => p.Property("name").Value))
      {
        <li>@prop.Property("name").Value</li>
      }
    </ul>
  </body>
</html>
]]></razor>
```

# Command Line Usage

Innovator.ReportEngine mimics the command line usage of `msxsl.exe`.  In particular, the following
options are available:

```
Usage: Innovator.ReportEngine source stylesheet [options]

Options:
    -?            Show this message
    -o filename   Write output to named file

Remarks:

    If `stylesheet` is a path ending in `.cshtml`, `.vbhtml` or has a root 
    element of `razor`, it is treated as a razor file.  Otherwise, it is 
    treated as an XSLT stylesheet. 
```

The `stylesheet` parameter can be either an XSLT or Razor template. The application will decide
which one it is and how to process it.

# Razor Options

- **Language**: The language (C# or VB) can be controlled with by setting the `lang` attribute to 
  `cs` or `vb` (e.g. `<razor lang="vb">...`).  C# is the assumed default.
  - [C# Razor Reference](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/getting-started/introducing-razor-syntax-c)
  - [VB Razor Reference](https://docs.microsoft.com/en-us/aspnet/web-pages/overview/getting-started/introducing-razor-syntax-vb)
- **Model**: Depending on your preferences, there are several APIs you can use to access the 
  incoming AML.  To explcitly specify the one you want, add a line to your Razor template similar to
 `@model Namespace.Type`
  - By default, razor passes the view a model of the type [`Innovator.Client.IReadOnlyItem`](https://erdomke.github.io/Innovator.Client/api/Innovator.Client.IReadOnlyItem.html).  
    However, other [Innovator.Client](https://github.com/erdomke/Innovator.Client) types can be used 
    instead such as [`IItem`](https://erdomke.github.io/Innovator.Client/api/Innovator.Client.IItem.html),
    [`IReadOnlyResult`](https://erdomke.github.io/Innovator.Client/api/Innovator.Client.IReadOnlyResult.html),
    [`IResult`](https://erdomke.github.io/Innovator.Client/api/Innovator.Client.IResult.html), 
    and models like [`Innovator.Client.Model.ItemType`](https://erdomke.github.io/Innovator.Client/api/Innovator.Client.Model.ItemType.html)
  - If you prefer an API that is more similar to the IOM provided by Aras, use the compatibility classes
    from Innovator.Client such as [`Innovator.Client.IOM.Item`](https://erdomke.github.io/Innovator.Client/api/Innovator.Client.IOM.Item.html).
  - If you want more control over how you process the AML, standard .Net classes are also available
    including `XElement`, `XmlElement`, `string`, `Stream`, etc.

# Developing

To build the project, clone or fork the repository and run the `build.ps1` file.  Artifacts are
output to the `artifacts` folder.