<?xml version='1.0'?>
<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:ms="urn:schemas-microsoft-com:xslt"
      xmlns:dt="urn:schemas-microsoft-com:datatypes">
  <xsl:template match="/">
  <HTML>
  <HEAD>
  </HEAD>
  <BODY> 
   <xsl:for-each select="XMLSamples/FileDetails/Date">
      <DIV>
          Date Unedited:
          <xsl:value-of select="."/>
      </DIV>
      <DIV>
          Date Edited:
          <xsl:value-of select="ms:format-date(., 'MMM dd, yyyy')"/>
      </DIV>
   </xsl:for-each>
  </BODY> 
  </HTML>
</xsl:template>
</xsl:stylesheet>
