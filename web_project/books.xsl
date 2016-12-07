<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output indent="yes" encoding="UTF-8" omit-xml-declaration="yes" doctype-public="XSLT-compat" method="html"/>


<xsl:template match="/">


<html>


<head>

<title>Book Page</title>

</head>


<body>

<!--Form to input new book details-->



<form method="post" enctype="multipart/form-data" action="Update.php">
Author: 
<input name="author" type="text"/>

<br/>
Title: 
<input name="title" type="text"/>

<br/>
Genre: 
<input name="genre" type="text"/>

<br/>
Price: 
<input name="price" type="text"/>

<br/>

<!--Form components to upload and submit-->

Select image to upload: 
<input name="fileToUpload" type="file" id="fileToUpload"/>

<input name="submit" type="submit" value="Upload Image"/>

</form>

<!--1. All book titles-->


<h2>All book titles:</h2>


<table border="1">


<tr bgcolor="#9acd32">

<th>Title</th>

<th>Artist</th>

</tr>


<xsl:for-each select="/catalog/book">


<tr>


<td>

<xsl:value-of select="title"/>

</td>


<td>

<xsl:value-of select="author"/>

</td>

<!--add image to table cell using path stored in xml-->



<td>

<img src="{image}" height="100" width="100"/>

</td>

</tr>

</xsl:for-each>

</table>

<!--2. All out of print titles-->


<h2>Out of Print Titles:</h2>


<ul>


<xsl:for-each select="/catalog/book/outOfPrint">


<li>

<xsl:value-of select="../title"/>

</li>

</xsl:for-each>

</ul>

<!--3. Fantasy book id numbers and Computer books costing more than 40-->


<h2>Fantasy book id's :</h2>


<xsl:for-each select="/catalog/book/genre[text()='Fantasy']">

<xsl:value-of select="../@id"/>

</xsl:for-each>

<!--4. Published after 2001-->


<h2>Books published after 2001:</h2>


<xsl:for-each select="/catalog/book/publish/publish_date[text()>'2001']">

<xsl:value-of select="../../title"/>

</xsl:for-each>

<!--5. Books costing more than 30 -->


<h2>Books costing more than 30:</h2>


<ol>


<xsl:for-each select="/catalog/book/price[text()>30]">


<li>

<xsl:value-of select="../title"/>
 
<xsl:value-of select="../price"/>

</li>

</xsl:for-each>

</ol>

</body>

</html>

</xsl:template>

</xsl:transform>