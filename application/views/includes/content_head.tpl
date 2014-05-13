<script type="application/javascript">
    $(document).ready(function(){
        $("#scrollBoxCont").attr({
            "width" : $(window).width(),
            "height" : $(window).height()-$("#canvasNav").attr("height"),
            "overflow" : "-moz-scrollbars-vertical",
            "overflow" : "auto"
        });
        $("#body1").attr({
            "width" : $(window).width(),
            "height" : $(window).height()
        });
        $(".head1").css({
            "font-size" : 25
        });
        $(".par1").css({
            "font-size" : 18
        });
        if(document.getElementById('title1').innerHTML=='Story'){
            $("#centerimg").attr({
                "width": $("#scrollBoxCont").attr("width")/3
            });
        }
    });
</script>
<style>
    a:link    { color: #f37f5a }  /* unvisited links */
    a:visited { color: #90e2f9 }  /* visited links   */
    a:hover   { color: #ffffff }  /* user hovers     */
    a:active  { color: #90e2f9 }  /* active links    */
    #body1{
        vertical-align: middle !important;
        background: url(/media/barnwood_sized.jpg) !important;
        background-size: 500px !important;
        background-repeat: repeat-x;
    }
    #navigation{
        margin-right: auto;
        margin-left: auto;
    }
    .head1{
        
    }
    .par1{
        font-weight: bold;
    }
    #scrollBoxCont{
        border:1px solid #ffffff;
        background-color: rgba(129,104,84,0.5);
    }
    #scrollBox{
        margin: 20px;
        font-family:Georgia;
        color:#ffffff;
    }
    #centerimg{
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
</style>