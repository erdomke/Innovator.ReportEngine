using RazorEngine.Text;

namespace Innovator.ReportEngine
{
  public class HtmlHelper
  {
    public IEncodedString Raw(string rawString)
    {
      return new RawString(rawString);
    }
  }
}
