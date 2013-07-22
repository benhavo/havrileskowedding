<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title id = 'title1'>Login</title>
        @ $this->inc("includes/head_elements");
        <script type="application/javascript">
            $(document).ready(function(){
                $("#body1").attr({
                    "width" : $(window).width(),
                    "height" : $(window).height()
                });
                $("#center_content").css({
                    "height" : $(window).height()*.4,
                    "padding-top" : $(window).height()*.3,
                    "width" : $(window).height()*.4,
                    "margin-left" : "auto",
                    "margin-right" : "auto"
                });
            });
        </script>
        <style>
            #body1{
                vertical-align: middle !important;
                background: url(/media/barnwood_wall_dark.jpg) no-repeat center center fixed !important; 
                -webkit-background-size: cover !important;
                -moz-background-size: cover !important;
                -o-background-size: cover !important;
                background-size: cover !important;
            }
            #center_content{
                position: relative;
            }
            #username{
                width: 300px;
                height: 30px;
                font-size: 30px;
                font-weight: bold;
                background: transparent;
                border-style: solid;
                border-width: 4px;
                color: #ffffff; 
            }
            #password{
                width: 300px;
                height: 30px;
                font-size: 30px;
                font-weight: bold;
                background: transparent;
                border-style: solid;
                border-width: 4px;
                color: #ffffff; 
            }
            #label1{
                width: 200px !important;
                height: 20px;
                font-size: 30px;
                font-weight: bold;
                background: transparent;
                color: #ffffff;  
            }
            #submit1{
                font-size: 150%;
                font-weight: bold;
                color: #999999;
                background: #ffffff;
            }
            #img_welcome{
            	width: 336px;
                height: 145px;
            }
            
        </style>
    </head>
    <body id="body1">
        <div id="center_content">
	        <form action="/home/login" method="post">

				<div style="text-align:center">
					<img id = 'img_welcome' src="/media/welcome.png" />
				</div>

				<div>
					@ if($login_error==true):
					<div class="alert alert-error">
						<B>Oops!</b> Unable to log you in with the information provided. Please try again.
					</div>
					@ endif;
					<form id="form_login" accept-charset="UTF-8" action="/home/login" method="POST">
						<label id="label1" for="username">Username</label><br/>
						<input id="username" type="text" name="username"></input><br/>
						<label id="label1" for="password">Password</label><br/>
						<input id="password" type="password" value="" name="password"></input><br/><br/>
						<input id="submit1" type="submit" value="Login"></input>
					</form>
					
				</div>
			</form> 
        </div>
    </body>
</html>