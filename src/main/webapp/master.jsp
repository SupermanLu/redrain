<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Baxster Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/back.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<link rel="icon" href="favicon.ico" type="image/x-icon">
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- bootstrap table css -->
<link href="css/bootstrap-table.css" rel='stylesheet' type='text/css' />


<!-- js-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/ajaxfileupload.js"></script>
<script src="js/modernizr.custom.js"></script>
<script>
	$(function(){
		if('<%=request.getSession().getAttribute("userid") == null
 					? ""
 					: request.getSession().getAttribute("userid")%>'==""){ 
 			window.location.href="login.jsp";
 		}
 	});
	function loginout()
	{
		$.ajax({
			url:"<%=request.getContextPath()%>/user/loginout",
	　　　　　　type:"GET",
	　　　　　　data:{},
	　　　　　　contentType:"application/json",
	　　　　　　success:function(res){
				if(res.status=='success'){
					alert('注销成功');
					window.location.href="login.jsp";
				}
				else{
					alert(res.msg);
				}
	　　　　　　}
		});
	}
</script>


<!-- Metis Menu -->
<script src="js/metisMenu.min.js"></script>
<script src="js/custom.js"></script>
<link href="css/custom.css" rel="stylesheet">
<!--//Metis Menu -->

<!-- Bootstrap Core JavaScript -->

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap-table.js"></script>

<script type="text/javascript" src="js/bootstrap-table-zh-CN.js"></script>
</head>
<body class="cbp-spmenu-push">
	<div class="main-content">
		<!--left-fixed -navigation-->
		<div class="sidebar" role="navigation">
			<div class="navbar-collapse">
				<nav
					class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right dev-page-sidebar mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar"
					id="cbp-spmenu-s1">
				<div class="scrollbar scrollbar1">
					<ul class="nav" id="side-menu">
						<li><a href="#"><i class="fa fa-cogs nav_icon" ></i>系统设置
								<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li><a href="master.jsp?page=changepassword.jsp">修改密码</a>
								</li>
								<li><a href="master.jsp?page=setting.jsp">基本设置</a>
								</li>
							</ul> <!-- /nav-second-level --></li>
						<li id="houseownerinfo"><a href="#"><i
								class="fa fa-book nav_icon"></i>用户管理 <span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li><a href="master.jsp?page=importuser.jsp">导入用户</a></li>
								<li><a href="master.jsp?page=adduser.jsp">添加用户</a></li>
								<li><a href="master.jsp?page=userlist.jsp">用户列表</a></li>
							</ul> <!-- /nav-second-level --></li>
						<li><a href="#"><i class="fa fa-th-large nav_icon"></i>抽奖记录
								<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li><a href="master.jsp?page=gainlist.jsp">抽奖记录</a></li>
							</ul></li>
							
							<li><a href="#"><i class="fa fa-check-square-o nav_icon"></i>活动规则编辑<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level collapse">
								<li><a href="master.jsp?page=ruleofgame1.jsp">活动详情</a></li>
								<!--<li><a href="master.jsp?page=ruleofgame2.jsp">活动说明</a></li>  -->
								<li><a href="master.jsp?page=ruleofgame3.jsp">活动公告</a></li>
								<li><a href="master.jsp?page=lblist.jsp">轮播列表</a></li>
							</ul> <!-- //nav-second-level --></li>
						

					</ul>
				</div>
				<!-- //sidebar-collapse --> </nav>
			</div>
		</div>
		<!--left-fixed -navigation-->
		<!-- header-starts -->
		<div class="sticky-header header-section ">
			<div class="header-left">
				<!--logo -->
				<div class="logo">
					<a href="index.html">
						<ul>

							<li><h1>红包后台管理系统</h1></li>
							<div class="clearfix"></div>
						</ul>
					</a>
				</div>
				<!--//logo-->



				<div class="clearfix"></div>
			</div>
			<!--search-box-->

			<!--//end-search-box-->
			<div class="header-right">

				<!--notification menu end -->
				<div class="profile_details">
					<ul style="margin-top: 10px;">
						<li class="dropdown profile_details_drop"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"
							aria-expanded="false">
								<div class="profile_img">
									<span class="prfil-img"><%=request.getSession().getAttribute("name") == null
					? ""
					: request.getSession().getAttribute("name")%>
									</span>
									<div class="clearfix"></div>
								</div>
						</a>
							<ul class="dropdown-menu drp-mnu">
								<li><a href="javascript:loginout();"><i
										class="fa fa-sign-out"></i> 退出登录</a></li>
							</ul></li>
					</ul>
				</div>
				<!--toggle button start-->
				<button id="showLeftPush">
					<i class="fa fa-bars"></i>
				</button>
				<!--toggle button end-->
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- //header-ends -->
		<!-- main content start-->
		<div id="page-wrapper">
			<div class="main-page">
				<jsp:include page="<%=request.getParameter(\"page\")%>" />

			</div>
		</div>
		<!--footer-->
		<div class="dev-page">

			<!-- page footer -->
			<!-- dev-page-footer-closed dev-page-footer-fixed -->
			
			<!-- /page footer -->
		</div>
		<!--//footer-->
	</div>
	<!-- Classie -->
	<script src="js/classie.js"></script>
	<script>
			var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
				showLeftPush = document.getElementById( 'showLeftPush' ),
				body = document.body;
				
			showLeftPush.onclick = function() {
				classie.toggle( this, 'active' );
				classie.toggle( body, 'cbp-spmenu-push-toright' );
				classie.toggle( menuLeft, 'cbp-spmenu-open' );
				disableOther( 'showLeftPush' );
			};
			

			function disableOther( button ) {
				if( button !== 'showLeftPush' ) {
					classie.toggle( showLeftPush, 'disabled' );
				}
			}
		</script>

	<script type="text/javascript" src="js/dev-loaders.js"></script>
	<script type="text/javascript" src="js/dev-layout-default.js"></script>
	<script type="text/javascript" src="js/jquery.marquee.js"></script>
	<link href="css/bootstrap.min.css" rel="stylesheet">

	<!-- candlestick -->
	<script type="text/javascript" src="js/jquery.jqcandlestick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jqcandlestick.css" />
	<!-- //candlestick -->

	<!--max-plugin-->
	<script type="text/javascript" src="js/plugins.js"></script>
	<!--//max-plugin-->

	<!--scrolling js-->
	<script src="js/jquery.nicescroll.js"></script>
	<script src="js/scripts.js"></script>
	<!--//scrolling js-->



</body>
</html>