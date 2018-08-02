using RazorEngine.Templating;

namespace Innovator.ReportEngine
{
  public abstract class HtmlTemplateBase<T> : TemplateBase<T>
  {
    public HtmlHelper Html { get; } = new HtmlHelper();
  }
}
