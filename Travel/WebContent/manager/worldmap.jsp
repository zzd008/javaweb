<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Travels | 世界地图</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords" content="" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<link rel="stylesheet" href="css/bootstrap.min.css" >
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<link href="css/style-responsive.css" rel="stylesheet"/>
	<link href="css/jqvmap.css" media="screen" rel="stylesheet" type="text/css"/>
	<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/font.css" type="text/css"/>
	<link href="css/font-awesome.css" rel="stylesheet"> 
	<script src="js/jquery2.0.3.min.js"></script>
</head>
<body>
<section id="container">
<!--头部-->
<%@ include file="top.jsp" %>

<!--左侧栏-->
<%@ include file="aside.jsp" %>

<!--主页面-->
<section id="main-content">
	<section class="wrapper">
        <div class="row">
            <div class="col-sm-12 vec-wthree">
                <section class="panel">
                    <header class="panel-heading">
                       	 世界地图
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                    </header>
                    <div class="panel-body">
                        <div id="world-vmap" style="width:100%; height: 400px;"></div>
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
                <div class="col-sm-12 vec-wthree">
                    <section class="panel">
                        <header class="panel-heading">
                          	 欧洲
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="europe-vmap" style="width: 100%; height: 520px;"></div>
                        </div>
                    </section>
                </div>
            </div>
        <div class="row">
                <div class="col-sm-6 vec-wthree">
                    <section class="panel">
                        <header class="panel-heading">
                           	 亚洲
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="asia-vmap" style="width: 100%; height: 520px;"></div>
                        </div>
                    </section>
                </div>
                <div class="col-sm-6 vec-wthree">
                    <section class="panel">
                        <header class="panel-heading">
                            	澳大利亚
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-cog"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="australia-vmap" style="width: 100%; height: 520px;"></div>
                        </div>
                    </section>
                </div>
            </div>
</section>
<!-- 尾部 -->
	<div style="margin-top: 50px">
		<%@ include file="bottom.jsp" %>
	</div>
</section>
</section>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>
<script src="js/jquery.vmap.js"></script>
<script src="js/jquery.vmap.world.js"></script>
<script src="js/jquery.vmap.sampledata.js"></script>
<script src="js/jquery.vmap.europe.js"></script>
<script src="js/jquery.vmap.asia.js"></script>
<script src="js/jquery.vmap.australia.js"></script> 
<script>
    jQuery('#world-vmap').vectorMap({
        map: 'world_en',
        backgroundColor: null,
        color: '#ffffff',
        hoverOpacity: 0.7,
        selectedColor: '#666666',
        enableZoom: true,
        borderWidth:1,
        showTooltip: true,
        values: sample_data,
        scaleColors: ['#C8EEFF', '#006491'],
        normalizeFunction: 'polynomial'
    });
</script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#europe-vmap').vectorMap({
            map: 'europe_en',
            backgroundColor: null,
            color: '#ffffff',
            borderWidth:1,
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: false,
            showTooltip: false,
            values: sample_data,
            scaleColors: ['#C8EEFF', '#006491'],
            normalizeFunction: 'polynomial'
        });
    });
</script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#asia-vmap').vectorMap({
            map: 'asia_en',
            backgroundColor: null,
            color: '#ffffff',
            borderWidth:1,
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: false,
            showTooltip: false,
            values: sample_data,
            scaleColors: ['#C8EEFF', '#006491'],
            normalizeFunction: 'polynomial'
        });
    });
</script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        jQuery('#australia-vmap').vectorMap({
            map: 'australia_en',
            backgroundColor: null,
            color: '#ffffff',
            borderWidth:1,
            hoverOpacity: 0.7,
            selectedColor: '#666666',
            enableZoom: false,
            showTooltip: false,
            values: sample_data,
            scaleColors: ['#C8EEFF', '#006491'],
            normalizeFunction: 'polynomial'
        });
    });
</script>
</body>
</html>