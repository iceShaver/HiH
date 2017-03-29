<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" />
	
	<xsl:template match="/">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2"/>
				<meta http-equiv="Content-Language" content="pl"/>
				<link rel="stylesheet" type="text/css" href="style.css"/>
			</head>	
			<body>
				<h1><center>Pajęczaki</center></h1>
				<h2>Pająki</h2>
				<xsl:apply-templates select="pajeczaki/pajaki" />
        <h2>Skorpiony</h2>
        <xsl:apply-templates select="pajeczaki/skorpiony" />
      </body>
		</html>
	</xsl:template>

  <xsl:template match="pajaki|skorpiony">
    <br>
      <xsl:apply-templates select="nazwa"/>
    </br>
    <xsl:choose>
      <xsl:when test="@chroniony='tak'">
        <br>
          <xsl:value-of select="nazwa" /> jest chroniony
        </br>
      </xsl:when>
      <xsl:otherwise>
        <br>
          <xsl:value-of select="nazwa" /> nie jest chroniony
        </br>
      </xsl:otherwise>
    </xsl:choose>
    i zamieszkuje środowisko <xsl:value-of select ="wystepowanie/srodowisko/@typ"/>
    <xsl:call-template name="linijka"/>
    <xsl:apply-templates select="wystepowanie/tereny/teren"/>
    <xsl:call-template name="linijka"/><br/>
    <xsl:apply-templates select="zdjecie"/>
    <xsl:call-template name="linijka"/>


  </xsl:template>

  <xsl:template match="nazwa">
    <br/>
    <b>
      Nazwa <xsl:value-of select="@jezyk" />:
      <xsl:value-of select="."/>
    </b>
  </xsl:template>
  <xsl:template name="linijka">
    <br>
      ----------------------------------------------------------------------------------------------
    </br>
  </xsl:template>
  <xsl:template match="teren">
    <br>
      <xsl:number format="a) "/>
      <xsl:value-of select="."/>
    </br>
  </xsl:template>
  <xsl:template match="zdjecie">
    <xsl:element name="img">
      <xsl:attribute name="width">100</xsl:attribute>
      <xsl:attribute name="height">100</xsl:attribute>
      <xsl:attribute name="src">
        <xsl:value-of select="@zrodlo" />
      </xsl:attribute>
      <xsl:attribute name="title">
        <xsl:value-of select="../nazwa[@jezyk='łacińska']" />
      </xsl:attribute>
    </xsl:element> 
  </xsl:template>

</xsl:stylesheet>


