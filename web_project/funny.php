<?php

// Load the XML source
$xml = new DOMDocument;
$xml->load('funny.xml');
$xsl = new DOMDocument;
$xsl->substituteEntities = true; 
$xsl->load('index.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules

echo $proc->transformToXML($xml);

?>
