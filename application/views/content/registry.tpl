@ $this->inherit('layout/content');
[: block title :]
    <title id = 'title1'>Registry</title>
[: endblock :]
[: block body :]
    <body id="body1" onload = "drawNav2();">
        <div id="center_content">
            <canvas id="canvasNav"></canvas>
            <div id="scrollBoxCont">
	        	<div id="scrollBox">
	            	<table width="100%" class="table_reg">
	                	<tr>
			                <td width="50%" align="center">
				               	<a href="http://www1.macys.com/registry/wedding/guest/?registryId=2107045" target="_blank">
									<img src="/media/macys.jpg" border="none" alt="Macys.com"/>
								</a>
							</td>
							<td width="50%" align="center">
								<a href="http://www.potterybarn.com/registry/3335806/registry-list.html" target="_blank">
									<img src="/media/potterybarn.jpg" border="none" alt="PotteryBarn.com"/>
								</a>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<a href="https://secure.williams-sonoma.com/registry/njx76z78rc/registry-list.html" target="_blank">
									<img src="/media/williams-sonoma.png" border="none" alt="PotteryBarn.com"/>
								</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
    </body>
    <style>
    	.table_reg td{
    		text-align:center;
    	}
    </style>
[: endblock :]

