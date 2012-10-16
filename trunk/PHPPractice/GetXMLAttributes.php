<?php
   $xml = simplexml_load_file("books.xml");
   foreach($xml->book[1]->author->attributes() AS $a => $b) {
      echo "$a = $b <br />";
   }
?>