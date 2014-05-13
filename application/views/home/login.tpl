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
                $("#center_content").attr({
                    "width" : $(window).width(),
                    "height" : $(window).height()
                });
            });
        </script>
        <style>
            #body1{
                background: url(/media/barnwood_sized.jpg) !important;
                background-size: 500px !important;
                background-repeat: repeat-x;
            }
            #center_content{
                text-align: center;
                display: block;
                margin-right: auto;
                margin-left: auto;
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
            <img id = 'img_welcome' src="/media/welcome.png"/>
            @ if($login_error==true):
            <div class="alert alert-error">
                <B>Oops!</b> Unable to log you in with the information provided.   Please try again.
            </div>
            @ endif;
            <form id="form_login" accept-charset="UTF-8" action="/home/login" method="POST">
				<label id="label1" for="password">Password</label><br/>
				<input id="password" type="password" value="" name="password"></input><br/><br/>
				<input id="submit1" type="submit" value="Login"></input>
			</form>
        </div>
    </body>
</html>