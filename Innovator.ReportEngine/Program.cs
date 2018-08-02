using System;
using System.IO;
using System.Xml;
using System.Xml.Xsl;

namespace Innovator.ReportEngine
{
  internal static class Program
  {
    internal static int Main(string[] args)
    {
      try
      {
        var options = new Options(args);
        if (options.ShowHelp)
        {
          Console.WriteLine(@"Usage: MSXSL source stylesheet [options]

Options:
    -?            Show this message
    -o filename   Write output to named file

Remarks:

    If `stylesheet` is a path ending in `.cshtml`, `.vbhtml` or has a root 
    element of `razor`, it is treated as a razor file.  Otherwise, it is 
    treated as an XSLT stylesheet.");
        }
        else
        {
          var stylesheet = new Stylesheet(options.Stylesheet);
          if (stylesheet.Type == StylesheetType.Xslt)
            Xslt.Run(options);
          else
            Razor.Run(options, stylesheet);
        }
        return 0;
      }
      catch (Exception ex)
      {
        Console.Error.WriteLine(ex.ToString());
        return -1;
      }
    }


  }
}
