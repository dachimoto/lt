<?php
header("Content-type: image/gif");
$cells = array ( liked=>200, hated=>400, indifferent=>900 );
$max = max( $cells );
$total = count ( $cells );
$totalwidth = 300;
$totalheight = 200;
$xgutter = 20; // left/right margin
$ygutter = 20; // top/bottom margin
$internalgap = 10; // space between cells
$bottomspace = 30; // gap at the bottom (in addition to margin)
$font = "ARIALBD.TTF";
 $graphCanX = ( $totalwidth - $xgutter*2 );
$graphCanY = ( $totalheight - $ygutter*2 - $bottomspace );// starting draw position x - axis
$posX = $xgutter; // starting draw pos - y -  axis
$posY = $totalheight - $ygutter - $bottomspace;
$cellwidth = (int) (( $graphCanX - ( $internalgap * ( $total-1 ) )) / $total) ;
 $textsize = (int)($bottomspace);
// adjust font size
while ( list( $key, $val ) = each ( $cells ) )
    {
     while ( 1 )
        {
        $box = ImageTTFbBox( $textsize, 0, $font, $key );
        $textWidth = abs( $box[2] );
        if ( $textWidth < $cellwidth )
            break;
        $textsize--;
        }
    }
$image = imagecreate( $totalwidth, $totalheight );
$red = ImageColorAllocate($image, 255, 0, 0);
$blue = ImageColorAllocate($image, 0, 0, 255 );
$black = ImageColorAllocate($image, 0, 0, 0 );
$grey = ImageColorAllocate($image, 100, 100, 100 );
 reset ($cells);
 while ( list( $key, $val ) = each ( $cells ) )
     {
     $cellheight = (int) (($val/$max) * $graphCanY);
     $center = (int)($posX+($cellwidth/2));
    imagefilledrectangle( $image, $posX, ($posY-$cellheight), ($posX+$cellwidth), $posY, $blue );
     $box = ImageTTFbBox( $textsize, 0, $font, $key );
     $tw = $box[2];
     ImageTTFText(    $image, $textsize, 0, ($center-($tw/2)),
             ($totalheight-$ygutter), $black, $font, $key );
     $posX += ( $cellwidth + $internalgap);
     }
 imagegif( $image );
 ?>
<!--/*
Code Revised from 



Sam's Teach Yourself Php, Mysql and Apache in 24 Hours 
(Sams Teach Yourself S.) (Paperback)
by Julie C. Meloni 

# Paperback: 616 pages
# Publisher: Sams (1 Jan 2004)
# Language English
# ISBN: 0672326205

-->