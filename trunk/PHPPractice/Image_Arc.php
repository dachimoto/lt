<?php
$myImage = ImageCreate(300,300);

$white = ImageColorAllocate ($myImage, 255, 255, 255);
$red  = ImageColorAllocate ($myImage, 255, 0, 0);
$green = ImageColorAllocate ($myImage, 0, 255, 0);
$blue = ImageColorAllocate ($myImage, 0, 0, 255);

ImageFilledArc($myImage, 100, 100, 200, 150, 0, 90, $red, IMG_ARC_PIE);
ImageFilledArc($myImage, 100, 100, 200, 150, 90, 180 , $green, IMG_ARC_PIE);
ImageFilledArc($myImage, 100, 100, 200, 150, 180, 360 , $blue, IMG_ARC_PIE);

header ("Content-type: image/png");
ImagePNG($myImage);

ImageDestroy($myImage);
?>