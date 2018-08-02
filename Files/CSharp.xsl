<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:msxsl="urn:schemas-microsoft-com:xslt"
xmlns:my="http://www.wackylabs.net/dotnet"
exclude-result-prefixes="my msxsl">
<xsl:output indent="yes" />
<msxsl:script implements-prefix='my' language='C#'>
<![CDATA[
public XPathNavigator ParseXml(string xml)
{
System.IO.StringReader sr = new System.IO.StringReader(xml);
XPathDocument doc = new XPathDocument(sr);
return doc.CreateNavigator();
}
]]>
</msxsl:script>
<xsl:template match="/">
<root>
<child>
<xsl:copy-of select="my:ParseXml(string(.))" />
</child>
</root>
</xsl:template>
</xsl:stylesheet>