<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>The HTML5 Herald</title>
  <meta name="description" content="The HTML5 Herald">
  <meta name="author" content="SitePoint">

  <link rel="stylesheet" href="css/styles.css?v=1.0">

  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>

<body>
  <h1> WELCOME TO TÜAN </h1>
  <form name="logout" method="POST" action="${createLink(controller:'logout') }"> <input type="submit" value="logout"></form> 
  <h2> Time to create a User </h2>
  <g:link controller = 'User' action = 'create'>New User</g:link>
  <br></br>
  <g:link controller = 'ftp' >Upload</g:link>
</body>
</html>