<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" 
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xi="http://www.w3.org/2001/XInclude"
        xmlns:x="http://www.reizu.org/schema/style">
        
    <xsl:output method="html" encoding="UTF-8" />
    
    <!-- preserve tags -->
    
    <xsl:template match="node()|@*">
        <xsl:copy>
	          <xsl:apply-templates select="node()|@*" />
        </xsl:copy>
    </xsl:template>

    <!-- use this tag to enclose fragments with a single element 
         as required for valid xml documents. --> 
         
	  <xsl:template match="x:root">
		    <xsl:apply-templates />
	  </xsl:template>

    <!-- name templates -->
    
    <xsl:template name="x:head">
        <head>
            <title>{{window_title}} | I have always been here</title>
            <link href="http://yui.yahooapis.com/2.5.1/build/reset-fonts-grids/reset-fonts-grids.css" rel="stylesheet" type="text/css" /> 
            <link rel="stylesheet" type="text/css" href="/screen.css" />
            <link rel="alternate" type="application/atom+xml" title="Gmosx.com Atom Feed" href="http://www.gmosx.com/index.atom" />
            <meta name="description" content="The blog of George Moschovitis" />
            <meta name="keywords" content="$(meta_keywords)$gmosx,blog" />
        </head>
    </xsl:template>

    <xsl:template name="x:script-container">
	    <script type="text/javascript" src="http://yui.yahooapis.com/2.5.1/build/yuiloader/yuiloader-beta-min.js">{{}}</script>
	    <script type="text/javascript" src="/std.js">{{}}</script>
        <script type="text/javascript">
	    var loader = new YAHOO.util.YUILoader({
            require: [ "event", "dom", "cookie", {{SCRIPT_LOADER}} ],
    	    loadOptional: true,
    		onSuccess: function () {
      		    YAHOO.util.Event.onDOMReady(function () {
                    var Dom = YAHOO.util.Dom;
                    var session, user, level, umenu;

                    umenu = 'Hello, please <a href="/users/signin">sign in</a>';
                    
                    if (session = YAHOO.util.Cookie.get("nsc")) {
                        eval("session = " + base64Decode(unescape(session)) + ";");
                        if (user = session["USER"]) {
                            level = Number(user.level);
                            umenu = 'hello <strong>' + user.name + '</strong> <a href="/users/signin?_method=signout"><img src="/img/cross.png" style="margin-left: 5px" /></a>';
                        }
                    } else {
                        session = {};
                    }        

                    Dom.get("user-menu").innerHTML = umenu;

                    enableAdmin(level);
                    
                    {{SCRIPT}}
      		    });
    		}
	    });
	    loader.insert();
	    </script>
    </xsl:template>
            
    <xsl:template name="x:header">
      	<div id="hd">
            {{ad_top}}
    		<div id="header">
      			<h1><a href="/">I have always been here</a> </h1>
      			<h2>
      			    <a href="/categories/*art">Art</a>, 
      			    <a href="/categories/*business">Business</a>, 
      			    <a href="/categories/*dogma">Dogma</a>, 
      			    <a href="/categories/*life">Life</a>, 
      			    <a href="/categories/*technology">Technology</a>
      			</h2>
      	    </div>
      	</div>
      	<div id="top-menu">
      	    <div id="user-menu">&#160;</div>
            <div id="breadcrumbs">
                <xsl:apply-templates select="x:breadcrumbs" mode="show" />
            </div>
            <br class="clear" />
      	</div>
    </xsl:template>
    
    <xsl:template name="x:footer">
      	<div id="ft">
            Copyright &#169; 2008 <a href="http://gmosx.com" target="blank">George Moschovitis</a>, all rights reserved. 
            Powered by <a href="http://nitroproject.org" target="_blank">Nitro</a>.  
            <span style="margin-left: 20px"><a href="/terms">Site terms</a> / 
            <a href="/privacy">Privacy</a></span> /
            version 4.03
            <span style="margin-left: 20px"><img src="/img/feed.png" style="vertical-align: middle; margin-right: 5px" /> <a href="/index.atom">Atom feed</a></span>
      	</div>
    </xsl:template>
        
    <!-- match templates -->

    <xsl:template match="x:doc">
        <html>
            <xsl:call-template name="x:head" />
            <body class="yui-skin-sam">
                <div id="doc">
                    <xsl:call-template name="x:header" />
                    <div id="bd">
                      	<div class="yui-t3">
                            <div id="yui-main">
                                <div class="yui-b">
                                    <xsl:apply-templates />
                                </div>
                            </div>
                            <div id="side" class="yui-b">
                                <xsl:apply-templates select="x:side" mode="show" />	
                                <br />
                            </div>
                      	</div>
                    </div>
                    <xsl:call-template name="x:footer" />
                </div>
                <xsl:call-template name="x:script-container" />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="x:doc[@class='full']">
        <html>
            <xsl:call-template name="x:head" />
            <body class="yui-skin-sam">
                <div id="doc">
                    <xsl:call-template name="x:header" />
                    <div id="bd">
                        <div id="yui-main">
                            <div class="yui-b">
                                <xsl:apply-templates />
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="x:footer" />
                </div>
                <xsl:call-template name="x:script-container" />
            </body>
        </html>
    </xsl:template>
            
	<xsl:template match="x:script-load">
	</xsl:template>

	<xsl:template match="x:script-load" mode="show">
		<xsl:apply-templates />
	</xsl:template>

	<xsl:template match="x:script">
	</xsl:template>

	<xsl:template match="x:script" mode="show">
		<xsl:apply-templates />
	</xsl:template>
	
	<xsl:template match="x:side">
	</xsl:template>

	<xsl:template match="x:side" mode="show">
		<xsl:apply-templates />
	</xsl:template>

    <xsl:template match="x:breadcrumbs">
    </xsl:template>

    <xsl:template match="x:breadcrumbs" mode="show">
		<xsl:apply-templates />
    </xsl:template>

    <xsl:template match="x:msg">
        <span style="background: red">
            <xsl:apply-templates />
        </span>
    </xsl:template>
    
    <!-- digg button: http://digg.com/tools/integrate -->
    
    <xsl:template match="x:diggit">
        <script type="text/javascript">
        digg_skin = "compact";
        digg_window = "new";
        </script>
        <script src="http://digg.com/tools/diggthis.js" type="text/javascript">{{}}</script>    
    </xsl:template>
    
</xsl:stylesheet>
