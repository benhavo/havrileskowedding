@ $this->inherit('layout/content');
[: block title :]
    <title id = 'title1'>Events</title>
[: endblock :]
[: block body :]
    <body id="body1" onload = "drawNav2();">
        <canvas id="canvasNav"></canvas>
        <div id="scrollBoxCont">
        	<div id="scrollBox">
            	<h1 class="head1"><b>Ceremony</b> – <i>Saturday, May 31, 2014 | 3:00pm</i></h1>
	            <p class="par1">
	            	<img src="/media/olf.jpg" alt="Our Lady Fatima"><br/>
	The mass will be held at <a href="http://www.olfwilton.org/">Our Lady of Fatima</a> church.<br/>
	229 Danbury Road<br/>
	Wilton, CT 06897<br/>
				</p>
				<h1 class="head1"><b>Reception</b> - <i>Saturday, May 31, 2014 | 5:30pm</i></h1>
				<p class="par1">
					<img src="/media/SandCpostcard.jpg" alt="Our Lady Fatima"><br/>
	<a href="http://www.shoreandcountryclub.com">Shore and Country Club</a><br/>
	220 Gregory Blvd<br/>
	Norwalk, CT 06855<br/>
				</p>
			</div>
		</div>
    </body>
[: endblock :]