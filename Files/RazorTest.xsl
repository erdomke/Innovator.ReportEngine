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
