<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"	
    xmlns:xs="http://www.w3.org/2001/XMLSchema"   
    xmlns:tei="http://www.tei-c.org/ns/1.0"    	
    xmlns="http://www.tei-c.org/ns/1.0"    	
    exclude-result-prefixes="#all"   	
    version="2.0" xpath-default-namespace="http://www.tei-c.org/ns/1.0">	
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="node() | @*">      
        <xsl:copy>           
            <xsl:apply-templates select="node() | @*"/>     
        </xsl:copy>
    </xsl:template>
    
    
    <xsl:template match="u">
        <xsl:copy>
            <xsl:copy-of select="@*"/> 
            <xsl:attribute name="xml:lang">mix</xsl:attribute>
            <xsl:apply-templates select="node()"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>