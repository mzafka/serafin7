
xquery version "3.1";

module namespace pm-config="http://www.tei-c.org/tei-simple/pm-config";

import module namespace pm-docx-tei="http://www.tei-c.org/pm/models/docx/tei/module" at "../transform/docx-tei-module.xql";
import module namespace pm-docbook-web="http://www.tei-c.org/pm/models/docbook/web/module" at "../transform/docbook-web-module.xql";
import module namespace pm-docbook-print="http://www.tei-c.org/pm/models/docbook/fo/module" at "../transform/docbook-print-module.xql";
import module namespace pm-docbook-latex="http://www.tei-c.org/pm/models/docbook/latex/module" at "../transform/docbook-latex-module.xql";
import module namespace pm-docbook-epub="http://www.tei-c.org/pm/models/docbook/epub/module" at "../transform/docbook-epub-module.xql";
import module namespace pm-serafin-web="http://www.tei-c.org/pm/models/serafin/web/module" at "../transform/serafin-web-module.xql";
import module namespace pm-serafin-print="http://www.tei-c.org/pm/models/serafin/fo/module" at "../transform/serafin-print-module.xql";
import module namespace pm-serafin-latex="http://www.tei-c.org/pm/models/serafin/latex/module" at "../transform/serafin-latex-module.xql";
import module namespace pm-serafin-epub="http://www.tei-c.org/pm/models/serafin/epub/module" at "../transform/serafin-epub-module.xql";

declare variable $pm-config:web-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docbook.odd" return pm-docbook-web:transform($xml, $parameters)
case "serafin.odd" return pm-serafin-web:transform($xml, $parameters)
    default return pm-docbook-web:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:print-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docbook.odd" return pm-docbook-print:transform($xml, $parameters)
case "serafin.odd" return pm-serafin-print:transform($xml, $parameters)
    default return pm-docbook-print:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:latex-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docbook.odd" return pm-docbook-latex:transform($xml, $parameters)
case "serafin.odd" return pm-serafin-latex:transform($xml, $parameters)
    default return pm-docbook-latex:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:epub-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docbook.odd" return pm-docbook-epub:transform($xml, $parameters)
case "serafin.odd" return pm-serafin-epub:transform($xml, $parameters)
    default return pm-docbook-epub:transform($xml, $parameters)
            
    
};
            


declare variable $pm-config:tei-transform := function($xml as node()*, $parameters as map(*)?, $odd as xs:string?) {
    switch ($odd)
    case "docx.odd" return pm-docx-tei:transform($xml, $parameters)
    default return error(QName("http://www.tei-c.org/tei-simple/pm-config", "error"), "No default ODD found for output mode tei")
            
    
};
            
    