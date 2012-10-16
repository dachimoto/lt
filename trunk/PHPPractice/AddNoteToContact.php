<?php
     $tel_node = null;
     $doc = xmldocfile('contact.xml');
     $contact_node = $doc->root();
     $kids = $contact_node->children();	 
     while ($node = array_shift($kids)) {
          if (($node->type == XML_ELEMENT_NODE) && ($node->tagname == 'personal')) {
               $tel_node =&$node;
               break;
          }
     }
     if ($tel_node == null){
          die ("Couldn't locate 'personal' node.");
     }
     $work_node = $tel_node->new_child('work', '6666');
   
     print("<pre>\n");
     print("Contact XML heare\n");
     print(htmlspecialchars($doc->dumpmem()));
     print("</pre>\n");
?>