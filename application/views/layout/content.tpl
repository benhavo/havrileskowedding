<!DOCTYPE html>
<html lang="en">
	<head>
		[: block title :] <title id='title1'></title> [: endblock :]
		@ $this->inc("includes/head_elements");
		@ $this->inc("includes/navScript");
		@ $this->inc("includes/content_head");
		[: block head_add :] [: endblock :]
	</head>
	<body id="body1" onload = "drawNav2();">
   		<div class="container">
		
		[: block body :] page contents [: endblock :]
		
		</div>
	</body>
</html>