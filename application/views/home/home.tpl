@ $this->inherit('layout/home');
[: block title :]
    <title id = 'title1'>Welcome</title>
[: endblock :]

[: block body :]
        <script type="application/javascript">
            
            var width_vp, height_vp, min_width, max_width, min_height, width_canvas1, scale_all, height_canvas1;

            var width_vahisign, height_vahisign, x_vahisign, y_vahisign,
                width_ornateoval, height_ornateoval, x_ornateoval, y_ornateoval,
                width_vandyclock, height_vandyclock, x_vandyclock, y_vandyclock,
                width_family, height_family, x_family, y_family,
                width_greenframe, height_greenframe,x_greenframe, y_greenframe,
                width_silverframe, height_silverframe, x_silverframe, y_silverframe,
                
                width_welcome, height_welcome, x_welcome, y_welcome,
                width_shelf, height_shelf, x_shelf, y_shelf,
                width_story, height_story, x_story, y_story,
                width_events, height_events, x_events, y_events,
                width_hotels, height_hotels, x_hotels, y_hotels,
                width_travel, height_travel, x_travel, y_travel,
                width_reg, height_reg, x_reg, y_reg,
                height_logout, y_logout,
                height_contentText,
                
                x1, y1, inLink, linkDest;
            
            function set_dimensions(){
                width_vp=$(window).width(), height_vp=$(window).height()
                    min_width = 700, max_width = 700
                    min_height = 850;
                if(width_vp<min_width){
                    width_canvas1 = min_width;
                    scale_all=min_width/1300;
                }else if(width_vp>max_width){
                    width_canvas1 = max_width;
                    scale_all=max_width/1300;
                }else{
                    width_canvas1=width_vp-20;
                    scale_all=width_vp/1300;
                }

                height_canvas1=700/850*width_canvas1;
                
                width_vahisign=193*scale_all, height_vahisign=193*scale_all,
                width_vahisign=193*scale_all, height_vahisign=193*scale_all,
                width_ornateoval=171*scale_all, height_ornateoval=250*scale_all,
                width_family=200*scale_all, height_family=170*scale_all,
                width_vandyclock=220*scale_all, height_vandyclock=243*scale_all,
                width_greenframe=155*scale_all, height_greenframe=200*scale_all,
                width_silverframe=175*scale_all, height_silverframe=216*scale_all,
                
                width_welcome=240*scale_all, height_welcome=103*scale_all, 
                width_shelf=669*scale_all, height_shelf=206*scale_all, 
                width_story=136*scale_all, height_story=59*scale_all, 
                width_events=185*scale_all, height_events=62*scale_all, 
                width_hotels=176*scale_all, height_hotels=67*scale_all, 
                width_travel=160*scale_all, height_travel=64*scale_all, 
                width_reg=240*scale_all, height_reg=65*scale_all,
                height_logout = 20*scale_all,
                height_contentText = 30*scale_all,
                
                y_logout = height_logout+4*scale_all,
                
                x_vahisign=10*scale_all, y_vahisign=20*scale_all,
                x_ornateoval=10*scale_all, y_ornateoval=height_vahisign+y_vahisign+10*scale_all,
                x_vandyclock=width_canvas1-width_vandyclock-10*scale_all, y_vandyclock=y_logout+height_logout+10*scale_all,
                x_family=width_canvas1-width_family-10*scale_all, y_family=y_logout+height_logout+height_vandyclock+20*scale_all,
                 
                x_shelf=(width_canvas1-width_shelf)/2-20*scale_all, y_shelf=height_silverframe+10*scale_all,
                x_linkOffset=x_shelf, y_linkOffset=y_shelf+100*scale_all,
                x_welcome=(width_canvas1-width_welcome)/2-25*scale_all, y_welcome=y_shelf-height_welcome-5*scale_all,
                x_story=-16*scale_all+x_linkOffset, y_story=72*scale_all+y_linkOffset,
                x_events=96*scale_all+x_linkOffset, y_events=0*scale_all+y_linkOffset,
                x_hotels=248*scale_all+x_linkOffset, y_hotels=72*scale_all+y_linkOffset,
                x_travel=390*scale_all+x_linkOffset, y_travel=0*scale_all+y_linkOffset,
                x_reg=470*scale_all+x_linkOffset, y_reg=80*scale_all+y_linkOffset,
                
                x_greenframe=x_shelf+50*scale_all, y_greenframe=y_shelf-height_greenframe+20*scale_all,
                x_silverframe=x_shelf+width_shelf-width_silverframe-30*scale_all, y_silverframe=y_shelf-height_silverframe+16*scale_all,

                x1 = 0, y1 = 0, inLink = false, linkDest;
            }

            function draw_img(ctx,image,x1,y1,width,height,source){
                image.onload = function(){
                    ctx.drawImage(image, x1, y1,width,height);
                };
                image.src = source;
            }
            function draw1() {
                var canvas1 = document.getElementById("canvas1");
                if (canvas1.getContext) {
                    var ctx = canvas1.getContext("2d");
                    ctx = canvas1.getContext("2d");
                    
                    var img_vahisign = new Image();
                    draw_img(ctx,img_vahisign,x_vahisign,y_vahisign,width_vahisign,height_vahisign,'media/vahi_sign1.png')
                    var img_ornateovalswing = new Image();
                    draw_img(ctx,img_ornateovalswing,x_ornateoval,y_ornateoval,width_ornateoval,height_ornateoval,'media/oval_ornate_swing.png');
                    var img_family = new Image();
                    draw_img(ctx,img_family,x_family,y_family,width_family,height_family,'media/family.png');
                    var img_vandyclock = new Image();
                    draw_img(ctx,img_vandyclock,x_vandyclock,y_vandyclock,width_vandyclock,height_vandyclock,'media/vandyclock.png');
                    var img_welcome = new Image();
                    draw_img(ctx,img_welcome,x_welcome,y_welcome,width_welcome,height_welcome,'media/welcome.png');
                    var img_story = new Image();
                    draw_img(ctx,img_story,x_story,y_story,width_story,height_story,'media/story.png');
                    var img_events = new Image();
                    draw_img(ctx,img_events,x_events,y_events,width_events,height_events,'media/events.png');
                    var img_hotels = new Image();
                    draw_img(ctx,img_hotels,x_hotels,y_hotels,width_hotels,height_hotels,'media/hotels.png');
                    var img_travel = new Image();
                    draw_img(ctx,img_travel,x_travel,y_travel,width_travel,height_travel,'media/travel.png');
                    var img_reg = new Image();
                    draw_img(ctx,img_reg,x_reg,y_reg,width_reg,height_reg,'media/registry.png');
                }
            }
            function wrapText(context, text, x, y, maxWidth, height_contentText, tf_center) {
                var words = text.split(' '), line = '';
                for(var n = 0; n < words.length; n++) {
                    var testLine = line + words[n] + ' ',
                        metrics = context.measureText(testLine),
                        testWidth = metrics.width, x1 = x;
                    if (testWidth > maxWidth && n > 0) {
                        if (tf_center){
                            metrics = context.measureText(line),
                            width_line = metrics.width;
                            x1 = x+(maxWidth-width_line)/2;
                        }
                        context.fillText(line, x1, y);
                        line = words[n] + ' ';
                        y += height_contentText;
                    }else if(words[n]=='\n'){
                        if (tf_center){
                            metrics = context.measureText(line),
                            width_line = metrics.width;
                            x1 = x+(maxWidth-width_line)/2;
                        }
                        context.fillText(line, x1, y);
                        line = '';
                        y += height_contentText;
                    }else{
                        line = testLine;
                    }
                }
                if (tf_center){
                    metrics = context.measureText(line),
                    width_line = metrics.width;
                    x1 = x+(maxWidth-width_line)/2;
                }
                context.fillText(line, x1, y);
            }
            function draw2(){
                var ctx = canvas1.getContext("2d");
                var img_shelf = new Image();
                draw_img(ctx,img_shelf,x_shelf,y_shelf,width_shelf,height_shelf,'media/bw_shelf_ribbon.png');
            }
            function draw3(){
                draw1();
                draw2();

                var ctx = canvas1.getContext("2d");
                var img_greenframe = new Image();
                img_greenframe.onload = function(){
                    ctx.drawImage(img_greenframe, x_greenframe, y_greenframe,width_greenframe,height_greenframe);
                };
                img_greenframe.src = 'media/greenframeandpic.png';
                
                ctx = canvas1.getContext("2d");
                var img_silverframe = new Image();
                img_silverframe.onload = function(){
                    ctx.drawImage(img_silverframe, x_silverframe, y_silverframe,width_silverframe,height_silverframe);
                };
                img_silverframe.src = 'media/bdandc.png';
                
                var _second=1000, _minute=_second*60, _hour=_minute*60, _day=_hour*24, timer, now=new Date(), end=new Date('05/31/2014 07:00:00 PM'), until=end.getTime()-now.getTime(),daysLeft=Math.floor(until / _day),
                    maxwidth_content1=width_shelf, x_content1=x_shelf, y_content1=y_story+height_story+height_contentText+40*scale_all,
                    str_content1=daysLeft+' days to go!  -  May 31, 2014 \n \n Welcome to our wedding website!  We appreciate all the love and support of our family and friends and are so excited to share this special time in our lives with each of you.  We look forward to celebrating with everyone in May! \n \n If you have any trouble with the site, please let Ben know at ben.havrilesko@gmail.com';
                ctx = canvas1.getContext("2d");
                ctx.font = 'bold '+height_contentText+"px Georgia";
                ctx.fillStyle = '#ffffff';
                ctx.textBaseline = 'hanging';
                wrapText(ctx,str_content1,x_content1,y_content1,maxwidth_content1,height_contentText,true)

                ctx = canvas1.getContext("2d");
                metrics = ctx.measureText('Logout'),
                width_logout = metrics.width;
                x_logout = width_canvas1 - width_logout - 5*scale_all;
                ctx = canvas1.getContext("2d");
                ctx.font = height_logout+"px Georgia";
                ctx.fillStyle = '#ffffff';
                ctx.textBaseline = 'hanging';
                ctx.fillText('Logout', x_logout, y_logout);   

                canvas1.addEventListener("mousemove", on_mousemove, false);
                canvas1.addEventListener("click", on_click, false);

            }
            function on_mousemove (ev) {
                var x, y,
                    is_chrome = navigator.userAgent.indexOf('Chrome') > -1,
                    is_explorer = navigator.userAgent.indexOf('MSIE') > -1,
                    is_firefox = navigator.userAgent.indexOf('Firefox') > -1,
                    is_safari = navigator.userAgent.indexOf("Safari") > -1,
                    is_Opera = navigator.userAgent.indexOf("Presto") > -1;

                // Get the mouse position relative to the canvas element.
                if (ev.layerX || ev.layerX == 0) { //for firefox
                    x = ev.layerX;
                    y = ev.layerY;
                }
                
                if (!((is_chrome)||(is_safari))){
                    x-=canvas1.offsetLeft;
                    y-=canvas1.offsetTop; 
                }
                
                //is the mouse over the link?
                

                if(x>=x_story && x <= (x_story + width_story) && y>=y_story && y<= (y_story+height_story)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/content/story";
                    inLink=true;
                }else if(x>=x_events && x <= (x_events + width_events) && y>=y_events && y<= (y_events+height_events)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/content/events";
                    inLink=true;
                }else if(x>=x_hotels && x <= (x_hotels + width_hotels) && y>=y_hotels && y<= (y_hotels+height_hotels)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/content/hotels";
                    inLink=true;
                }else if(x>=x_travel && x <= (x_travel + width_travel) && y>=y_travel && y<= (y_travel+height_travel)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/content/travel";
                    inLink=true;
                }else if(x>=x_reg && x <= (x_reg + width_reg) && y>=y_reg && y<= (y_reg+height_reg)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/content/registry";
                    inLink=true;
                }else if(x>=x_welcome && x <= (x_welcome + width_welcome) && y>=y_welcome && y<= (y_welcome+height_welcome)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/home";
                    inLink=true;
                }else if(x>=x_logout && x <= (x_logout + width_logout) && y>=y_logout && y<= (y_logout+height_logout)){
                    $("#body1").css("cursor","pointer");
                    linkDest = "/home/logout";
                    inLink=true;
                    ctx = canvas1.getContext("2d");
                    ctx.font = height_logout+"px Georgia";
                    ctx.fillStyle = '#8ae0fb';
                    ctx.fillText('Logout', x_logout, y_logout);
                }else{
                    $("#body1").css("cursor","default");
                    inLink=false;
                    ctx = canvas1.getContext("2d");
                    ctx.font = height_logout+"px Georgia";
                    ctx.fillStyle = '#ffffff';
                    ctx.textBaseline = 'hanging';
                    ctx.fillText('Logout', x_logout, y_logout);
                }
            }
            function on_click(e) {
                if(inLink){
                    window.location = linkDest;
                }
            }
            $(document).ready(function(){
                set_dimensions();
                $("#body1").attr({
                    "width" : width_vp,
                    "height" : height_canvas1
                });

                $("#center_content").attr({
                    "width" : width_canvas1,
                    "height" : height_canvas1
                });
                
                $("#canvas1").attr({
                    "width" : width_canvas1,
                    "height" : height_canvas1,
                    "top" : 0,
                    "left" : (width_vp - width_canvas1)/2
                });
            });
        </script>
        <style>
            #body1{
                background: url(/media/barnwood_sized.jpg) !important;
                background-size: 500px 150% !important;
                background-repeat: repeat-x;
            }
            #center_content{
                position: relative;
            }
            #canvas1{    
                background: transparent;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }
        </style>
    </head>
    <body id = "body1" onload="draw3();">
        <div id = "center_content">
            <canvas id="canvas1"></canvas>
        </div>
    </body>
[: endblock :]