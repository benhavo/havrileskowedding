<script type="application/javascript">
    if(document.getElementById('title1').innerHTML=='Welcome'){
        var scale1=1;
    }else{
        var scale1=1/2.5;
    }
    var width_vp = $(window).width(), height_vp = $(window).height(), 

        width_welcome=300*scale1, height_welcome=129*scale1, 
        width_shelf=836*scale1, height_shelf=257*scale1, 
        width_story=170*scale1, height_story=74*scale1, 
        width_events=231*scale1, height_events=77*scale1, 
        width_hotels=220*scale1, height_hotels=84*scale1, 
        width_travel=200*scale1, height_travel=79*scale1, 
        width_reg=300*scale1, height_reg=81*scale1, 
        width_canvasNav = width_shelf+width_reg/2, 
        height_canvasNav = height_welcome+height_shelf+height_reg,

        x_welcome=(width_canvasNav-width_welcome)/2-30*scale1, y_welcome=0,
        x_shelf=50*scale1, y_shelf=y_welcome+height_welcome,
        y_linkOffset = 260*scale1,
        x_story=40*scale1, y_story=90*scale1+y_linkOffset,
        x_events=180*scale1, y_events=0*scale1+y_linkOffset,
        x_hotels=370*scale1, y_hotels=90*scale1+y_linkOffset,
        x_travel=540*scale1, y_travel=0*scale1+y_linkOffset,
        x_reg=670*scale1, y_reg=90*scale1+y_linkOffset,

        x1 = 0, y1 = 0, inLink = false, linkDest;
    function drawNav1() {
        //alert($(window).width() + " " + $(window).height());
        
        var canvasNav = document.getElementById("canvasNav");
        if (canvasNav.getContext) {
            var ctx = canvasNav.getContext("2d");
            var img_welcome = new Image();
            img_welcome.onload = function(){
                x1 = x_welcome;
                y1 = y_welcome;
                ctx.drawImage(img_welcome, x1, y1,width_welcome,height_welcome);
            };
            img_welcome.src = '/media/welcome.png';
            
            var img_story = new Image();
            ctx = canvasNav.getContext("2d");
            img_story.onload = function(){
                x1 = x_story;
                y1 = y_story;
                ctx.drawImage(img_story, x1, y1,width_story,height_story);
            };
            img_story.src = '/media/story.png';

            var img_events = new Image();
            ctx = canvasNav.getContext("2d");
            img_events.onload = function(){
                x1 = x_events;
                y1 = y_events;
                ctx.drawImage(img_events, x1, y1,width_events,height_events);
            };
            img_events.src = '/media/events.png';

            var img_hotels = new Image();
            ctx = canvasNav.getContext("2d");
            img_hotels.onload = function(){
                x1 = x_hotels;
                y1 = y_hotels;
                ctx.drawImage(img_hotels, x1, y1,width_hotels,height_hotels);
            };
            img_hotels.src = '/media/hotels.png';

            var img_travel = new Image();
            ctx = canvasNav.getContext("2d");
            img_travel.onload = function(){
                x1 = x_travel;
                y1 = y_travel;
                ctx.drawImage(img_travel, x1, y1,width_travel,height_travel);
            };
            img_travel.src = '/media/travel.png';

            var img_reg = new Image();
            ctx = canvasNav.getContext("2d");
            img_reg.onload = function(){
                x1 = x_reg;
                y1 = y_reg;
                ctx.drawImage(img_reg, x1, y1,width_reg,height_reg);
            };
            img_reg.src = '/media/registry.png';

        }

    }
    
    function drawNav2(){
        drawNav1();
        var ctx = canvasNav.getContext("2d");
        var img_shelf = new Image();
        img_shelf.onload = function(){
            x1 = x_shelf;
            y1 = y_shelf;
            ctx.drawImage(img_shelf, x1, y1,width_shelf,height_shelf);
        };
        img_shelf.src = '/media/bw_shelf_ribbon.png';

        canvasNav.addEventListener("mousemove", on_mousemove, false);
        canvasNav.addEventListener("click", on_click, false);   

    }
    //check if the mouse is over the link and change cursor style
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
            x-=canvasNav.offsetLeft;
            y-=canvasNav.offsetTop; 
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
        }else{
            $("#body1").css("cursor","default");
            inLink=false;
        }
    }

    //if the link has been clicked, go to link
    function on_click(e) {
        //alert("inLink = " + inLink);
        if (inLink)  {
            window.location = linkDest;
        }
    }

    $(document).ready(function(){
        $("#canvasNav").attr({
            "width" : width_canvasNav,
            "height" : height_canvasNav
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
</style>