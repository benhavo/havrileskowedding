@ $this->inherit('layout/content');
[: block title :]
    <title id = 'title1'>Travel</title>
[: endblock :]
[: block body :]
    <body id="body1" onload = "drawNav2();">
        <canvas id="canvasNav"></canvas>
        <div id="scrollBoxCont">
        	<div id="scrollBox">
            	<p class="par1">
	            	The easiest way to get from the airports to Wilton is by renting a car.  The Hilton Garden Inn and the Courtyard Marriott hotels are just down the street from one another, and you'll be able to find either from the driving directions below.
                </p>
                <h1 class"head1">From NYC</h1>
                <p class="par1">
                    If you're originating from New York City, we recommend taking the MetroNorth train for an easy 45-60 minute ride out to Connecticut. Take the red Hudson Line to the South Norwalk stop where it's only a short cab ride (10-15 min) to either hotel. Complimentary shuttles can also be arranged between the train station and the hotels, if coordinated with the hotel in advance. 
                </p>
                <h1 class"head1">From La Guardia Airport</h1>
                <p class="par1">
                    Follow signs to Whitestone Bridge. After crossing bridge take Hutchinson Pkwy. To Merritt Expressway (Rt. 15). Follow Rt. 15 to Exit 40B. Turn right onto Main Avenue (Rt. 7N). Hotels will be on right.

                    <ul>
                        <li>Distance from Hotel: 44 mi.</li>
                        <li>Drive Time: 60 min.</li>
                    </ul>

                </p>
                <p>
                
                <h1 class"head1">From John F. Kennedy International Airport</h1>
                <p class="par1">
                    From JFK: Follow signs to Whitestone Bridge via VanWyck Expressway; after bridge/toll, take Hutchinson Parkway into CT to Merritt Exp. (Rt. 15); exit 40B. Turn right at end of ramp onto Main Ave. (Rt. 7N); hotel will be on the right.

                    <ul>
                        <li>Distance from Hotel: 52 mi. </li>
                        <li>Drive Time: 70 min.</li>
                    </ul>
                </p>

                <h1 class"head1">From Westchester County Airport</h1>
                <p class="par1">
                    Interstate 684 South to Interstate 287 East which will bring you to Merritt Parkway North. Follow Merritt North to exit 40B; turn right at the bottom of ramp onto Main Avenue (aka Rt. 7), hotels will be on the right.

                    <ul>
                        <li>Distance from Hotel: 25 mi.</li>
                        <li>Drive Time: 40 min. </li>
                    </ul>
	            </p>
			</div>
		</div>
    </body>
[: endblock :]