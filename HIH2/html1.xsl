<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xls="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
      </head>
      <body>
        <h2>
          Aktorzy
        </h2>
        <div class="aktorzy">
          <xsl:apply-templates select="aktorzy/aktor" >
            <xsl:sort select="data_urodzenia" order="descending"/>
          </xsl:apply-templates>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="aktorzy/aktor">

    <div class="aktor">

      <div class="name">
        <xsl:value-of select="imie"/>&#160;
        <xsl:value-of select="nazwisko"/>
      </div>

      <div class="details">
        ID aktora: <xsl:value-of select="ID_osoby"/>&#160;&#124;
        Data urodzenia: <xsl:value-of select="data_urodzenia"/>&#160;&#124;
        Miejsce urodzenia: <xsl:value-of select="miejsce_urodzenia"/>
      </div>
      <div class="zdjecie">
        <xsl:call-template name="zdjecie"/>
      </div>
      <div class="strona">
        Strona internetowa:
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="link" />
          </xsl:attribute>
          <xsl:value-of select="link" />
        </a>
      </div>
      <div class="rodzina">
        <div class="header">
          Rodzina:
        </div>
        <xsl:apply-templates select="rodzina" />
      </div>
      <div class="filmy">
        <div class="header">
          Filmy, w których grał/a:
        </div>
        <xsl:apply-templates select="filmy/film"/>
      </div>

    </div>
    <hr></hr>
  </xsl:template>

  <xsl:template match="filmy/film">
    <div class="content">
      <div class="title">
        <xsl:number/>.
        <xsl:value-of select="tytul[@jezyk='polski']"/>
        <xsl:if test="tytul[@jezyk='polski']!=tytul[@jezyk='angielski']" >
          (<xsl:value-of select="tytul[@jezyk='angielski']"/>)
        </xsl:if>
      </div>
      <div class="details">
        <xsl:variable name="data" select="1990-01-01" />
        ID filmu: <xsl:value-of select="ID_filmu"/>&#160;&#124;
        Rok premiery:
        <xsl:choose>
          <xsl:when test="rok_premiery &gt;  $data">
            <span style="color: red">
              <xsl:value-of select="rok_premiery"/>
            </span>
          </xsl:when>
          <xsl:when test="rok_premiery &lt; $data">
            <span style="color: green">
              <xsl:value-of select="rok_premiery"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span style="color: black">
              <xsl:value-of select="rok_premiery"/>
            </span>
          </xsl:otherwise>
        </xsl:choose>

        <xsl:value-of select="rok_premiery"/>&#160;&#124;
        Kraj: <xsl:apply-templates select="kraj"/>&#160;&#124;
        Gatunek: <xsl:apply-templates select="gatunek"/>&#160;&#124;
        Budżet($):
        <xsl:choose>
          <xsl:when test="budzet &gt; 200000000">
            <span style="color: red">
              <xsl:value-of select="format-number(budzet, '###,###,###,###')"/>
            </span>
          </xsl:when>
          <xsl:when test="budzet &lt; 100000000">
            <span style="color: green">
              <xsl:value-of select="format-number(budzet, '###,###,###,###')"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <span style="color: black">
              <xsl:value-of select="format-number(budzet, '###,###,###,###')"/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </div>
      <div class="kadr">
        <xsl:call-template name="kadr"/>
      </div>
      <div class="content">
        Reżyser:
        <div class="rezyser">
          <xsl:apply-templates select="rezyser" />
        </div>
      </div>
    </div>
  </xsl:template>

  <xsl:template match="rezyser">
    <div class="name">
      <xsl:value-of select="imie"/>&#160;
      <xsl:value-of select="nazwisko"/>
    </div>

    <div class="details">
      ID rezysera: <xsl:value-of select="ID_osoby"/>
      Data urodzenia: <xsl:value-of select="data_urodzenia"/>
      Miejsce urodzenia: <xsl:value-of select="miejsce_urodzenia"/>
    </div>
  </xsl:template>

  <xsl:template match="rodzina">
    <div class="content">
      Parter/ka:
      <xsl:value-of select="partner"/>
      <br/>
      Dzieci:
      <xsl:value-of select="dzieci"/>
    </div>
  </xsl:template>

  <xsl:template name="kadr">
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="@kadr"/>
      </xsl:attribute>
      <xsl:attribute name="height">200px</xsl:attribute>

    </xsl:element>
  </xsl:template>

  <xsl:template name="zdjecie">
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="@zdjecie"/>
      </xsl:attribute>
      <xsl:attribute name="height">200px</xsl:attribute>

    </xsl:element>
  </xsl:template>

  <xsl:template match="kraj">
    <xsl:value-of select="concat(., '&#xA;')"/>
  </xsl:template>

  <xsl:template match="gatunek">
    <xsl:value-of select="concat(., '&#xA;')"/>
  </xsl:template>



</xsl:stylesheet>
