@ $this->inherit('layout/content');
[: block title :]
    <title id = 'title1'>Hotels</title>
[: endblock :]
[: block body :]
    <body id="body1" onload = "drawNav2();">
        <div id="center_content">
            <canvas id="canvasNav"></canvas>
            <div id="scrollBoxCont">
                <div id="scrollBox">
                    <h1 class="head1">Hilton Garden Inn Norwalk</h1>
                    <p class="par1">
                        560 Main Ave.<br/>
                        Norwalk, CT, 06851<br/><br/>
                        For reservations, please call (203) 523-4000 and ask for the Hatem-Havrilesko Wedding room block (group code "HHWED") or book online via <a href="http://hiltongardeninn.hilton.com/en/gi/groups/personalized/O/ORQNWGI-HHWED-20140530/index.jhtml?WT.mc_id=POG" target="_blank">this website</a>.
                    </p>
                    <p class="par1">
                        Room rates include breakfast and the bulk of the rooms have been reserved at the Hilton.
                    </p>
                    <h1 class="head1">Courtyard Marriott Norwalk</h1>
                    <p class="par1">
                        474 Main Avenue<br/>
                        Norwalk, CT 06851-1037<br/><br/>
                        For reservations, please call (1-800) 321-2211 and request a room in the Hatem-Havrilesko Wedding room block.  Booking deadline is May 9, 2014 to secure the wedding room rate.
                    </p>
                    
                </div>
            </div>
        </div>
    </body>
[: endblock :]