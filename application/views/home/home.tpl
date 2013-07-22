@ $this->inherit('layout/home');

[: block body :]
        <title id = 'title1'>Welcome</title>
        <script src="/js/libs/jquery-1.7.2.min.js"></script>
        <script type="application/javascript">
            
            var width_vp=$(window).width(), height_vp=$(window).height();
            if(width_vp<1200){
                var width_canvas1 = 1200;
            }else{
                var width_canvas1 = width_vp;
            }
            if(height_vp<800){
                var height_canvas1 = 800;
            }else{
                var height_canvas1 = height_vp;
            }

            var scale1=1/3.5,
                
                y_offset_nav=200*scale1,
                width_vahisign=193, height_vahisign=193,
                width_ornateoval=343, height_ornateoval=500,
                
                width_shelf=2370*scale1, height_shelf=730*scale1, x_offset_nav=(width_vp-width_shelf)/2, x_shelf=50*scale1+x_offset_nav, y_shelf=100*scale1+y_offset_nav,
                width_welcome=1343/2*scale1, height_welcome=579/2*scale1, x_welcome=900*scale1+x_offset_nav, y_welcome=0*scale1,
                width_logout, height_logout=20, x_logout, y_logout=10,
                width_story=525*scale1, height_story=230*scale1, x_story=0*scale1+x_offset_nav, y_story=730*scale1+y_offset_nav,
                width_events=660*scale1, height_events=220*scale1, x_events=420*scale1+x_offset_nav, y_events=470*scale1+y_offset_nav,
                width_hotels=625*scale1, height_hotels=240*scale1, x_hotels=920*scale1+x_offset_nav, y_hotels=730*scale1+y_offset_nav,
                width_travel=560*scale1, height_travel=220*scale1, x_travel=1390*scale1+x_offset_nav, y_travel=470*scale1+y_offset_nav,
                width_reg=855*scale1, height_reg=230*scale1, x_reg=1770*scale1+x_offset_nav, y_reg=750*scale1+y_offset_nav,
                x1 = 0, y1 = 0, inLink = false, linkDest, daysLeft;
            
            function draw1() {
                var canvas1 = document.getElementById("canvas1");
                if (canvas1.getContext) {
                    var ctx = canvas1.getContext("2d");
                    var img_vahisign = new Image();
                    img_vahisign.onload = function(){
                        x1 = 10;
                        y1 = 20;
                        ctx.drawImage(img_vahisign, x1, y1,width_vahisign,height_vahisign);
                    };
                    img_vahisign.src = 'media/vahi_sign1.png';

                    ctx = canvas1.getContext("2d");
                    var img_ornateovalswing = new Image();
                    img_ornateovalswing.onload = function(){
                        x1 = 20;
                        y1 = height_vahisign+20;
                        ctx.drawImage(img_ornateovalswing, x1, y1,width_ornateoval/2,height_ornateoval/2);
                    };
                    img_ornateovalswing.src = 'media/oval_ornate_swing.png';
                
                    var img_welcome = new Image();
                    ctx = canvas1.getContext("2d");
                    img_welcome.onload = function(){
                        x1 = x_welcome;
                        y1 = y_welcome;
                        ctx.drawImage(img_welcome, x1, y1,width_welcome,height_welcome);
                    };
                    img_welcome.src = 'media/welcome.png';
                    
                    var img_story = new Image();
                    ctx = canvas1.getContext("2d");
                    img_story.onload = function(){
                        x1 = x_story;
                        y1 = y_story;
                        ctx.drawImage(img_story, x1, y1,width_story,height_story);
                    };
                    img_story.src = 'media/story.png';

                    var img_events = new Image();
                    ctx = canvas1.getContext("2d");
                    img_events.onload = function(){
                        x1 = x_events;
                        y1 = y_events;
                        ctx.drawImage(img_events, x1, y1,width_events,height_events);
                    };
                    img_events.src = 'media/events.png';

                    var img_hotels = new Image();
                    ctx = canvas1.getContext("2d");
                    img_hotels.onload = function(){
                        x1 = x_hotels;
                        y1 = y_hotels;
                        ctx.drawImage(img_hotels, x1, y1,width_hotels,height_hotels);
                    };
                    img_hotels.src = 'media/hotels.png';

                    var img_travel = new Image();
                    ctx = canvas1.getContext("2d");
                    img_travel.onload = function(){
                        x1 = x_travel;
                        y1 = y_travel;
                        ctx.drawImage(img_travel, x1, y1,width_travel,height_travel);
                    };
                    img_travel.src = 'media/travel.png';

                    var img_reg = new Image();
                    ctx = canvas1.getContext("2d");
                    img_reg.onload = function(){
                        x1 = x_reg;
                        y1 = y_reg;
                        ctx.drawImage(img_reg, x1, y1,width_reg,height_reg);
                    };
                    img_reg.src = 'media/registry.png';
                }
            }
            function wrapText(context, text, x, y, maxWidth, lineHeight, tf_center) {
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
                        y += lineHeight;
                    }else if(words[n]=='\n'){
                        if (tf_center){
                            metrics = context.measureText(line),
                            width_line = metrics.width;
                            x1 = x+(maxWidth-width_line)/2;
                        }
                        context.fillText(line, x1, y);
                        line = '';
                        y += lineHeight;
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
                draw1();
                var ctx = canvas1.getContext("2d");
                var img_shelf = new Image();
                img_shelf.onload = function(){
                    x1 = x_shelf;
                    y1 = y_shelf;
                    ctx.drawImage(img_shelf, x1, y1,width_shelf,height_shelf);
                };
                img_shelf.src = 'media/bw_shelf_ribbon.png';
                
                var _second=1000, _minute=_second*60, _hour=_minute*60, _day=_hour*24, timer, now=new Date(), end=new Date('05/31/2014 07:00:00 PM'), until=end.getTime()-now.getTime(),daysLeft=Math.floor(until / _day),
                    lineHeight=35, maxwidth_content1=width_shelf, x_content1=x_shelf, y_content1=y_story+height_story+lineHeight+50*scale1,
                    str_content1=daysLeft+' days to go!  -  May 31, 2014 \n \n Welcome to our wedding website!  We appreciate all the love and support of our family and friends and are so excited to share this special time in our lives with each of you.  We look forward to celebrating with everyone in May!';
                ctx = canvas1.getContext("2d");
                ctx.font = 'bold '+lineHeight+"px Georgia";
                ctx.fillStyle = '#ffffff';
                ctx.textBaseline = 'hanging';
                wrapText(ctx,str_content1,x_content1,y_content1,maxwidth_content1,lineHeight,true)

                ctx = canvas1.getContext("2d");
                metrics = ctx.measureText('Logout'),
                width_logout = metrics.width;
                x_logout = width_vp - width_logout - 0;
                ctx = canvas1.getContext("2d");
                ctx.font = height_logout+"px Georgia";
                ctx.fillStyle = '#ffffff';
                ctx.textBaseline = 'hanging';
                ctx.fillText('Logout', x_logout, y_logout);

                canvas1.addEventListener("mousemove", on_mousemove, false);
                canvas1.addEventListener("click", on_click, false);   
            }
            function on_mousemove (ev) {
                var x, y;
                if (ev.layerX || ev.layerX == 0) { //for firefox
                    x = ev.layerX;
                    y = ev.layerY;
                }
                x-=canvas1.offsetLeft;
                y-=canvas1.offsetTop;
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
                $("#body1").attr({
                    "width" : width_canvas1,
                    "height" : height_canvas1
                });
                
                $("#canvas1").attr({
                    "width" : width_canvas1,
                    "height" : height_canvas1-$('#content1').height()
                });
            });
        </script>
        <style>
            #bodyNav{
                background: transparent;
                cursor: default;
            }
            #center_contentNav{
                background: transparent;
                width: 100% !important;
                height: 100% !important;
                margin-right: auto;
                margin-left: auto;
            }
            #canvasNav{
                background: transparent;
                padding-left: 0;
                padding-right: 0;
                margin-left: auto;
                margin-right: auto;
                display: block;
            }
            #body1{
                vertical-align: middle !important;
                background: url(/media/barnwood_wall_dark.jpg) no-repeat center center fixed !important; 
                -webkit-background-size: cover !important;
                -moz-background-size: cover !important;
                -o-background-size: cover !important;
                background-size: cover !important;
            }
            .center_content{
                margin-right: auto !important;
                margin-left: auto !important;
                width: 100% !important;
                height: 100% !important;
            }
            #canvas1{
                background: transparent;
                margin-right: auto;
                margin-left: auto;
            }
            #content1{
                background: transparent;
                position: absolute;
            }
        </style>
    </head>
    <body id = "body1" onload="draw2();">
        <div class = "center_content">
            <canvas id="canvas1"></canvas>
            <p id = "countdown"></p>
            <p id = 'content1'></p>
        </div>
        <div id='logout'><a ></a></div>
    </body>
[: endblock :]