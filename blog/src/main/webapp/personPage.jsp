<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>个人主界面</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
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
				<li><a href="personPage.jsp" style="color: #10D07A;">我的文章</a></li>
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogManager.jsp">文章管理</a></li>
				<li><a href="page/blog_tag.jsp">类别管理</a></li>
				<li><a href="page/blogComment.jsp">评论管理</a></li>
				<li><a href="page/blogDrafets.jsp">草稿箱</a></li>
				<li><a href="page/personInfo.jsp">个人信息管理</a></li>
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
			<div id="personArticle"></div>
			<ul class="am-pagination"
				style="width: 100%; text-align: center; margin-top: 30px;" id="myUI"></ul>
		</div>

		<div class="am-u-md-4 am-u-sm-12 blog-sidebar">
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>About ME</span>
				</h2>
				<div id="userPersonInfo"></div>
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-text-center blog-title">
					<span>Contact ME</span>
				</h2>
				<p>
					<a href=""><span
						class="am-icon-qq am-icon-fw am-primary blog-icon"></span></a> <a
						href=""><span class="am-icon-github am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-reddit am-icon-fw blog-icon"></span></a>
					<a href=""><span class="am-icon-weixin am-icon-fw blog-icon"></span></a>
				</p>
			</div>
			<div class="blog-clear-margin blog-sidebar-widget blog-bor am-g ">
				<h2 class="blog-title">
					<span>TAG cloud</span>
				</h2>
				<div class="am-u-sm-12 blog-clear-padding">
					<a href="" class="blog-tag">amaze</a> <a href="" class="blog-tag">妹纸
						UI</a> <a href="" class="blog-tag">HTML5</a> <a href=""
						class="blog-tag">这是标签</a> <a href="" class="blog-tag">Impossible</a>
					<a href="" class="blog-tag">开源前端框架</a>
				</div>
			</div>
			<div class="blog-sidebar-widget blog-bor">
				<h2 class="blog-title">
					<span>么么哒</span>
				</h2>
				<ul class="am-list">
					<li><a href="#">每个人都有一个死角， 自己走不出来，别人也闯不进去。</a></li>
					<li><a href="#">我把最深沉的秘密放在那里。</a></li>
					<li><a href="#">你不懂我，我不怪你。</a></li>
					<li><a href="#">每个人都有一道伤口， 或深或浅，盖上布，以为不存在。</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/personPage.js"></script>
	<script type="text/javascript" src="js/commonUserInfo.js"></script>
	<script type="text/javascript" src="js/moreOperation.js"></script>
	<script type="text/javascript">
		var result = $("#top_img").attr("src");
		if(result == ""){
			$("#top_img").attr("src","images/not_pic.jpg");
		}
		 $.post("blog/professor",function(data){
			 var curr = "${loginUser.getUsid()}";
			 for(var i=0;i<data.length;i++){
				 if(data[i].usid == curr){
					 var ulStr ='<li><a href="page/blog_column.jsp">专栏管理</a></li>';
					 $("#top_ul").append(ulStr);
				 }
			 }
		 });
		
	</script>
</body>
</html>