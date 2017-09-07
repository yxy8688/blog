<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>标签文章</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">

<style type="text/css">
</style>
</head>

<body id="blog">
	<header class="am-g am-g-fixed blog-fixed blog-text-center blog-header">
		<div class="am-u-sm-8 am-u-sm-centered">
			<img width="200" src="assets/i/plot2.png" alt="Amaze UI Logo" />
			<h2 class="am-hide-sm-only"></h2>
		</div>
	</header>
	<hr>
	<nav class="am-g am-g-fixed blog-fixed blog-nav">
		<div class="am-collapse am-topbar-collapse" id="blog-collapse">
			<ul class="am-nav am-nav-pills am-topbar-nav" id="top_ul">
				<li><a href="homePage.jsp">首页</a></li>
				<li><a href="blogColumn.jsp">博客专栏</a></li>
				<li><a href="blogProfessor.jsp">博客专家</a></li>
				<li><a href="personPage.jsp">我的博客</a></li>
				<li><a href="personPage.jsp" style="color: #10D07A;">标签文章</a></li>
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
		</div>
	</nav>
	<hr>

	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed">
		<!-- 文章内容区 -->
		<div class="am-u-md-8 am-u-sm-12">
			<div id="tagArticle"></div>
			
		</div>
		<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>关于标签</span>
				</h2>
				<div id="taginfo"></div>
			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer" style="margin-top:200px;">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER
		</div>
		
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/personPage.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/homePage.js"></script>
	
	<script type="text/javascript" charset="utf-8">
		var result = $("#top_img").attr("src");
		if (result == "") {
			$("#top_img").attr("src", "images/not_pic.jpg");
		}
		function GetRQueryString(name) {
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
			var r = window.location.search.substring(1).match(reg);

			return r ? decodeURIComponent(r[2]) : null;
		}
		var tagname = GetRQueryString("tagname")

		$.post(
						"article/tagArticleDetail",{currPage:currPage,pageSize:pageSize,tagname:tagname},
						function(data) {
							//alert(JSON.stringify(data));
							var articleStr = "";
							for (var i = 0; i < data.length; i++) {
								articleStr += '<article class="am-g blog-entry-article">';
								articleStr += '<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">';
								if (data[i].apic != null) {
									articleStr += '<img src="'+data[i].apic+'" alt="" style="height:250px;" class="am-u-sm-12"></div>';
								} else {
									articleStr += '<img src="images/not_img1.png" alt="" style="height:250px;" class="am-u-sm-12"></div>';
								}
								articleStr += '<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">';
								articleStr += '<span>author:&nbsp;</span>';
								articleStr += '<span>@<a class="blog-color">'
										+ data[i].uname + '&nbsp;</a></span>';
								articleStr += '<span style="float:right;">'
										+ data[i].atime + '</span>';
								articleStr += '<h1><a onclick="articleDetail('
										+ data[i].aid + ')">' + data[i].atitle
										+ '</a></h1>';
								articleStr += '<div class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
										+ data[i].acontent + '</div>';
								articleStr += '<p><a class="blog-continue">continue reading</a></p>';
								articleStr += '<span class="viewnum f_r"><a style="padding-left:20px;" onclick="articleDetail('
										+ data[i].aid
										+ ')">浏览（'
										+ data[i].aviewnum + '）</a></span>';
								articleStr += '<span class="pingl f_r"><a style="padding-left:20px;" onclick="articleDetail('
										+ data[i].aid
										+ ')">评论（'
										+ data[i].commentnum
										+ '）</a></span></p>';
								articleStr += '</div></article>';
								$("#tagArticle").html(articleStr);
							}
						});

		$.get("tag/showTaginfo?tagname=" + tagname, function(data) {
			//alert(JSON.stringify(data));
			var tagInfoStr = "";
			tagInfoStr += '<p>标签名：' + data.tagname + '</p>';
			tagInfoStr += '<p>标签总文章数：' + data.articlenum + '</p>';
			$("#taginfo").html(tagInfoStr);
		}, 'json');
	</script>
</body>
</html>