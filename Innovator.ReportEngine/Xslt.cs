using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Xsl;

namespace Innovator.ReportEngine
{
  internal static class Xslt
  {
    public static void Run(Options options)
    {
      var xslt = new XslCompiledTransform();
      xslt.Load(XmlReader.Create(options.Stylesheet, new XmlReaderSettings()
      {
        DtdProcessing = DtdProcessing.Prohibit
      }), new XsltSettings(false, true), null);

      using (var xmlReader = XmlReader.Create(options.Source))
      using (var textWriter = options.OutputWriter())
      {
        xslt.Transform(xmlReader, null, textWriter);
      }
    }
  }
}
