<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8" />

  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

      <fo:layout-master-set>
        <fo:simple-page-master master-name="strona_tytulowa" margin="1cm" page-width="297mm" page-height="210mm">
          <fo:region-body  margin="2cm"/>
          <fo:region-before extent="10cm"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="strona_pierwsza" margin="1cm" page-width="297mm" page-height="210mm">
          <fo:region-body  margin="2cm"/>
          <fo:region-before extent="3cm"/>
          <fo:region-after extent="1cm"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="strona_druga" margin="1cm" page-width="297mm" page-height="210mm">
          <fo:region-body  margin="2cm"/>
          <fo:region-before extent="3cm"/>
          <fo:region-after extent="1cm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>


      <fo:page-sequence master-reference="strona_tytulowa">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="center" font-size="11px">
            <xsl:text>Kamil Królikowski 165253</xsl:text>
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="center">
            <fo:inline font-size="40px">Ludzie kina</fo:inline>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

      <fo:page-sequence master-reference="strona_pierwsza">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="right" font-size="11px">
            <xsl:text>Kamil Królikowski 165253</xsl:text>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center" font-size="11px">
            <xsl:text>Strona </xsl:text>
            <fo:page-number />
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="center">
            <fo:inline font-size="30px">Aktorzy</fo:inline>
            <fo:table table-layout="fixed" width="100%" border="solid black 1px">
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="40mm"/>
              <fo:table-column column-width="100mm"/>
              <fo:table-header>
                <fo:table-row>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">ID_osoby</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Imie</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Nazwisko</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Data urodzenia</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Zdjecie</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body>
                <xsl:apply-templates select="/aktorzy/aktor" />
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

      <fo:page-sequence master-reference="strona_druga">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block text-align="right" font-size="11px">
            <xsl:text>Kamil Królikowski 165253</xsl:text>
          </fo:block>
        </fo:static-content>
        <fo:static-content flow-name="xsl-region-after">
          <fo:block text-align="center" font-size="11px">
            <xsl:text>Strona </xsl:text>
            <fo:page-number />
          </fo:block>
        </fo:static-content>
        <fo:flow flow-name="xsl-region-body">
          <fo:block text-align="center">
            <fo:inline font-size="30px">Rezyserzy</fo:inline>
            <fo:table table-layout="fixed" width="100%" border="solid black 1px">
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="30mm"/>
              <fo:table-column column-width="40mm"/>
              <fo:table-header>
                <fo:table-row>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">ID_osoby</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Imie</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Nazwisko</fo:block>
                  </fo:table-cell>
                  <fo:table-cell border="solid black 2px">
                    <fo:block font-weight="bold" background-color="#cccccc">Data urodzenia</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>
              <fo:table-body>
                <xsl:apply-templates select="/aktorzy/aktor/filmy/film/rezyser" />
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>


      <!--<fo:page-sequence master-reference="A4">
        <fo:static-content flow-name="xsl-region-before">
          <fo:block font-size="24pt" font-family="Calibri">Ludzie kina</fo:block>
        </fo:static-content>
      </fo:page-sequence>-->

    </fo:root>
  </xsl:template>


  <xsl:template match="/aktorzy/aktor">
    <fo:table-row>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="ID_osoby"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="imie"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="nazwisko"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="data_urodzenia"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <fo:external-graphic>
            <xsl:attribute name="src">
              <xsl:value-of select="@zdjecie"/>
            </xsl:attribute>
            <xsl:attribute name="content-height">
              100px
            </xsl:attribute>

          </fo:external-graphic>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

  <xsl:template match="/aktorzy/aktor/filmy/film/rezyser">
    <fo:table-row>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="ID_osoby"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="imie"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="nazwisko"/>
        </fo:block>
      </fo:table-cell>
      <fo:table-cell border="solid black 1px">
        <fo:block font-family="Calibri">
          <xsl:value-of select="data_urodzenia"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>

</xsl:stylesheet>