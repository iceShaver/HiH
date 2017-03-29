<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xls="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/">
    <ludzie_kina>
    <aktorzy>
      <xls:apply-templates select="aktorzy/aktor" />
    </aktorzy>
    <rezyserzy>
      <xls:apply-templates select="aktorzy/aktor/filmy/film/rezyser" />

    </rezyserzy>
    </ludzie_kina>
  </xsl:template>


  <xsl:template match="aktorzy/aktor|aktorzy/aktor/filmy/film/rezyser">

    <xsl:element name ="osoba">
      <xsl:attribute name="plec">
        <xsl:value-of select="plec"/>
      </xsl:attribute>
      <numer>
        <xsl:value-of select="position()" />
      </numer>
      <ID>
        <xsl:value-of select="ID_osoby"/>
      </ID>
      <imie>
        <xsl:value-of select="imie"/>
      </imie>
      <nazwisko>
        <xsl:value-of select="nazwisko"/>
      </nazwisko>
      <data_urodzenia>
        <xsl:value-of select="data_urodzenia"/>

      </data_urodzenia>

      <miejsce_urodzenia>
        <xsl:value-of select="miejsce_urodzenia"/>

      </miejsce_urodzenia>

    </xsl:element>





  </xsl:template>

  <xsl:template name="zdjecie">
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="@zdjecie"/>
      </xsl:attribute>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
