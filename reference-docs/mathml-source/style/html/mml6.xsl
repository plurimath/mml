<?xml version="1.0"?>
<!--
$Id: mml6.xsl,v 1.54 2003/10/20 19:02:36 davidc Exp $

mml6.xsl David Carlisle
Generate bycodes.html, byalpha.html and the alphabetic glyph tables
for MathML chapter 6.
XSL sheet takes same parameters as mathmlspec.xsl
takes unicode.xml as input file.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"  
                extension-element-prefixes="saxon"
                version="1.0">

<xsl:param name="status">WD</xsl:param>
<xsl:param name="css.base.uri">http://www.w3.org/StyleSheets/TR/</xsl:param>
<xsl:param name="icon">http://www.w3.org/Icons/WWW</xsl:param>
<xsl:param name="glyphs">glyphs</xsl:param>
<xsl:param name="ext" select="'.html'"/>
<xsl:param name="diff" select="0"/>

<xsl:variable name="css-style">
<style type="text/css">
.unassigned { background-color: #FF5555 }
.error { color: red }
.bmp { color: green ; background-color: yellow }
th.cchart {font-size: 80%}
 .minitoc { border-style: solid;
             border-color: #0050B2; 
             border-width: 1px ; }
.ignore {background-color: #AAAAAA;}
.diff-chg  { background-color: lime }
  </style>
  <xsl:choose>
    <xsl:when test="$status='REC' or $status='rec'">
    <link rel="stylesheet" type="text/css" href="{$css.base.uri}W3C-REC.css"></link>
    </xsl:when>
    <xsl:when test="$status='PR' or $status='pr'">
    <link rel="stylesheet" type="text/css" href="{$css.base.uri}W3C-PR.css"></link>
    </xsl:when>
    <xsl:when test="$status='PER' or $status='per'">
    <link rel="stylesheet" type="text/css" href="{$css.base.uri}W3C-PER.css"></link>
    </xsl:when>
    <xsl:when test="$status='CR' or $status='cr'">
    <link rel="stylesheet" type="text/css" href="{$css.base.uri}W3C-CR.css"></link>
    </xsl:when>
    <xsl:otherwise>
    <link rel="stylesheet" type="text/css" href="{$css.base.uri}W3C-WD.css"></link>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xsl:output method="text"/>

<xsl:key name="set" match="entity" use="@set"/>
<xsl:key name="mathvariant" match="character[surrogate]" use="surrogate/@mathvariant"/>

<xsl:variable name="ranges">
  <range>000</range>
  <range>001</range>
  <range>002</range>
  <range>003</range>
  <range>004</range>
  <range>020</range>
  <range>021</range>
  <range>022</range>
  <range>023</range>
  <range>024</range>
  <range>025</range>
  <range>026</range>
  <range>027</range>
  <range>029</range>
  <range>02A</range>
  <range>030</range>
  <range>0FB</range>
  <range>0FE</range>
  <range>1D4</range>
  <range>1D5</range>
  <range>1D6</range>
  <range>1D7</range>
</xsl:variable>
<xsl:variable name="root" select="/"/>

<xsl:template match="charlist">

<xsl:for-each select="entitygroups/group[@name='mathml']/set">
  <xsl:call-template name="alphatable">
    <xsl:with-param name="set" select="@name"/>
  </xsl:call-template>
</xsl:for-each>

<xsl:for-each select="mathvariants/mathvariant">
  <xsl:call-template name="letter-like">
    <xsl:with-param name="mathvariant" select="@name"/>
    <xsl:with-param name="title" select="@description"/>
  </xsl:call-template>
</xsl:for-each>
<xsl:call-template name="code-chart">
  <xsl:with-param name="range" select="'000'"/>
</xsl:call-template>

<xsl:for-each select="document('')/*/xsl:variable[@name='ranges']/*">
  <xsl:call-template name="code-chart">
    <xsl:with-param name="range" select="string(.)"/>
  </xsl:call-template>
</xsl:for-each>

<xsl:call-template name="bycodes"/>
<xsl:call-template name="byalpha"/>

<xsl:call-template name="variants"/>
<xsl:call-template name="cancellations"/>

</xsl:template>





<xsl:template name="alphatable">
<xsl:param name="set"/>
<xsl:variable name="d">
<xsl:choose>
<xsl:when test="starts-with($set,'957')">iso9573-13</xsl:when>
<xsl:when test="starts-with($set,'88')">iso8879</xsl:when>
<xsl:when test="starts-with($set,'mml')">mathml</xsl:when>
<xsl:when test="starts-with($set,'htm')">html</xsl:when>
</xsl:choose>
</xsl:variable>
<xsl:variable name="f">
<xsl:choose>
<xsl:when test="starts-with($set,'957')"><xsl:value-of select="substring-after($set,'13-')"/></xsl:when>
<xsl:when test="starts-with($set,'88')"><xsl:value-of select="substring-after($set,'-')"/></xsl:when>
<xsl:when test="starts-with($set,'html')"><xsl:value-of select="substring-after($set,'-')"/></xsl:when>
<xsl:otherwise><xsl:value-of select="$set"/></xsl:otherwise>
</xsl:choose>
</xsl:variable>
<xsl:variable name="t">
<xsl:value-of select="translate($f,'abcdefghijklmnopqrstuvwxyz',
                           'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
Characters and Glyphs</xsl:variable>

<saxon:output method="html" 
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="{$f}{$ext}">
<html>
<head>
<title><xsl:value-of select="$t"/></title>
 <xsl:copy-of select="$css-style"/>
</head>
<body>
<h1><xsl:value-of select="$t"/></h1>
<xsl:variable name="minitoc">
<div class="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>
<xsl:for-each select="preceding-sibling::set[1]">

<xsl:variable name="pf">
<xsl:choose>
<xsl:when test="starts-with(@name,'957')"><xsl:value-of select="substring-after(@name,'13-')"/></xsl:when>
<xsl:when test="starts-with(@name,'88')"><xsl:value-of select="substring-after(@name,'-')"/></xsl:when>
<xsl:when test="starts-with(@name,'html')"><xsl:value-of select="substring-after(@name,'-')"/></xsl:when>
<xsl:otherwise><xsl:value-of select="@name"/></xsl:otherwise>
</xsl:choose>
</xsl:variable>

Previous: <a href="{$pf}{$ext}"><xsl:value-of
     select="translate($pf,'abcdefghijklmnopqrstuvwxyz',
                           'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/></a><br/>
</xsl:for-each>
<xsl:for-each select="following-sibling::set[1]">

<xsl:variable name="nf">
<xsl:choose>
<xsl:when test="starts-with(@name,'957')"><xsl:value-of select="substring-after(@name,'13-')"/></xsl:when>
<xsl:when test="starts-with(@name,'88')"><xsl:value-of select="substring-after(@name,'-')"/></xsl:when>
<xsl:when test="starts-with(@name,'html')"><xsl:value-of select="substring-after(@name,'-')"/></xsl:when>
<xsl:otherwise><xsl:value-of select="@name"/></xsl:otherwise>
</xsl:choose>
</xsl:variable>

Next: <a href="{$nf}{$ext}"><xsl:value-of
     select="translate($nf,'abcdefghijklmnopqrstuvwxyz',
                           'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/></a><br/>
</xsl:for-each>
Entity file: <a href="http://www.w3.org/Math/DTD/mathml2/{$d}/{$f}.ent"
>http://www.w3.org/Math/DTD/mathml2/<xsl:value-of select="$d"
/>/<xsl:value-of select="$f"/>.ent</a>
</div>
</xsl:variable>
<xsl:copy-of select="$minitoc"/>
<div>
<br/>
<table border="1">
<tr>
<th>Name</th>
<th>Unicode</th>
<th>Glyph</th>
<th>Unicode Name</th>
<th>Description</th>
<th>Aliases</th>
</tr>
<xsl:for-each select="key('set',$set)">
<xsl:sort select="@id"/>
<tr>
    <xsl:if test="../description/@unicode='provisional'">
      <xsl:attribute name="class">provisional</xsl:attribute>
      <xsl:message><xsl:value-of select="concat('Provisional: ',$set,': ',@id)"/></xsl:message>
    </xsl:if>
    <xsl:if test="@optional and @default='IGNORE'">
      <xsl:attribute name="class">ignore</xsl:attribute>
    </xsl:if>
<td>
<xsl:value-of select="@id"/>
</td>
<td>
<xsl:value-of select="substring-after(../@id,'U')"/>
</td>
<td>
<img height="32" 
         width="32"
         src="{$glyphs}/{substring(../@id,2,3)}/{translate(../@id,'x','')}.png"
         alt="{../@id}"
         >
<xsl:if test="../@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
</td>
<td>
<xsl:value-of select="../description"/>
</td>
<td>
<xsl:value-of select="desc"/>
<xsl:if test="not(desc)">&#160;</xsl:if>
</td>
<td>
<xsl:if test="not(../entity[@set='mmlalias'] or ../entity[@set=$set][2])">&#160;</xsl:if>
<xsl:for-each select="../entity[@set='mmlalias' or (@set=$set
     and @id!=current()/@id)]/@id">
<xsl:value-of select="."/>
<xsl:if test="position() &lt; last()">, </xsl:if>
</xsl:for-each>
</td>
</tr>
</xsl:for-each>
</table>
<br/>
</div>
<xsl:copy-of select="$minitoc"/>
</body>
</html>
</saxon:output>
</xsl:template>

<!-- -->

<xsl:template name="letter-like">
<xsl:param name="mathvariant"/>
<xsl:param name="title"/>


<saxon:output method="html" 
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="{$mathvariant}{$ext}">
<html>
<head>
<title>
  <xsl:value-of select="$title"/> 
</title>
  <xsl:copy-of select="$css-style"/>
</head>
<body>
<h1>
 <xsl:value-of select="$title"/>
</h1>

<xsl:variable name="minitoc">
<div class="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>

<xsl:for-each select="preceding-sibling::mathvariant[1]">
Previous: <a href="{@name}{$ext}"><xsl:value-of select="@description"/></a><br/>
</xsl:for-each>
<xsl:for-each select="following-sibling::mathvariant[1]">
Next: <a href="{@name}{$ext}"><xsl:value-of select="@description"/></a><br/>
</xsl:for-each>

</div>
</xsl:variable>
<xsl:copy-of select="$minitoc"/>

<div>
<br/>
<table border="1">
<tr>
<th>Unicode</th>
<th>BMP</th>
<th>Glyph</th>
<th>Unicode Name</th>
<th>MathML Names</th>
</tr>
<xsl:for-each select="key('mathvariant',$mathvariant)">
<xsl:sort select="@id"/>
<xsl:variable name="s" select="substring(surrogate/@ref,2)"/>
<tr>
<xsl:if test="bmp">
  <xsl:attribute name="class">bmp</xsl:attribute>
</xsl:if>
<xsl:for-each select="self::node()[not(bmp)]|id(bmp/@ref)">
<td>
<xsl:value-of select="substring(@id,2)"/>
</td>
<td>
<xsl:value-of select="$s"/>
</td>
<td>
<img height="32" 
         width="32"
         src="{$glyphs}/{substring(@id,2,3)}/{translate(@id,'x','')}.png"
         alt="{@id}"
         >
<xsl:if test="@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
</td>
<td>
<xsl:value-of select="description"/>
</td>
<td>
<xsl:variable name="x" select="entity[key('mmlsets',@set)]/@id"/>
<xsl:choose>
<xsl:when test="not($x)">&#160;</xsl:when>
<xsl:otherwise>
<xsl:for-each select="$x">
<xsl:value-of select="."/>
<xsl:if test="position() &lt; last()">, </xsl:if>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</td>
</xsl:for-each>
</tr>
</xsl:for-each>
</table>
<br/>
</div>
<xsl:copy-of select="$minitoc"/>
</body>
</html>
</saxon:output>
</xsl:template>

<xsl:key name="mmlsets"
match="/charlist/entitygroups/group[@name='mathml']/set" use="@name"/>
<!-- -->

<xsl:template name="code-chart">
 <xsl:param name="range"/>
<saxon:output method="html" 
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="{$range}{$ext}">
<html>
<head>
<title>Unicode Characters:
<xsl:value-of select="concat($range,'00 to ',$range,'FF')"/>
</title>
 <xsl:copy-of select="$css-style"/>
</head>
<body>
<h1>Unicode Characters:
<xsl:value-of select="concat($range,'00 to ',$range,'FF')"/>
</h1>

<xsl:variable name="minitoc">
<div class="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>
<xsl:for-each select="preceding-sibling::*[1]">
Previous: <a href="{.}{$ext}"><xsl:value-of select="."/>00 to <xsl:value-of select="."/>FF</a><br/>
</xsl:for-each>
<xsl:for-each select="following-sibling::*[1]">
Next: <a href="{.}{$ext}"><xsl:value-of select="."/>00 to <xsl:value-of select="."/>FF</a><br/>
</xsl:for-each>
</div>
</xsl:variable>
<xsl:copy-of select="$minitoc"/>
<div>
<br/>
<xsl:for-each select="$root">
<table border="1">
<tr>
<th class="cchart">&#160;</th>
<th class="cchart"><xsl:value-of select="$range"/>0</th>
<th class="cchart"><xsl:value-of select="$range"/>1</th>
<th class="cchart"><xsl:value-of select="$range"/>2</th>
<th class="cchart"><xsl:value-of select="$range"/>3</th>
<th class="cchart"><xsl:value-of select="$range"/>4</th>
<th class="cchart"><xsl:value-of select="$range"/>5</th>
<th class="cchart"><xsl:value-of select="$range"/>6</th>
<th class="cchart"><xsl:value-of select="$range"/>7</th>
<th class="cchart"><xsl:value-of select="$range"/>8</th>
<th class="cchart"><xsl:value-of select="$range"/>9</th>
<th class="cchart"><xsl:value-of select="$range"/>A</th>
<th class="cchart"><xsl:value-of select="$range"/>B</th>
<th class="cchart"><xsl:value-of select="$range"/>C</th>
<th class="cchart"><xsl:value-of select="$range"/>D</th>
<th class="cchart"><xsl:value-of select="$range"/>E</th>
<th class="cchart"><xsl:value-of select="$range"/>F</th>
</tr>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'0'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'1'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'2'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'3'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'4'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'5'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'6'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'7'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'8'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'9'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'A'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'B'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'C'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'D'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'E'"/>
</xsl:call-template>
<xsl:call-template name="table-row">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="row" select="'F'"/>
</xsl:call-template>
<tr>
<th class="cchart">&#160;</th>
<th class="cchart"><xsl:value-of select="$range"/>0</th>
<th class="cchart"><xsl:value-of select="$range"/>1</th>
<th class="cchart"><xsl:value-of select="$range"/>2</th>
<th class="cchart"><xsl:value-of select="$range"/>3</th>
<th class="cchart"><xsl:value-of select="$range"/>4</th>
<th class="cchart"><xsl:value-of select="$range"/>5</th>
<th class="cchart"><xsl:value-of select="$range"/>6</th>
<th class="cchart"><xsl:value-of select="$range"/>7</th>
<th class="cchart"><xsl:value-of select="$range"/>8</th>
<th class="cchart"><xsl:value-of select="$range"/>9</th>
<th class="cchart"><xsl:value-of select="$range"/>A</th>
<th class="cchart"><xsl:value-of select="$range"/>B</th>
<th class="cchart"><xsl:value-of select="$range"/>C</th>
<th class="cchart"><xsl:value-of select="$range"/>D</th>
<th class="cchart"><xsl:value-of select="$range"/>E</th>
<th class="cchart"><xsl:value-of select="$range"/>F</th>
</tr>
</table>

</xsl:for-each>
<p>
Key:
</p>

<table border="1">
<tr><th>Cell Style</th><th>Status</th></tr>
<tr><td>&#160;&#160;&#160;</td><td>Unicode Character (Unicode 4.0)</td></tr>
<tr><td class="unassigned">&#160;</td><td>Unicode or XML Non-Character</td></tr><tr><td><img src="{$glyphs}/none.png" alt="none"/></td><td>Character for which an image is not currently available</td></tr>
</table>
<br/>
</div>
<xsl:copy-of select="$minitoc"/>
</body>
</html>
</saxon:output>
</xsl:template>

<xsl:template name="table-row">
<xsl:param name="range"/>
<xsl:param name="row"/>
<tr>
<th class="cchart"><xsl:value-of select="$row"/></th>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('0',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('1',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('2',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('3',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('4',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('5',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('6',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('7',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('8',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('9',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('A',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('B',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('C',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('D',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('E',$row)"/>
</xsl:call-template>
<xsl:call-template name="table-cell">
 <xsl:with-param name="range" select="$range"/>
 <xsl:with-param name="h" select="concat('F',$row)"/>
</xsl:call-template>
<th class="cchart"><xsl:value-of select="$row"/></th>
</tr>
</xsl:template>


<xsl:template name="table-cell">
<xsl:param name="range"/>
<xsl:param name="h"/>
<td style="width:40px; vertical-align:middle">
<xsl:variable name="x" select="id(concat('U',$range,$h))"/>
<xsl:choose>
<xsl:when test="$x and not($x/bmp) and not($x/description/@unicode='unassigned')">
  <xsl:attribute name="title">
    <xsl:value-of select="$x/description"/>
  </xsl:attribute>
  <xsl:choose>
  <xsl:when test="$x/entity[
      @set='9573-13-isoamsa'
   or @set='9573-13-isoamsb'
   or @set='9573-13-isoamsc'
   or @set='9573-13-isoamsn'
   or @set='9573-13-isoamso'
   or @set='9573-13-isoamsr'
   or @set='9573-13-isogrk3'
   or @set='9573-13-isomfrk'
   or @set='9573-13-isomopf'
   or @set='9573-13-isomscr'
   or @set='9573-13-isotech'
   or @set='8879-isobox'
   or @set='8879-isocyr1'
   or @set='8879-isocyr2'
   or @set='8879-isodia'
   or @set='8879-isolat1'
   or @set='8879-isolat2'
   or @set='8879-isonum'
   or @set='8879-isopub'
   or @set='Xmmlalias'
   or @set='mmlextra']">
    <xsl:if test="$x/description/@unicode='provisional'">
      <xsl:attribute name="class">provisional</xsl:attribute>
    </xsl:if>
  </xsl:when>
  <xsl:otherwise><!-- not named -->
    <xsl:choose>
      <xsl:when test="$x/description/@unicode='provisional'">
        <xsl:attribute name="class">unnamed-provisional</xsl:attribute>
      </xsl:when>
      <xsl:when test="$x/@dec &lt;32 and $x/@dec != 9 and $x/@dec != 10 and $x/@dec != 13">
        <xsl:attribute name="class">unassigned</xsl:attribute>
      </xsl:when>
      <xsl:when test="$x/description/@unicode='unasigned'">
        <xsl:attribute name="class">unassigned</xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="class">unnamed-mathml</xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
  <xsl:when test="($x/surrogate and not($x/bmp)) or $x/entity[
      @set='9573-13-isoamsa'
   or @set='9573-13-isoamsb'
   or @set='9573-13-isoamsc'
   or @set='9573-13-isoamsn'
   or @set='9573-13-isoamso'
   or @set='9573-13-isoamsr'
   or @set='9573-13-isogrk3'
   or @set='9573-13-isomfrk'
   or @set='9573-13-isomopf'
   or @set='9573-13-isomscr'
   or @set='9573-13-isotech'
   or @set='8879-isobox'
   or @set='8879-isocyr1'
   or @set='8879-isocyr2'
   or @set='8879-isodia'
   or @set='8879-isolat1'
   or @set='8879-isolat2'
   or @set='8879-isonum'
   or @set='8879-isopub'
   or @set='Xmmlalias'
   or @set='mmlextra']">
  <a href="bycodes{$ext}#{$x/@id}">
  <img height="32" width="32" src="{$glyphs}/{$range}/U{$range}{$h}.png"
    alt="{$x/description}">
<xsl:if test="$x/@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
  </a>
  </xsl:when>
  <xsl:otherwise>
  <img height="32" width="32" src="{$glyphs}/{$range}/U{$range}{$h}.png"
    alt="{$x/description}">
<xsl:if test="$x/@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
  </xsl:otherwise>
  </xsl:choose>
</xsl:when>
<xsl:when test="$x/bmp or $x/description/@unicode='unassigned'">
  <xsl:attribute name="class">unassigned</xsl:attribute>
   <xsl:text>&#160;</xsl:text>
</xsl:when>
<xsl:when test="$range='000' and (starts-with($h,'0') or starts-with($h,'1'))">
  <xsl:attribute name="class">unassigned</xsl:attribute>
   <xsl:text>&#160;</xsl:text>
</xsl:when>
<xsl:otherwise>
  <xsl:attribute name="class">undescribed</xsl:attribute>
   <xsl:text>&#160;</xsl:text>
</xsl:otherwise>
</xsl:choose>
</td>
</xsl:template>


<!-- -->
<xsl:template name="bycodes">
<saxon:output method="html" 
     indent="no"
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="bycodes{$ext}">
<html>
<head>
<title>
  Characters Ordered by Unicode
</title>
<xsl:text>&#10;</xsl:text>
 <xsl:copy-of select="$css-style"/>
<xsl:text>&#10;</xsl:text>
</head>
<xsl:text>&#10;</xsl:text>
<body>
<h1>Characters Ordered by Unicode</h1>
<xsl:text>&#10;</xsl:text>

<xsl:variable name="minitoc">
<div class="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>
Next: <a href="byalpha{$ext}">Named MathML Characters, ordered by Name</a><br/>
</div>
</xsl:variable>
<xsl:copy-of select="$minitoc"/>
<div>
<br/>

<pre>
<xsl:text>&#10;</xsl:text>
<xsl:for-each select="character[entity[
    @set='9573-13-isoamsa'
 or @set='9573-13-isoamsb'
 or @set='9573-13-isoamsc'
 or @set='9573-13-isoamsn'
 or @set='9573-13-isoamso'
 or @set='9573-13-isoamsr'
 or @set='9573-13-isogrk3'
 or @set='9573-13-isomfrk'
 or @set='9573-13-isomopf'
 or @set='9573-13-isomscr'
 or @set='9573-13-isotech'
 or @set='8879-isobox'
 or @set='8879-isocyr1'
 or @set='8879-isocyr2'
 or @set='8879-isodia'
 or @set='8879-isolat1'
 or @set='8879-isolat2'
 or @set='8879-isonum'
 or @set='8879-isopub'
 or @set='mmlextra']
or (surrogate and not(description/@unicode='unassigned'))]">
<xsl:sort select="@id"/>
<a name="{@id}"/>
<xsl:choose>
<xsl:when test="@image='none'"><xsl:value-of select="@id"/></xsl:when>
<xsl:otherwise>
<a href="{$glyphs}/{substring(@id,2,3)}/{translate(@id,'x','')}.png">
<xsl:value-of select="@id"/>
</a>
</xsl:otherwise>
</xsl:choose>
<xsl:text>, </xsl:text>
<xsl:value-of select="description"/>
<xsl:value-of select="substring(
'                                            ',
string-length(description)+string-length(@id))"/>
<xsl:text>, </xsl:text>
<xsl:for-each select="entity[
    @set='9573-13-isoamsa'
 or @set='9573-13-isoamsb'
 or @set='9573-13-isoamsc'
 or @set='9573-13-isoamsn'
 or @set='9573-13-isoamso'
 or @set='9573-13-isoamsr'
 or @set='9573-13-isogrk3'
 or @set='9573-13-isomfrk'
 or @set='9573-13-isomopf'
 or @set='9573-13-isomscr'
 or @set='9573-13-isotech'
 or @set='8879-isobox'
 or @set='8879-isocyr1'
 or @set='8879-isocyr2'
 or @set='8879-isodia'
 or @set='8879-isolat1'
 or @set='8879-isolat2'
 or @set='8879-isonum'
 or @set='8879-isopub'
 or @set='mmlextra'
 or @set='mmlalias']/@id">
<xsl:value-of select="."/>
<xsl:if test="position() &lt; last()">, </xsl:if>
</xsl:for-each>
<xsl:text>&#10;</xsl:text>
</xsl:for-each>
</pre>
<br/>
</div>
<xsl:copy-of select="$minitoc"/>
</body>
</html>
</saxon:output>
</xsl:template>

<xsl:template name="byalpha">
<saxon:output method="html" 
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="byalpha{$ext}">
<html>
<head>
<title>
  Characters Ordered by MathML Name
</title>

 <xsl:copy-of select="$css-style"/>
</head>
<body>
<h1>
  Characters Ordered by MathML Names
</h1>

<xsl:variable name="minitoc">
<div class="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>
Previous: <a href="bycodes{$ext}">All, by codes</a><br/>
</div>
</xsl:variable>
<xsl:copy-of select="$minitoc"/>
<div>
<br/>

<pre>
<xsl:for-each select="character/entity[
    @set='9573-13-isoamsa'
 or @set='9573-13-isoamsb'
 or @set='9573-13-isoamsc'
 or @set='9573-13-isoamsn'
 or @set='9573-13-isoamso'
 or @set='9573-13-isoamsr'
 or @set='9573-13-isogrk3'
 or @set='9573-13-isomfrk'
 or @set='9573-13-isomopf'
 or @set='9573-13-isomscr'
 or @set='9573-13-isotech'
 or @set='8879-isobox'
 or @set='8879-isocyr1'
 or @set='8879-isocyr2'
 or @set='8879-isodia'
 or @set='8879-isolat1'
 or @set='8879-isolat2'
 or @set='8879-isonum'
 or @set='8879-isopub'
 or @set='mmlextra'
 or @set='mmlalias']">
<xsl:sort select="@id"/>
<xsl:variable name="l">
<xsl:value-of select="@id"/>
<xsl:text>, </xsl:text>
<xsl:value-of select="substring(
'                        ',
string-length(@id))"/>
<xsl:value-of select="../@id"/>
<xsl:text>, </xsl:text>
<xsl:value-of select="normalize-space(.)"/>
<xsl:text>, [</xsl:text>
<xsl:value-of select="normalize-space(../description)"/>
<xsl:text>]</xsl:text>
</xsl:variable>
<xsl:variable name="ent" select="."/>
<xsl:variable name="u" select="../@id"/>
<xsl:choose>
<xsl:when test="$diff=1">
<xsl:for-each select="document('../../xml/unicode.xml')">
<span>
<xsl:if test="not(id($u)/entity[@id=$ent/@id and @set=$ent/@set])">
<!--
<xsl:message>
1:<xsl:value-of select="@id"/>,<xsl:value-of select="$ent/@id"/>,<xsl:value-of select="$ent/@set"/>
2:<xsl:value-of select="entity[@id=$u]/@set"/>
</xsl:message>
-->
<xsl:attribute name="class">diff-chg</xsl:attribute>
  </xsl:if>
  <xsl:value-of select="$l"/>
 </span>
</xsl:for-each>
</xsl:when>
<xsl:otherwise>
  <xsl:value-of select="$l"/>
</xsl:otherwise>
</xsl:choose>
<xsl:text>
</xsl:text>
</xsl:for-each>
</pre>
<br/>
</div>
<xsl:copy-of select="$minitoc"/>
</body>
</html>
</saxon:output>
</xsl:template>

<xsl:template name="variants">
<saxon:output method="html" 
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="variants{$ext}">
<html>
<head>
<title>Unicode Characters: Variants</title>
 <xsl:copy-of select="$css-style"/>
</head>
<body>
<h1>Unicode Characters: Variants</h1>

<xsl:variable name="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>
Previous: <a href="cancellations{$ext}">Unicode Characters: Cancellations</a>
<br/>
</xsl:variable>
<div class="minitoc">
<xsl:copy-of select="$minitoc"/>
<xsl:for-each select="id('U0FE00')">
<br/>
<a href="#canc.{@id}"><xsl:value-of select="description"/></a>
</xsl:for-each>
</div>
<div>
<br/>
<xsl:for-each select="id('U0FE00')">
 <xsl:call-template name="compose-table"/>
</xsl:for-each>
<br/>
</div>
<div class="minitoc">
<xsl:copy-of select="$minitoc"/>
</div>
</body>
</html>
</saxon:output>
</xsl:template>



<xsl:template name="cancellations">
<saxon:output method="html" 
     doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"
     doctype-system="http://www.w3.org/TR/html4/loose.dtd"
     href="cancellations{$ext}">
<html>
<head>
<title>Unicode Characters: Cancellations</title>
 <xsl:copy-of select="$css-style"/>
</head>
<body>
<h1>Unicode Characters: Cancellations</h1>

<xsl:variable name="minitoc">
Overview: <a href="overview{$ext}">Mathematical Markup Language (MathML) Version 2.0 (2nd Edition)</a><br/>
Up: 6 <a href="chapter6{$ext}">Characters, Entities and Fonts</a><br/>
Next: <a href="variants{$ext}">Unicode Characters: Variants</a><br/>
</xsl:variable>

<div class="minitoc">
<xsl:copy-of select="$minitoc"/>
<xsl:for-each select="id('U00338 U020D2 U020E5')"><!-- 307 -->
<br/>
<a href="#canc.{@id}"><xsl:value-of select="description"/></a>
</xsl:for-each>
</div>
<div>
<br/>

<xsl:for-each select="id('U00338 U020D2 U020E5')"><!-- 307 -->
<xsl:call-template name="compose-table"/>
</xsl:for-each>

<br/>
</div>
<div class="minitoc">
<xsl:copy-of select="$minitoc"/>
</div>
</body>
</html>
</saxon:output>
</xsl:template>

<xsl:template name="compose-table">
<xsl:param name="char" select="translate(@id,'U','-')"/>
<xsl:variable name="c" select="."/>
<h2><a name="canc.{$c/@id}" id="canc.{$c/@id}"/><xsl:value-of select="$c/description"/></h2>
<table border="1">
<tr>
<th>&#160;</th>
<th>Unicode</th>
<th>Glyph</th>
<th>Unicode Name</th>
<th>MathML Names</th>
</tr>
<tr>
<td>&#160;</td>
<td>
<xsl:value-of select="substring($c/@id,2)"/>
</td>
<td>
<img height="32" 
         width="32"
         src="{$glyphs}/{substring($c/@id,2,3)}/{$c/@id}.png"
         alt="{$c/@id}"
         >
<xsl:if test="$c/@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
</td>
<td>
<xsl:value-of select="$c/description"/>
</td>
<td>&#160;</td>
</tr>

<xsl:variable name="cz" select="concat($char,'z')"/>
<xsl:for-each select="/charlist/character[contains(concat(@id,'z'),$cz)]">
<xsl:sort select="@id"/>
<xsl:variable name="id" select="@id"/>
<xsl:variable name="base" select="id(concat(substring-before($id,$char),substring-after($id,$char)))"/>
<tr>
<xsl:if test="not($base) or ($base/description/@unicode and
not($base/description/@unicode='3.1' or
$base/description/@unicode='3.2'))">
<xsl:attribute name="class">provisional</xsl:attribute>
<xsl:message><xsl:value-of select="@id"/></xsl:message>
</xsl:if>
<th>Base</th>
<td>
<xsl:value-of select="substring($base/@id,2)"/>
</td>
<td>
<img height="32" 
         width="32"
         src="{$glyphs}/{substring($base/@id,2,3)}/{translate($base/@id,'x','')}.png"
         alt="{$base/@id}"
         >
<xsl:if test="$base/@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
</td>
<td>
<xsl:value-of select="$base/description"/>
</td>
<td>
<xsl:variable name="x" select="$base/entity[
    @set='9573-13-isoamsa'
 or @set='9573-13-isoamsb'
 or @set='9573-13-isoamsc'
 or @set='9573-13-isoamsn'
 or @set='9573-13-isoamso'
 or @set='9573-13-isoamsr'
 or @set='9573-13-isogrk3'
 or @set='9573-13-isomfrk'
 or @set='9573-13-isomopf'
 or @set='9573-13-isomscr'
 or @set='9573-13-isotech'
 or @set='8879-isobox'
 or @set='8879-isocyr1'
 or @set='8879-isocyr2'
 or @set='8879-isodia'
 or @set='8879-isolat1'
 or @set='8879-isolat2'
 or @set='8879-isonum'
 or @set='8879-isopub'
 or @set='Xmmlalias'
 or @set='mmlextra']/@id"/>
<xsl:choose>
<xsl:when test="not($x)">&#160;</xsl:when>
<xsl:otherwise>
<xsl:for-each select="$x">
<xsl:value-of select="."/>
<xsl:if test="position() &lt; last()">, </xsl:if>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</td>
</tr>
<tr>
<xsl:if test="not(description/@unicode='combination' or description/@unicode='3.2')">
<xsl:attribute name="class">provisional</xsl:attribute>
<xsl:message><xsl:value-of select="@id"/></xsl:message>
</xsl:if>
<th>Variant</th>
<td>
<xsl:value-of select="substring($id,2)"/>
</td>
<td>
<img height="32" 
         width="32"
         src="{$glyphs}/{substring($id,2,3)}/{translate($id,'x','')}.png"
         alt="{$id}"
         >
<xsl:if test="@image='none'"><xsl:attribute
  name="src"><xsl:value-of select="$glyphs"/>/none.png</xsl:attribute></xsl:if>
</img>
</td>
<td>
<xsl:value-of select="description"/>
</td>
<td>
<xsl:variable name="x" select="entity[
    @set='9573-13-isoamsa'
 or @set='9573-13-isoamsb'
 or @set='9573-13-isoamsc'
 or @set='9573-13-isoamsn'
 or @set='9573-13-isoamso'
 or @set='9573-13-isoamsr'
 or @set='9573-13-isogrk3'
 or @set='9573-13-isomfrk'
 or @set='9573-13-isomopf'
 or @set='9573-13-isomscr'
 or @set='9573-13-isotech'
 or @set='8879-isobox'
 or @set='8879-isocyr1'
 or @set='8879-isocyr2'
 or @set='8879-isodia'
 or @set='8879-isolat1'
 or @set='8879-isolat2'
 or @set='8879-isonum'
 or @set='8879-isopub'
 or @set='Xmmlalias'
 or @set='mmlextra']/@id"/>
<xsl:choose>
<xsl:when test="not($x)">&#160;</xsl:when><xsl:when test="not($x)">&#160;</xsl:when>
<xsl:otherwise>
<xsl:for-each select="$x">
<xsl:value-of select="."/>
<xsl:if test="position() &lt; last()">, </xsl:if>
</xsl:for-each>
</xsl:otherwise>
</xsl:choose>
</td>
</tr>
</xsl:for-each>
</table>
</xsl:template>


</xsl:stylesheet>
