<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
   <xsl:output method="xml" encoding="utf-8"/>

<xsl:template match="/">
  <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <fo:layout-master-set>
      <fo:simple-page-master master-name="okladka"
                          page-height="29.7cm" page-width="21cm" 
                          margin-top="7cm" margin-bottom="2cm" 
                          margin-left="2.5cm" margin-right="2.5cm">
        <fo:region-body margin-top="2cm" />
      </fo:simple-page-master>
      <fo:simple-page-master master-name="strona"
                          page-height="29.7cm" page-width="21cm" 
                          margin-top="2cm" margin-bottom="1cm" 
                          margin-left="2cm" margin-right="4cm">
        <fo:region-body margin-top="2cm" />
        <fo:region-after extent="10mm"/>
      </fo:simple-page-master>
      <fo:page-sequence-master master-name="nazwa">
	      <fo:repeatable-page-master-alternatives>
		      <fo:conditional-page-master-reference  master-reference="okladka" page-position="first"/>
		      <fo:conditional-page-master-reference master-reference="strona" page-position="rest"/>
	      </fo:repeatable-page-master-alternatives>	
      </fo:page-sequence-master>
    </fo:layout-master-set>
    <fo:page-sequence master-reference="okladka">
      <fo:flow flow-name="xsl-region-body">
	      <fo:block  text-align="center" font-size="30pt">
		      <xsl:apply-templates select="pajeczaki/autor"/>
	      </fo:block>
      </fo:flow>
    </fo:page-sequence>
    <fo:page-sequence master-reference="strona">
      <fo:static-content flow-name="xsl-region-after">
	      <fo:block  text-align="center" font-size="10pt">
		      strona nr <fo:page-number />
	      </fo:block>
      </fo:static-content>
      <fo:flow flow-name="xsl-region-body">
	      <fo:block  text-align="justify" font-size="10pt" >
	        <xsl:apply-templates select="//pajaki"/>
	        <xsl:apply-templates select="//skorpiony"/>
	      </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </fo:root>
</xsl:template>
<xsl:template match="autor">
  <fo:block font-size="20pt" font-family="sans-serif">
    <xsl:value-of select="nazwisko"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="imie"/>
  </fo:block>
  <fo:block font-size="15pt" font-family="sans-serif" margin-top="2cm">
    Hipertekst i hipermedia
  </fo:block>
</xsl:template>
<xsl:template match="pajaki|skorpiony">
  <fo:block >
    <fo:leader leader-length="130mm" leader-pattern="rule" rule-thickness="2pt" color="green"/>
  </fo:block>
  <fo:block font-size="20pt" font-family="sans-serif">
    <xsl:value-of select="nazwa"/>:
    <xsl:apply-templates select="wystepowanie/obszar/teren">
      <xsl:sort select="." />
    </xsl:apply-templates>
  </fo:block>
  <fo:block text-align="left">
    <fo:external-graphic src="{zdjecie/@zrodlo}" width="4cm"/>
  </fo:block >
  <fo:block font-size="20pt" font-family="sans-serif" color="blue" break-after="page">
    <xsl:apply-templates select="opis"/>
  </fo:block>
</xsl:template>

  <xsl:template match="teren">
    <fo:list-block font-size="10pt">
      <fo:list-item start-indent="1cm">
        <fo:list-item-label>
          <fo:block>
            <xsl:value-of select="position()"/>
          </fo:block>
        </fo:list-item-label>
        <fo:list-item-body start-indent="body-start()">
          <fo:block>
            <xsl:value-of select="."/>
          </fo:block>
        </fo:list-item-body>
      </fo:list-item>
    </fo:list-block>
  </xsl:template>

  <xsl:template match="opis">
    <fo:block font-size="14pt" font-family="sans-serif">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>


</xsl:stylesheet>
 
 

