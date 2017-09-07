<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>文章详情</title>
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
</head>

<body id="blog-article-sidebar">
	<!-- header start -->
	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
		<div class="am-u-sm-8 am-u-sm-centered">
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
		</div>
	</header>
	<!-- header end -->
	<hr>

	<!-- nav start -->
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<ul class="am-nav am-nav-pills am-topbar-nav">
			<li class="am-active"><a href="homePage.jsp" >首页</a></li>
			<li><a href="blogColumn.jsp">博客专栏</a></li>
			<li><a href="blogProfessor.jsp" style="color: #10D07A;">博客专家</a></li>
			<li><a href="personPage.jsp">我的博客</a></li>
		</ul>
		<!-- 菜单栏右部分 -->
		<div id="top_right" class="show_loginUser" style="float: right;">
			<img src="${loginUser.getUpic()}" id="top_img"
				style="float: left; width: 50px; height: 50px; border-radius: 50%; margin-right: 10px;">
			<div style="float: left; height: 100%; line-height: 50px;">
				欢迎 : <input type="text" id="loginUname" readonly="readonly"
					value="${loginUser.getUname()}" /> <select id="user_select"
					style="border: none;">
					<option disabled="disabled" selected="selected">&nbsp;&nbsp;更多</option>
					<option onclick="switch_user()">切换用户</option>
					<option onclick="login_out()">退出</option>
				</select>
			</div>
		</div>

	</nav>
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">
		<div class="am-u-sm-12">
			<!-- 文章详情 -->
			<div id="articleDetail">
				<article class="am-article blog-article-p" style="min-height: 300px;">
					<div class="am-article-hd">
						<h1 class="am-article-title blog-text-center">博客专家规则</h1>
						<br>
						<p class="am-article-meta blog-text-center">
						<div class="am-article-lead">
							<h2>博客专家条件</h2>
							<ol type="1">
								<li>该博主所发文章数大于10</li>
								<li>文章的浏览量大于20</li>
							</ol>
							<h2>博客专家福利：</h2>	
							<ol type="1">
								<li>允许添加专栏</li>
							</ol>
							
						</div>
				</article>
				

			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer" style="margin-top:200px;">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	<script type="text/javascript">
		var result = $("#top_img").attr("src");
		if(result == ""){
			$("#top_img").attr("src","images/not_pic.jpg");
		}

	</script>

</body>
</html>