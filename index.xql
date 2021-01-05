xquery version "3.1";

module namespace idx="http://teipublisher.com/index";

declare namespace tei="http://www.tei-c.org/ns/1.0";
declare namespace dbk="http://docbook.org/ns/docbook";

declare variable $idx:persons := doc('/db/apps/serafin/data/auxiliary/authorityLists.xml');

declare variable $idx:app-root :=
    let $rawPath := system:get-module-load-path()
    return
        (: strip the xmldb: part :)
        if (starts-with($rawPath, "xmldb:exist://")) then
            if (starts-with($rawPath, "xmldb:exist://embedded-eXist-server")) then
                substring($rawPath, 36)
            else
                substring($rawPath, 15)
        else
            $rawPath
    ;

(:~
 : Helper function called from collection.xconf to create index fields and facets.
 : This module needs to be loaded before collection.xconf starts indexing documents
 : and therefore should reside in the root of the app.
 :)
declare function idx:get-metadata($root as element(), $field as xs:string) {
    let $header := $root/tei:teiHeader
    return
        switch ($field)
            case "title" return
                string-join((
                    $header//tei:msDesc/tei:head, $header//tei:titleStmt/tei:title[@type = 'main'],
                    $header//tei:titleStmt/tei:title
                ), " - ")
            case "author" return
                for $p in $header//tei:correspDesc/tei:correspAction/tei:persName/@ref
                    return 
                        idx:resolve-person($p)
            case "language" return
                $root//tei:text[@type='source']/@xml:lang
            case "date" return 
                substring($header//tei:correspDesc/tei:correspAction/tei:date/@when, 1, 4)
            case "genre" return 
                'Letter'
            default return
                ()
};

declare function idx:resolve-person($key) {
    $idx:persons/id(substring-after($key, '#'))/tei:persName
};
