<html>
<head>
<title>Reading input from the form</title>
</head>
<body>
<?php
$user = $_GET['user'];
$address = $_GET['address'];
print "Welcome <b>$user</b><P>\n";
print "Your address is:<P>\n<b>$address</b>";
?>
</body>
</html>