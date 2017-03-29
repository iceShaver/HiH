<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xls="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
      </head>
      <body>
        <h2>
          <div style="text-align:center">
            Ludzie kina:
          </div>
        </h2>
        <table cellpadding="5" cellspacing="5" align="center">
          <tr>
            <th>LP</th>
            <th>ID osoby</th>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Data urodzenia</th>
            <th>Miejsce urodzenia</th>
          </tr>
          <xsl:apply-templates select="aktorzy/aktor|aktorzy/aktor/filmy/film/rezyser"/>
        </table>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="aktorzy/aktor|aktorzy/aktor/filmy/film/rezyser">
    <tr>
      <td>
        <xsl:value-of select="position()" />
      </td>
      <td>
        <xsl:value-of select="ID_osoby"/>
      </td>
      <td>
        <xsl:value-of select="imie"/>
      </td>
      <td>
        <xsl:value-of select="nazwisko"/>
      </td>
      <td>
        <xsl:value-of select="data_urodzenia"/>
      </td>
      <td>
        <xsl:value-of select="miejsce_urodzenia"/>
      </td>
    </tr>
  </xsl:template>
  
  <xsl:template name="zdjecie">
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="@zdjecie"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
