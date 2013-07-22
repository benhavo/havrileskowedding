<!DOCTYPE html>
<html lang="en">
<head>
	[: block title :] <title id='title1'></title> [: endblock :]
	@ $this->inc("includes/head_elements");
	@ $this->inc("includes/navScript");
	@ $this->inc("includes/content_head");
</head>

<body>
	
<div id="wrapper">
	
	<div id="content">
		<div class="container">
			[: block body :] page contents [: endblock :]
		</div>
	</div>

</div>

</body>
</html>