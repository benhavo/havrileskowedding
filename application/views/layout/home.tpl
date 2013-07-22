<!DOCTYPE html>
<html lang="en"> <!--<![endif]-->
<head>
	@ $this->inc("includes/head_elements");

	[: block head :] <!--head extras--> [: endblock :]
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