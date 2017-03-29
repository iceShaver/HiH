<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:java="http://xml.apache.org/xslt/java" exclude-result-prefixes="java" version="1.0" xmlns="http://www.w3.org/1999/xhtml">
<xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8" />

<xsl:template match="/">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

		<fo:layout-master-set>
		  <fo:simple-page-master master-name="A4" margin="1cm">
			<fo:region-body  margin="2cm" margin-left="1cm" margin-right="1cm"/>
			<fo:region-before extent="3cm"/>
		  </fo:simple-page-master>
		</fo:layout-master-set>

		<fo:page-sequence master-reference="A4">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block font-size="24pt" font-family="Calibri">Filmoteka</fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="12pt" font-family="Calibri" padding-after="1cm">
					<fo:table table-layout="fixed" width="100%" border="solid black 1px">
					<fo:table-column column-width="8mm"/>
					<fo:table-column column-width="40mm"/>
					<fo:table-column column-width="40mm"/>
					<fo:table-column column-width="13mm"/>
					<fo:table-column column-width="65mm"/>
						<fo:table-header>
							<fo:table-row>
								<fo:table-cell border="solid black 2px">
									<fo:block font-weight="bold" background-color="#cccccc">Lp.</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 2px">
									<fo:block font-weight="bold" background-color="#cccccc">Tytuł PL</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 2px">
									<fo:block font-weight="bold" background-color="#cccccc">Reżyseria</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 2px">
									<fo:block font-weight="bold" background-color="#cccccc">Rok</fo:block>
								</fo:table-cell>
								<fo:table-cell border="solid black 2px">
									<fo:block font-weight="bold" background-color="#cccccc">Obsada</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:apply-templates />
						</fo:table-body>
					</fo:table>
				</fo:block>
			</fo:flow>
			
		</fo:page-sequence>

	</fo:root>
</xsl:template>


<xsl:template match="film">
	<fo:table-row>
		<fo:table-cell border="solid black 1px">
			<fo:block><xsl:number format="1"/></fo:block>
		</fo:table-cell>
		<fo:table-cell border="solid black 1px">
			<fo:block font-family="Calibri"><xsl:value-of select="tytul_pol"/></fo:block>
		</fo:table-cell>
		<fo:table-cell border="solid black 1px">
			<fo:block font-family="Calibri"><xsl:value-of select="rezyser"/></fo:block>
		</fo:table-cell>
		<fo:table-cell border="solid black 1px">
			<fo:block font-family="Calibri"><xsl:value-of select="rok"/></fo:block>
		</fo:table-cell>
		<fo:table-cell border="solid black 1px">
			<fo:block font-family="Calibri"><xsl:value-of select="obsada"/></fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>

<xsl:template name="dataCzas">
	<xsl:value-of select="java:format(java:java.text.SimpleDateFormat.new('dd MMMM yyyy, HH:mm:ss'), java:java.util.Date.new())"/>
</xsl:template>

</xsl:stylesheet>