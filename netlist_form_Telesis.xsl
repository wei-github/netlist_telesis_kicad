<?xml version="1.0" encoding="ISO-8859-1"?>
<!--XSL style sheet to Eeschema Generic Netlist Format to PADS netlist format
    Copyright (C) 2010, SoftPLC Corporation.
    GPL v2.

    How to use:
        https://lists.launchpad.net/kicad-developers/msg05157.html
-->

<!DOCTYPE xsl:stylesheet [
  <!ENTITY nl  "&#xd;&#xa;"> <!--new line CR, LF -->
]>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" omit-xml-declaration="yes" indent="no"/>

<xsl:template match="/export">
    <xsl:text>$PACKAGES&nl;</xsl:text>
    <xsl:apply-templates select="components/comp"/>
    <xsl:text>$NETS&nl;</xsl:text>
    <xsl:apply-templates select="nets/net"/>
    <xsl:text>$END&nl;</xsl:text>
</xsl:template>

<!-- for each component -->
<xsl:template match="comp">
    <xsl:value-of select="substring(footprint,10)"/>
    <xsl:text>! </xsl:text>
    <xsl:value-of select="substring(footprint,10)"/>
    <xsl:text>! </xsl:text>
    <xsl:value-of select="value"/>
	<xsl:text>; </xsl:text>
    <xsl:value-of select="@ref"/>
    <xsl:text>&nl;</xsl:text>
</xsl:template>

<!-- for each net -->
<xsl:template match="net">
    <!-- nets are output only if there is more than one pin in net -->
    <xsl:if test="count(node)>1">
        <xsl:choose>
            <xsl:when test = "@name != '' ">
                <xsl:value-of select="@name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>N-</xsl:text>
                <xsl:value-of select="@code"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>; </xsl:text>
        <xsl:apply-templates select="node"/>
        <xsl:text>&nl;</xsl:text>
    </xsl:if>
</xsl:template>

<!-- for each node -->
<xsl:template match="node">
    <xsl:if test="position()>1">
        <xsl:text> ,&nl;</xsl:text>
    </xsl:if>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@ref"/>
    <xsl:text>.</xsl:text>
    <xsl:value-of select="@pin"/>

</xsl:template>

</xsl:stylesheet>