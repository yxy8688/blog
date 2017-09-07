<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>草稿箱</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
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
				<li><a href="page/blogManager.jsp">文章管理</a></li>
				<li><a href="page/blog_tag.jsp">类别管理</a></li>
				<li><a href="page/blogComment.jsp">评论管理</a></li>
				<li><a href="page/blogDrafets.jsp" style="color: #10D07A;">草稿箱</a></li>
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
		<div class="am-g am-g-fixed blog-fixed" style="margin-top:2%;">
		<div class="easyui-layout" style="width: 100%; height: 300px; margin: 0px auto">
			<table id="mytable">
			<thead>
				 <tr>
				 	<th scope='col' abbr='编号' class='nobg' style="display:none;">编号</th><!--  style="display:none;" -->
				 	<th scope='col' abbr='标题'>文章标题</th>
				 	<th scope='col' abbr='时间'>创作时间</th>
				 	<th scope='col' abbr='操作'>操作</th>
				 </tr>
			 </thead>
			 <tbody id="table_body">
			 	
			 </tbody>
			</table>
		</div>
	</div>


	<!-- content end -->
	<footer class="blog-footer" style="margin-top: 200px;">

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
		 $.post("blog/professor",function(data){
			 var curr = "${loginUser.getUsid()}";
			 for(var i=0;i<data.length;i++){
				 if(data[i].usid == curr){
					 var ulStr ='<li><a href="page/blog_column.jsp">专栏管理</a></li>';
					 $("#top_ul").append(ulStr);
				 }
			 }
		 });

		$.post("drafets/findDrafetsByUsid",function(data){
			var tableStr ;
			if(data ==""){
				tableStr +="<tr><td colspan='4' style='text-align:center;'>暂无草稿</td></tr>";
			}else{
				for(var i=0;i<data.length;i++){
					tableStr += "<tr><th class='specalt'  style='display:none;'>"+data[i].drid+"</th>";/*  style='display:none;' */
					tableStr += "<td class='alt'>"+data[i].drtitle+"</td>";
					tableStr += "<td class='alt'>"+data[i].drtime+"</td>";
					tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].drid+")'>编辑</a>";
					tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='publishrow("+data[i].drid+")'>立即发表</a>";
					tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].drid+")'>删除</a></th>";
				}
			}
			$("#table_body").html(tableStr);
		});
		
		/* 编辑 */
		function editrow(index){
			window.location.href="page/blog_add.jsp?drid="+index;
		}
		/* 删除 */
		function deleterow(index){
			$.post("drafets/deleteDrafets",{drid:index},function(data){
				if(data){
					$.messager.alert("操作提示","删除成功!","info",function(){
						location.reload();
					});
				}else{
					$.messager.alert("操作提示","删除失败!","error",function(){
						location.reload();
					});
				}
				
			});
		}
		/* 立即发表 */
		function publishrow(index){
			$.post("drafets/publishArticle",{drid:index},function(data){
				if(data > 0){
					$.messager.alert("操作提示","发表成功...","info",function(){
						$.post("drafets/deleteDrafets",{drid:index},function(mess){
							if(mess){
								location.reload();
							}
						});
					});
				}else{
					$.messager.alert("操作提示","发表失败!","error",function(){
						location.href="page/blogDrafets.jsp";
					});
				}
				
			});
		}

	</script>
	
</body>
</html>