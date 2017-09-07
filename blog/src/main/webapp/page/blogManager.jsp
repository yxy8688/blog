<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>我的博客</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="css/blogManager.css">
</head>

<body id="blog-article-sidebar">
	<!-- header start -->
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
				<li><a href="personPage.jsp">我的文章</a></li>
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogManager.jsp" style="color: #10D07A;">文章管理</a></li>
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
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">

		<hr>
	</div>
	<div class="am-g am-g-fixed blog-fixed" style="margin-top: 2%;">
		<div class="easyui-layout"
			style="width: 100%; min-height: 400px; margin: 0px auto">
			<span style="margin-left: 100px;">类别： <select id="tag"
				style="width: 100px;">
					<option onclick="start()">全部</option>
			</select>
			</span> <span style="margin-left: 50px;"> 类型： <select id="type"
				style="width: 100px;">
					<option onclick="start()">全部</option>
			</select>
			</span>
			<span style="margin-left:50px;">
				文章标题：
				<input type="text" id="atitle">
				<button type="button" onclick="findArticleByAtitle()"> 查询 </button>
			</span>
			<table id="mytable" style="margin-top: 30px;">
				<thead>
					<tr>
						<th scope='col' abbr='编号' class='nobg' style="display: none;">编号</th>
						<th scope='col' abbr='标题'>文章标题</th>
						<th scope='col' abbr='时间'>创作时间</th>
						<th scope='col' abbr='浏览量'>浏览量</th>
						<th scope='col' abbr='评论数'>评论数</th>
						<th scope='col' abbr='操作'>操作</th>
					</tr>
				</thead>
				<tbody id="table_body">

				</tbody>
			</table>
			<ul class="am-pagination"
				style="width: 100%; text-align: center; margin-top: 30px;" id="myUI">
			</ul>
		</div>
	</div>


	<!-- content end -->
	<footer class="blog-footer" style="margin-top: 100px;">

		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/amazeui.min.js"></script>
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/blogManager.js"></script>
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
	
		//焦点事件
		$("#tag").focus(function() {
			$("#type").val("全部");
			$("#atitle").val("");
		});
		$("#type").focus(function() {
			$("#tag").val("全部");
			$("#atitle").val("");
		});
		$("#atitle").focus(function(){
			$("#tag").val("全部");
			$("#type").val("全部");
		});
	</script>

</body>
</html>