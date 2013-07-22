@ $this->inherit('layout/content');
[: block title :]
    <title id = 'title1'>Travel</title>
[: endblock :]
[: block body :]
    <body id="body1" onload = "drawNav2();">
        <div id="center_content">
            <canvas id="canvasNav"></canvas>
        </div>
    </body>
[: endblock :]