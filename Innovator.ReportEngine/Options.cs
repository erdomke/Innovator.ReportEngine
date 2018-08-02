using System;
using System.IO;
using System.Text;

namespace Innovator.ReportEngine
{
  public class Options
  {
    public string Source { get; }
    public string Stylesheet { get; }
    public string Output { get; }
    public bool ShowHelp { get; }

    public Options(string[] args)
    {
      for (var i = 0; i < args.Length; i++)
      {
        switch (args[i])
        {
          case "-?":
            ShowHelp = true;
            break;
          case "-o":
            if (i + 1 >= args.Length)
              throw new ArgumentException("Output path is not specified");
            Output = args[++i];
            break;
          default:
            if (string.IsNullOrEmpty(Source))
              Source = args[i];
            else if (string.IsNullOrEmpty(Stylesheet))
              Stylesheet = args[i];
            else
              throw new ArgumentException("Too many parameters");
            break;
        }
      }
    }

    public TextWriter OutputWriter()
    {
      return new StreamWriter(Output, false, new UnicodeEncoding());
    }
  }
}
