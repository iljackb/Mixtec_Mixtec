<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.tei-c.org/ns/1.0"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- File should be moved or copied to folder w files undergoing transformation -->
    
    <!-- Set up transformation scenario on this xslt script itself as the specific file to be processed is specified in param @type="imput"-->
    <!-- version 2019-11-20-->
    
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    
    <xsl:strip-space elements="*"/>
    
    <xsl:param name="input" as="xs:string" select="'pozole-escobe_TS.txt'"/>
    <!-- TRY THIS W/O "@select" and see if it runs on all files in directory -->
    
    <xsl:variable name="input-wo-extension" as="xs:string" select="substring-before($input,'.txt')"/>
    
    
    <xsl:param name="text-encoding" as="xs:string" select="'UTF-16'"/>
    <!-- utf-8 ISO-8859-1 and it works well. I think it's for European characters, which is fine. I still don't know why UTF-16 -->
    
    <!-- Reading the text file $input into the string variable $input-text -->
    <xsl:variable name="input-text" as="xs:string" select="unparsed-text($input, $text-encoding)"/>
    
    <!-- Trouble shooting with: http://rishida.net/tools/conversion/ -->
    
    <!-- splitting the input into lines -->
    <xsl:variable name="lines"  as="xs:string*" select="tokenize($input-text, '\r?\n')"/>
    
    <!-- input files mush have iso 639 code (if exists) as header of collumn) -->

   <xsl:param name="speakerInit">
       <xsl:value-of select="'TS'"/>
   </xsl:param>
   
        <!--   <xsl:param name="speakerName">	
   
        <xsl:value-of select=" substring-after( substring-before($input,'.txt'),'_')"/>
        <xsl:value-of select="'Tisu Salazar'"/>
    </xsl:param>  -->

    <!-- PSEUDO CODE
        
element "data"
  for each line tokenize the line by delimiter
    element "row"
      for each field n
        element "header n"
          content of field n
        end of element "header n"
      end for
    end of element "row"
  end for
end of element "data"
    
    -->
    
    <xsl:variable name="teiHeader">
        <teiHeader>
            <fileDesc>
                <titleStmt>
                    <title>TEI output for Praat transcriptions of file: <xsl:value-of select="$input-wo-extension"/>.wav</title>
                    <respStmt>
                        <resp>Annotation</resp>
                        <resp>Encoding</resp>
                        <name xml:id="JB">Jack Bowers</name>
                    </respStmt>
                    <respStmt>
                        <resp>Speaker</resp>
                        <name xml:id="{$speakerInit}">Tisu'ma Salazar</name>
                             <!-- <xsl:value-of select="$speakerName"/>
                           ADD FROM END OF FILENAME STRING!! -->
                            <!-- CREATE VARIABLES FOR EACH SPEAKER
                                & ASSIGN DESIGNATED INITIALS AS VALUE 
                                OF @xml:id
                            -->
                    </respStmt>
                </titleStmt>
                <publicationStmt>
                    <p>Publication Information</p>
                </publicationStmt>
                <sourceDesc>
                    <p>This file was converted from of the speech file <ptr target="soundfiles-gen:{concat($input-wo-extension,'.wav')}"/> which was extracted from the Praat TextGrid transcriptions of the speech file <ref><xsl:value-of select="$input-wo-extension"/>.wav</ref>. However, the original soundfile was lost and thus is not available.</p>
                </sourceDesc>
                <sourceDesc>
                    <recordingStmt>
                        <recording type="audio">
                            <respStmt>
                                <resp>Recording</resp>
                                <resp>Elicitation</resp>
                                <name>Jack Bowers</name>
                            </respStmt>
                            <equipment>
                                <ab>Audio recorded using a Tascam DR-05X Linear PCM Recorder at a rate of 96kHz/24-bit.</ab>
                            </equipment>
                            <ab>
                                <location>
                                    <address>
                                        <addrLine>12 Wohlebengasse</addrLine>
                                    </address>
                                    <affiliation>Austrian Academy of Sciences</affiliation>
                                    <placeName>Vienna</placeName>
                                    <country>Austria</country>
                                </location>
                            </ab>
                            <date>2017-08-11</date>
                            <ab>Content was recorded using <term ana="#elicitation-translation">Translation-based elicitation</term> using <lang>English</lang> and/or <lang>Spanish</lang>.</ab>
                        </recording>
                    </recordingStmt>
                </sourceDesc>
            </fileDesc>
            <encodingDesc>
                <classDecl>
                    <taxonomy>
                        <desc>Typology of linguistic speech events captured in recordings as per: <bibl>Himmelmann (<date>1998</date>)</bibl>. aka Typology of "naturalness".</desc>
                        <category xml:id="observed">
                            <catDesc>
                                <term>Observed communicative event:</term> the extent of external interference is limited to the knowledge of the speakers that the speech is being recorded or observed.</catDesc>
                        </category>
                        <category xml:id="staged">
                            <catDesc>
                                <term>Staged communicative event:</term> speech events realized for the purpose of recording (i.e. elicited speech). Events are not really being realized for the purpose of communication but for the benefit of the investigator.</catDesc>
                            <category xml:id="staged-free-topical">
                                <catDesc>
                                    <term>Staged-Topical</term>Prompt to speak freely about topic</catDesc>
                            </category>
                            <category xml:id="staged-stimuli">
                                <catDesc>
                                    <term>Staged-Stimuli</term> events based on stimuli to be described in speakers own words</catDesc>
                            </category>
                        </category>
                        <category xml:id="elicitation">
                            <catDesc>
                                <term>Elicitation:</term> speech act for the sole purpose of linguistic investigation. (A new type of speech event for most communities).</catDesc>
                            <category xml:id="elicitation-contextualizing">
                                <catDesc>
                                    <term>Contextualizing elicitation:</term> where native speakers are asked to provide contexts for a item or construction as prompted by the investigator.</catDesc>
                            </category>
                            <category xml:id="elicitation-translation">
                                <catDesc>
                                    <term>Translation-based elicitation:</term> native speaker asked to translate item from second language</catDesc>
                            </category>
                            <category xml:id="elicitation-judgement">
                                <catDesc>
                                    <term>Judgement:</term> where native speakers are asked to judge the acceptibility of a given construction based on any aspect of language, e.g. grammar, etc.</catDesc>
                            </category>
                        </category>
                    </taxonomy>
                </classDecl>
                <listPrefixDef>
                    <prefixDef ident="praat-export"
                        matchPattern="([a-zA-Z0-9]+)"
                        replacementPattern="../media/speech-mix/with-txtgrd/#$1"/>
                    <prefixDef ident="soundfiles-gen"
                        matchPattern="([a-zA-Z0-9]+)"
                        replacementPattern="../media/speech-mix/with-txtgrd/#$1"/>
                    <prefixDef ident="soundfiles-oax"
                        matchPattern="([a-zA-Z0-9]+)"
                        replacementPattern="../oaxaca/#$1"/>
                    <prefixDef ident="stimuli"
                        matchPattern="([a-zA-Z0-9]+)"
                        replacementPattern="../media/stimuli/#$1"/>
                </listPrefixDef>
            </encodingDesc>
        </teiHeader>
    </xsl:variable>

    <!-- adapt to not select headers!!! -->
    <xsl:variable name="lines-into-tabs" as="element()*">
        <xsl:for-each select="$lines[. != '']">
            <xsl:variable name="lpos" select="position()"/>
            <xsl:if test="not(starts-with(normalize-space(.), 'ilo'))">
                <line>
                    <xsl:for-each select="tokenize(., '\t')">
                        <xsl:choose>
                            <xsl:when test="position() eq 1">
                                <start><xsl:value-of select="."/></start>
                            </xsl:when>
                            <xsl:when test="position() eq 2">
                                <tier><xsl:value-of select="."/></tier>
                            </xsl:when>
                            <xsl:when test="position() eq 3">
                                <text><xsl:value-of select="."/></text>
                            </xsl:when>
                            <xsl:when test="position() eq 4">
                                <end><xsl:value-of select="."/></end>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:message terminate="yes">Too many columns in line <xsl:value-of select="$lpos"/>.</xsl:message>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </line>
            </xsl:if>
        </xsl:for-each>
    </xsl:variable>
    
    <xsl:variable name="praat-parsed" as="element()*">
        <xsl:for-each-group select="$lines-into-tabs" group-by="start">
            <xsl:for-each select="current-group()">
                <xsl:message>tier: <xsl:value-of select="tier"/> </xsl:message>
                <xsl:element name="{tier}">
                    <xsl:attribute name="start" select="start"/>
                    <xsl:attribute name="end" select="end"/>
                    <xsl:value-of select="text"/>
                </xsl:element>
            </xsl:for-each>
        </xsl:for-each-group>
    </xsl:variable>
    
    <xsl:template match="/">
        <!--  
        <xsl:message><xsl:value-of select="praat-parsed[2]/*/@start"/></xsl:message>
        -->
        <xsl:result-document href="{replace($input,'\.txt$','.xml')}">
            <TEI>
                <xsl:sequence select="$teiHeader"/>
                <!--<xsl:sequence select="$lines-into-tabs"/>-->
                <text>
                    <body>
                        
                        <timeline>
                           <!-- when @xml:id @interval -->
                            <xsl:for-each select=" distinct-values($praat-parsed/@start | $praat-parsed/@end)">
                                <when xml:id="{concat('T',.)}" interval="{.}"/>
                            </xsl:for-each>
                           
                        </timeline>
                                               
                            <xsl:for-each-group select="$praat-parsed" group-starting-with="Tokens">
                            <!-- DEFINED VARIABLES FOR TIMEPOINTS IN TIMELINE -->
                             
                             <!-- make variant script or variable that can handle where there are 2 or more glosses -->
                            <xsl:variable name="whens" as="element()*">
                                
                                <xsl:for-each select="
                                    distinct-values(
                                    (current-group()[self::Mixtec|self::IPA|self::Spanish|self::English]/@start, current-group()[self::Spanish]/@end)
                                    )">
                                    <when xml:id="T{position()}" interval="{.}"/>
                                </xsl:for-each>
                            </xsl:variable>
                        
                            <annotationBlock>
                                <u n="{current-group()[1]}" xml:id="{generate-id(.)}" who="#{$speakerInit}"><!-- ID's ok-->
                                    <xsl:copy-of select="current-group()[1]/(@start, @end)"/>
                                    
                                    <!-- output content from "Orth" -->
                                    <seg xml:lang="mix" notation="orth" xml:id="{concat('T','-seg-orth-',@start)}" type="">
                                        <xsl:for-each select="current-group()/self::Mixtec">
                                            <xsl:variable name="start" select="@start"/>
                                            <w synch="{concat('#T',@start)}" xml:id="{concat('T','-orth',@start)}">
                                                <xsl:value-of select="."/>
                                            </w>
                                        </xsl:for-each>
                                    </seg>
                                    
                                    <!-- output content from "Pron" -->
                                    <seg xml:lang="mix" notation="ipa" xml:id="{concat('T','-seg-pron-',@start)}" sameAs="{concat('#','T','-seg-orth-',@start)}" type="">
                                        <xsl:for-each select="current-group()/self::IPA">
                                            <xsl:variable name="start" select="@start"/>
                                            <w synch="{concat('#T',@start)}" xml:id="{concat('T','-pron',@start)}" sameAs="{concat('#','T','-orth',@start)}">
                                                <xsl:value-of select="."/>
                                            </w>
                                        </xsl:for-each>
                                    </seg>
                                </u>

                            <spanGrp type="annotations">
                                
                                <!-- make condition that if only 1 ENGLISH, then adapt pointer -->
                                <xsl:for-each select="current-group()/self::English">
                                    <span type="translation" xml:lang="en" target="{concat('#','T','-seg-orth-',@start)}" ana="#">
                                        <xsl:value-of select="."/>
                                    </span>
                                </xsl:for-each>

                                <xsl:for-each select="current-group()/self::Spanish">            
                                    <span type="translation" xml:lang="es" target="{concat('#','T','-seg-orth-',@start)}" ana="#">
                                        <xsl:value-of select="."/>
                                    </span>
                                    <span type="gram" target="{concat('#','T','-seg-orth-',@start)}" ana="#"><!-- check output or remove -->
                                        <gloss type="igt"></gloss>
                                    </span>
                                </xsl:for-each>
                                
                                <xsl:for-each select="current-group()/self::Mixtec">
                                    <span type="translation" xml:lang="en" target="{concat('#','T','-orth',@start)}">
                                      
                                    </span>
                                    <span type="translation" xml:lang="es" target="{concat('#','T','-orth',@start)}">
                                 
                                    </span>
                                    <span type="gram" target="{concat('#','T','-orth',@start)}" ana="#">
                                        <gloss type="igt"></gloss>
                                    </span>
                                    <span type="semantics" target="{concat('#','T','-orth',@start)}" ana="#"/>
                                </xsl:for-each>
                            </spanGrp>
                            
                            </annotationBlock>
                        </xsl:for-each-group>
                        
                    </body>
                </text>
            </TEI>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>