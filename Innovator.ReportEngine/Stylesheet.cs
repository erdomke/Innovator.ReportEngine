using RazorEngine;
using System;
using System.IO;
using System.Xml;

namespace Innovator.ReportEngine
{
  public class Stylesheet
  {
    public Language Language { get; } = Language.CSharp;
    public StylesheetType Type { get; } = StylesheetType.Xslt;
    public bool XmlWrapper { get; }

    public Stylesheet(string path)
    {
      if (string.Equals(Path.GetExtension(path), ".cshtml", StringComparison.OrdinalIgnoreCase))
      {
        Type = StylesheetType.Razor;
        Language = Language.CSharp;
        XmlWrapper = false;
      }
      else if (string.Equals(Path.GetExtension(path), ".vbhtml", StringComparison.OrdinalIgnoreCase))
      {
        Type = StylesheetType.Razor;
        Language = Language.VisualBasic;
        XmlWrapper = false;
      }
      else
      {
        using (var xml = XmlReader.Create(path))
        {
          while (xml.Read())
          {
            if (xml.NodeType == XmlNodeType.Element)
            {
              if (string.Equals(xml.LocalName, "razor", StringComparison.OrdinalIgnoreCase))
              {
                Type = StylesheetType.Razor;
                XmlWrapper = true;
                switch (xml.GetAttribute("lang")?.ToLowerInvariant())
                {
                  case "vb":
                  case "vbhtml":
                    Language = Language.VisualBasic;
                    break;
                  default:
                    Language = Language.CSharp;
                    break;
                }
              }
              return;
            }
          }
        }
      }

    }
  }
}
