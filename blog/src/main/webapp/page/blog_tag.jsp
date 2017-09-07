<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>类别管理</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" href="css/personInfo.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">

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
				<li><a href="personPage.jsp">我的文章</a></li>
				<li><a href="page/blog_add.jsp">写新文章</a></li>
				<li><a href="page/blogManager.jsp">文章管理</a></li>
				<li><a href="page/blog_tag.jsp" style="color: #10D07A;">类别管理</a></li>
				<li><a href="page/blogComment.jsp">评论管理</a></li>
				<li><a href="page/blogDrafets.jsp">草稿箱</a></li>
				<li><a href="page/personInfo.jsp" >个人信息管理</a></li>
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
	<div class="am-g am-g-fixed blog-fixed" style="margin-top:2%;">
		<div class="easyui-layout" style="width: 100%; min-height:200px;max-height:350px; margin: 0px auto">
			<hr>
				<span id="con_top" style="font-size: 18px;margin-left: 30px;letter-spacing: 3px;color: navy;">类别管理</span>
			<hr>
			<br/>
			<div id="table_content" >
			</div>
		</div>
		<input type="text" id="add_tag" name="tagname" style="margin-top:30px;width:30%;border-radius:6px;	">
		<button type="button" id="button_add" style="margin-top:30px;margin-left:10px;border-radius:3px;color:blue;" onclick="tag_add()">添加类别</button>
	</div>
	
			
	<!-- content end -->
	<footer class="blog-footer" style="margin-top:200px;">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>
 	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script> 
	<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/blog_tag.js"></script>
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