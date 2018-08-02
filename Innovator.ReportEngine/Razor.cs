using Innovator.Client;
using RazorEngine.Configuration;
using RazorEngine.Templating;
using System;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Linq;

namespace Innovator.ReportEngine
{
  internal static class Razor
  {
    public static void Run(Options options, Stylesheet stylesheet)
    {
      var template = default(string);
      if (stylesheet.XmlWrapper)
      {
        var xml = XElement.Load(options.Stylesheet);
        template = xml.Value;
      }
      else
      {
        template = File.ReadAllText(options.Stylesheet);
      }

      var match = Regex.Match(template, "@model ([A-Za-z0-9.]+)");
      var modelType = "IReadOnlyItem";
      if (match.Success)
        modelType = match.Groups[1].Value.Split('.').Last();

      GenerateModel(modelType, options.Source, out var type, out var model);
      try
      {
        var key = GetChecksum(template);
        var config = new TemplateServiceConfiguration()
        {
          BaseTemplateType = typeof(HtmlTemplateBase<>),
          DisableTempFileLocking = true,
          Language = stylesheet.Language
        };
        using (var writer = options.OutputWriter())
        using (var service = RazorEngineService.Create(config))
        {
          service.RunCompile(template, key, writer, type, model);
        }
      }
      finally
      {
        try
        {
          if (model is IDisposable disposable)
            disposable.Dispose();
          var tempDirs = Directory.GetDirectories("C:\\Users\\eric.domke\\AppData\\Local\\Temp\\", "RazorEngine*");
          foreach (var dir in tempDirs)
          {
            Directory.Delete(dir, true);
          }
        }
        catch (Exception ex)
        {
          Console.Error.WriteLine(ex.ToString());
        }
      }
    }

    private static string GetChecksum(string template)
    {
      using (var md5 = MD5.Create())
      {
        var bytes = Encoding.UTF8.GetBytes(template);
        return Base32.ToBase32String(md5.ComputeHash(bytes))
          + bytes.Length.ToString("x4");
      }
    }

    private static void GenerateModel(string fullName, string sourcePath, out Type type, out object model)
    {
      var nameParts = fullName.Split('.');
      var name = nameParts.Last().ToLowerInvariant();

      switch (name)
      {
        case "xdocument":
        case "xelement":
        case "xnode":
          var xDoc = XDocument.Load(sourcePath);
          switch (name)
          {
            case "xdocument":
              model = xDoc;
              type = typeof(XDocument);
              return;
            case "xnode":
              model = xDoc.Root;
              type = typeof(XNode);
              return;
            default:
              model = xDoc.Root;
              type = typeof(XElement);
              return;
          }
        case "xmldocument":
        case "xmlnode":
        case "xmlelement":
          var doc = new XmlDocument();
          doc.Load(sourcePath);
          switch (name)
          {
            case "xmldocument":
              model = doc;
              type = typeof(XmlDocument);
              return;
            case "xmlnode":
              model = doc.DocumentElement;
              type = typeof(XmlNode);
              return;
            default:
              model = doc.DocumentElement;
              type = typeof(XmlElement);
              return;
          }
        case "stream":
          model = new FileStream(sourcePath, FileMode.Open, FileAccess.Read);
          type = typeof(Stream);
          return;
        case "streamreader":
          model = new StreamReader(sourcePath);
          type = typeof(StreamReader);
          return;
        case "textreader":
          model = new StreamReader(sourcePath);
          type = typeof(TextReader);
          return;
        case "xmlreader":
          model = XmlReader.Create(sourcePath);
          type = typeof(XmlReader);
          return;
        case "string":
          model = File.ReadAllText(sourcePath);
          type = typeof(string);
          return;
        case "item":
          if (nameParts.Length > 1 && nameParts[nameParts.Length - 2] == "Client")
          {
            using (var reader = XmlReader.Create(sourcePath))
            {
              var result = ElementFactory.Local.FromXml(reader);
              model = result.AssertItem();
              type = typeof(Item);
            }
          }
          else
          {
            var inn = new Client.IOM.Innovator(new NullConnection());
            model = inn.newItemFromAml(File.ReadAllText(sourcePath));
            type = typeof(Client.IOM.Item);
          }
          return;
        default:
          using (var reader = XmlReader.Create(sourcePath))
          {
            var result = ElementFactory.Local.FromXml(reader);
            switch (name)
            {
              case "iresult":
                model = result;
                type = typeof(IResult);
                return;
              case "ireadonlyresult":
                model = result;
                type = typeof(IReadOnlyResult);
                return;
              case "iitem":
                model = result.AssertItem();
                type = typeof(IItem);
                return;
              default:
                model = result.AssertItem();
                if (string.Equals(model.GetType().Name, name, StringComparison.OrdinalIgnoreCase))
                  type = model.GetType();
                else
                  type = typeof(IReadOnlyItem);
                return;
            }
          }
      }
    }

    private class NullConnection : IConnection
    {
      public ElementFactory AmlContext => ElementFactory.Local;

      public string Database => throw new NotSupportedException();

      public string UserId => throw new NotSupportedException();

      public UploadCommand CreateUploadCommand()
      {
        throw new NotSupportedException();
      }

      public ExplicitHashCredentials HashCredentials(ICredentials credentials)
      {
        throw new NotSupportedException();
      }

      public string MapClientUrl(string relativeUrl)
      {
        throw new NotSupportedException();
      }

      public Stream Process(Command request)
      {
        throw new NotSupportedException();
      }
    }
  }
}
