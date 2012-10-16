<html>
<head>
<title>Checkbox Demo</title>
</head>
<body>
<h3>Demonstrates reading checkboxes</h3>
<?php
$chkFries = $_POST['chkFries'];
$chkSoda = $_POST['chkSoda'];
$chkShake = $_POST['chkShake'];
$chkKetchup = $_POST['chkKetchup'];
print <<<HERE
chkFries: $chkFries <br>
chkSoda: $chkSoda <br>
chkShake: $chkShake <br>
chkKetchup: $chkKetchup <br>
<hr>

HERE;

$total = 0;

if (!empty($chkFries)){
  print ("You chose Fries <br>");
  $total = $total + $chkFries;
}

if (!empty($chkSoda)){
  print ("You chose Soda <br>");
  $total = $total + $chkSoda;
}

if (!empty($chkShake)){
  print ("You chose Shake <br>");
  $total = $total + $chkShake;
}

if (!empty($chkKetchup)){
  print ("You chose Ketchup <br>");
  $total = $total + $chkKetchup;
}

print "The total cost is $$total";

?>
</body>
</html>