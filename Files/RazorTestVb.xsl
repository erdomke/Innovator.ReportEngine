<razor lang="vb"><![CDATA[
@Imports Innovator.Client
@Imports System.Linq

@Code
  Dim label = Model.Property("label").AsString(Model.Property("name").Value)
End Code

<!DOCTYPE html>
<html>
<head>
  <title>ItemType</title>
</head>
  <body>
    <h1>@label</h1>
    <p>Created: @Model.CreatedOn().AsDateTime().Value.ToString("MMM yyyy")</p>
    <ul>
      @For Each prop As IReadOnlyItem In Model.Relationships("Property").OrderBy(Function(p) p.Property("name").Value)
        @<li>@prop.Property("name").Value</li>
      Next
    </ul>
  </body>
</html>
]]></razor>
