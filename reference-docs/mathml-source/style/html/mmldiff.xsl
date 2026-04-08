<?xml version="1.0"?>

<!-- Version: $Id: mmldiff.xsl,v 1.29 2003/10/07 10:36:01 davidc Exp $ -->


<!-- This stylesheet is copyright (c) 2000 by its authors.  Free
     distribution and modification is permitted, including adding to
     the list of authors and copyright holders, as long as this
     copyright notice is maintained. -->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version="1.0">

<xsl:import href="mmlspec.xsl"/>

<xsl:param name="show.diff.markup">1</xsl:param>

<xsl:param name="filename.extension">
  <xsl:if test="$show.diff.markup=1">-d</xsl:if>
  <xsl:text>.html</xsl:text>
</xsl:param>

<xsl:param name="additional.css">
  .error { color: red }
  .minitoc { border-style: solid;
             border-color: #0050B2; 
             border-width: 1px ;
             padding: 0.3em;}
  .attention { border-style: solid; 
               border-width: 1px ; 
               color: #5D0091;
               background: #F9F5DE; 
               border-color: red;
               margin-left: 1em;
               margin-right: 1em;
               margin-top: 0.25em;
               margin-bottom: 0.25em; }

  .attribute-Name { background: #F9F5C0; }
  .method-Name { background: #C0C0F9; }
  .IDL-definition { border-style: solid; 
               border-width: 1px ; 
               color: #001000;
               background: #E0FFE0; 
               border-color: #206020;
               margin-left: 1em;
               margin-right: 1em;
               margin-top: 0.25em;
               margin-bottom: 0.25em; }
  .baseline {vertical-align: baseline}

  #eqnoc1 {width: 10%}
  #eqnoc2 {width: 80%; text-align: center; }
  #eqnoc3 {width: 10%; text-align: right; }

div.div1 {margin-bottom: 1em;}
          
.h3style {
  text-align: left;
  font-family: sans-serif;
  font-weight: normal;
  color: #0050B2; 
  font-size: 125%;
}

  h4 { text-align: left;
       font-family: sans-serif;
       font-weight: normal;
       color: #0050B2; }
  h5 { text-align: left;
       font-family: sans-serif;
       font-weight: bold;
       color: #0050B2; } 

  th {background:  #E0FFE0;}

  p, blockquote, h4 { font-family: sans-serif; }
  dt, dd, dl, ul, li { font-family: sans-serif; }
  pre, code { font-family: monospace }


<xsl:if test="$show.diff.markup = '1'">
sub.diff-link {background-color: black; color: white; font-family:
sans-serif; font-weight: bold;}

.diff-add  { background-color: #FFFF99}
.diff-del  { background-color: #FF9999; text-decoration: line-through }
.diff-chg  { background-color: #99FF99 }
.diff-off  {  }
</xsl:if>

.mathml-render {
font-family: serif;
font-size: 130%;
border: solid 4px green;
padding-left: 1em;
padding-right: 1em;
}
</xsl:param>

<xsl:param name="additional.title">
  <xsl:if test="$show.diff.markup != '0'">
    <xsl:text>Diff Marked Version</xsl:text>
  </xsl:if>
</xsl:param>

<xsl:param name="additional.format.note">
        <xsl:if test="$show.diff.markup != 0">
          <div>
            <p>The presentation of this document has been augmented to
            identify changes since the first edition of the MathML 2.0 Recommendation.
            Three kinds of changes
            are highlighted: <span class="diff-add">new, added text</span>,
            <span class="diff-chg">changed text</span>, and
            <span class="diff-del">deleted text</span>.</p>
            <hr/>
          </div>
        </xsl:if>
</xsl:param>

<xsl:param name="called.by.diffspec">1</xsl:param>

<!-- ==================================================================== -->

  <!-- spec: the specification itself -->
  <xsl:template match="spec">
  <xsl:call-template name="write.chunk">
    <xsl:with-param name="filename">
      <xsl:apply-templates select="." mode="slice-filename"/>
    </xsl:with-param>
    <xsl:with-param name="content">
    <html>
      <xsl:if test="header/langusage/language/@id">
        <xsl:attribute name="lang">
          <xsl:value-of select="header/langusage/language/@id"/>
        </xsl:attribute>
      </xsl:if>
      <head>
        <title>
          <xsl:apply-templates select="header/title"/>
          <xsl:if test="header/version">
            <xsl:text> </xsl:text>
            <xsl:apply-templates select="header/version"/>
          </xsl:if>
          <xsl:if test="$additional.title != ''">
            <xsl:text> -- </xsl:text>
            <xsl:value-of select="$additional.title"/>
	  </xsl:if>
        </title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <xsl:copy-of select="$additional.format.note"/>
        <xsl:apply-templates/>
        <xsl:if test="//footnote[not(ancestor::table)]">
          <hr/>
          <div class="endnotes">
            <xsl:text>&#10;</xsl:text>
            <h3>
              <xsl:call-template name="anchor">
                <xsl:with-param name="conditional" select="0"/>
                <xsl:with-param name="default.id" select="'endnotes'"/>
              </xsl:call-template>
              <xsl:text>End Notes</xsl:text>
            </h3>
            <dl>
              <xsl:apply-templates select="//footnote[not(ancestor::table)]"
                                   mode="notes"/>
            </dl>
          </div>
        </xsl:if>
      </body>
    </html>
    </xsl:with-param>
  </xsl:call-template>
  </xsl:template>

<!-- ==================================================================== -->

<xsl:template name="diff-markup">
  <xsl:param name="diff">off</xsl:param>
  <xsl:choose>
    <xsl:when test="(ancestor::scrap and not(parent::head)) or self::tr or self::td or self::param">
      <!-- forget it, we can't add stuff inside tables -->
      <!-- handled in base stylesheet -->
      <xsl:apply-imports/>
    </xsl:when>
    <xsl:when test="self::item or self::gitem or self::bibl or self::MMLexample or
  self::property or self::attribute or self::exception or self::author">
      <!-- forget it, we can't add stuff inside dls; handled below -->
      <xsl:apply-imports/>
    </xsl:when>
    <xsl:when test="self::eg or self::graphic[not(@role='inline')]">
      <div class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </div>
    </xsl:when>
    <xsl:when test="ancestor-or-self::phrase">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor::p and not(self::p)">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor-or-self::affiliation or self::attribute">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor-or-self::name">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </span>
    </xsl:when>
    <xsl:when test="ancestor-or-self::loc">
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </span>
    </xsl:when>
    <xsl:otherwise>
      <div class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link"/>
      </div>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[@diff='chg']">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">chg</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[@diff='add']">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">add</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[@diff='del']">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">del</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <!-- suppress deleted markup -->
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>





<!--  -->

<xsl:template name="diff-markup-mmldom">
  <xsl:param name="diff">off</xsl:param>
  <xsl:param name="nosub" select="false()"/>
  <xsl:choose>
    <xsl:when test="self::attribute">
	<xsl:apply-imports/>
    </xsl:when>
    <xsl:when test="self::div1|self::interface">
      <div class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link">
         <xsl:with-param name="nosub" select="$nosub"/>
        </xsl:call-template>
      </div>
    </xsl:when>
    <xsl:otherwise>
      <span class="diff-{$diff}">
	<xsl:apply-imports/>
        <xsl:call-template name="diff-back-link">
         <xsl:with-param name="nosub" select="$nosub"/>
        </xsl:call-template>
      </span>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="*[@diff]" mode="javaInterfaces">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup-mmldom">
	<xsl:with-param name="diff" select="string(@diff)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@diff='del'"/>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--  -->


<xsl:template match="*[@diff]" mode="IDLInterfaces">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1' and self::interface">
     <span class="diff-{@diff}">
       <xsl:apply-imports/>
        <xsl:call-template name="diff-back-link">
         <xsl:with-param name="nosub" select="true()"/>
        </xsl:call-template>
     </span>
    </xsl:when>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup-mmldom">
	<xsl:with-param name="diff" select="string(@diff)"/>
         <xsl:with-param name="nosub" select="true()"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@diff='del'"/>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--  -->

<xsl:template match="*[@diff]" mode="ecmaInterfaces">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup-mmldom">
	<xsl:with-param name="diff" select="string(@diff)"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@diff='del'"/>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!--  -->



<xsl:template match="*[@diff='off']">
  <xsl:choose>
    <xsl:when test="$show.diff.markup='1'">
      <xsl:call-template name="diff-markup">
	<xsl:with-param name="diff">off</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-imports/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- ================================================================= -->

  <xsl:template match="bibl[@diff]" priority="1">
    <xsl:variable name="dt">
      <xsl:if test="@id">
	<a name="{@id}"/>
      </xsl:if>
      <xsl:choose>
	<xsl:when test="@key">
	  <xsl:value-of select="@key"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:value-of select="@id"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="dd">
      <xsl:apply-templates/>
      <xsl:if test="@href">
        <xsl:text>  (See </xsl:text>
        <a href="{@href}">
          <xsl:value-of select="@href"/>
        </a>
        <xsl:text>.)</xsl:text>
      </xsl:if>
    </xsl:variable>
<xsl:if test="$show.diff.markup = '1' and @diff and not(key('changes',@id))">
<xsl:message>No Change Log: <xsl:value-of select="@id"/></xsl:message>
</xsl:if>
    <xsl:choose>
      <xsl:when test="@diff and $show.diff.markup = '1'">
	<dt class="label">
	  <span class="diff-{@diff}">
	    <xsl:copy-of select="$dt"/>
	  </span>
	</dt>
	<dd>
	  <div class="diff-{@diff}">
	    <xsl:copy-of select="$dd"/>
	  </div>
	</dd>
      </xsl:when>
      <xsl:when test="@diff='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dt class="label">
	  <xsl:copy-of select="$dt"/>
	</dt>
	<dd>
	  <xsl:copy-of select="$dd"/>
	</dd>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gitem/label">
    <xsl:variable name="diffval" select="ancestor-or-self::*/@diff"/>
    <xsl:choose>
      <xsl:when test="$diffval != '' and $show.diff.markup='1'">
	<dt class="label">
      <xsl:call-template name="anchor">
        <xsl:with-param name="node" select="."/>
      </xsl:call-template>
	  <span class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:apply-templates/>
	  </span>
	</dt>
      </xsl:when>
      <xsl:when test="$diffval='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dt class="label">
      <xsl:call-template name="anchor">
        <xsl:with-param name="node" select="."/>
      </xsl:call-template>
	  <xsl:apply-templates/>
	</dt>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="gitem/def">
    <xsl:variable name="diffval" select="ancestor-or-self::*/@diff"/>
    <xsl:choose>
      <xsl:when test="$diffval != '' and $show.diff.markup='1'">
	<dd>
	  <div class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:apply-templates/>
            <xsl:for-each select="../label[1]"><xsl:call-template name="diff-back-link"/></xsl:for-each>
	  </div>
	</dd>
      </xsl:when>
      <xsl:when test="$diffval='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dd>
	  <xsl:apply-templates/>
	</dd>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- authlist: list of authors (editors, really) -->
  <!-- called in enforced order from header's template, in <dl>
       context -->
  <xsl:template match="authlist[@diff]">
    <xsl:choose>
      <xsl:when test="$show.diff.markup='1'">
	<dt>
	  <span class="diff-{ancestor-or-self::*/@diff}">
	    <xsl:text>Editor</xsl:text>
	    <xsl:if test="count(author) > 1">
	      <xsl:text>s</xsl:text>
	    </xsl:if>
	    <xsl:text>:</xsl:text>
	  </span>
	</dt>
      </xsl:when>
      <xsl:when test="@diff='del' and $show.diff.markup='0'">
	<!-- suppressed -->
      </xsl:when>
      <xsl:otherwise>
	<dt>
	  <xsl:text>Editor</xsl:text>
	  <xsl:if test="count(author) > 1">
	    <xsl:text>s</xsl:text>
	  </xsl:if>
	  <xsl:text>:</xsl:text>
	</dt>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates/>
  </xsl:template>

<xsl:key name="changes" match="id('changes_mathml2.0-2.02e')/ulist/item/ulist/item[.//specref]"
use=".//specref/@ref"/>
<xsl:key name="changes" match="id('changes_mathml2.0-2.02e')/ulist/item/ulist/item[.//intref]"
use=".//intref/@ref"/>
<xsl:key name="changes" match="id('changes_mathml2.0-2.02e')/ulist/item/ulist/item[.//bibref]"
use=".//bibref/@ref"/>

<xsl:template name="diff-back-link">
<xsl:param name="nosub" select="false()"/>
<xsl:variable name="id" select="ancestor-or-self::*[not(self::table)][@id][1]/@id"/>
<xsl:choose>
<xsl:when test="key('changes',$id)">
    <a>
      <xsl:attribute name="href">
        <xsl:call-template name="href.target">
          <xsl:with-param name="target" select="key('changes', $id)"/>
        </xsl:call-template>
      </xsl:attribute>
      <xsl:choose>
      <xsl:when test="ancestor::eg or ancestor::MMLexample or
      ancestor::property or ancestor-or-self::interface or$nosub">
      <span class="diff-link">J</span>
      </xsl:when>
      <xsl:otherwise>
      <sub class="diff-link">J</sub>
      </xsl:otherwise>
      </xsl:choose>
    </a>
</xsl:when>
<xsl:otherwise>
<xsl:message>No Change Log: <xsl:value-of select="$id"/></xsl:message>
</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="id('changes_mathml2.0-2.02e')/ulist/item/ulist/item">
    <li><a id="{generate-id()}" name="{generate-id()}"/>
      <xsl:apply-templates/>
    </li>
</xsl:template>


 <xsl:template mode="text" match="*[@diff='del']"/>



</xsl:stylesheet>
