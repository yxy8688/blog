<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<base href="${deployName}">
<meta charset="utf-8">
<title>评论管理</title>
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" type="text/css" href="css/blogManager.css">
<link rel="stylesheet" type="text/css" href="css/blogComment.css">
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
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
				<li><a href="page/blog_tag.jsp">类别管理</a></li>
				<li><a href="page/blogComment.jsp" style="color: #10D07A;">评论管理</a></li>
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

	<div id="content" class="am-g am-g-fixed blog-fixed blog-nav"
		style="margin-top: 50px;">
		<div id="content_top" >
			<p>评论管理</p>
		</div>
		<div id="content_body">
			<div id="content_left">
				<ul style="padding-top: 40px;">
					<li><a onclick="myArticleComment()">我文章的评论</a></li>
					<li><a onclick="sendComment()">我发表的评论</a></li>
				</ul>
			</div>

			<div id="content_right">
				<table id="mytable" style="margin:50px;width:95%;">
					<thead>
						<tr>
							<th scope='col' abbr='标题' style="text-align: left;">文章标题</th>
							<th scope='col' abbr='作者'>作者</th>
							<th scope='col' abbr='时间'>创作时间</th>
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

	</div>

	<!-- content end -->
	<footer class="blog-footer">
		<div class="blog-text-center">© 2015 AllMobilize, Inc. Licensed
			under MIT license. Made with love By LWXYFER</div>
	</footer>

	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
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

		var currPage = 1;
		var pageSize = 6;
		var totalPage;
		
		/* 页面初始化 */
		$(function(){
			myArticleComment();
		});
		
		/* 我文章的评论findComment */
		function myArticleComment(){
			findComment();
			findNum();
		}
		/* 用户所发的文章的评论总和 */
		function findComment(){
			$.post("comment/findComment",{currPage:currPage,pageSize:pageSize},function(data){
				var tableStr;
				if(data ==""){
					tableStr +="<tr><td colspan='4' style='text-align:center;border:none;'>暂无文章或尚未有评论</td></tr>";
				}else{
					for(var i=0;i<data.length;i++){
						tableStr += "<tr><td class='alt' style='text-align: left;border:none;'>"+
							"<b style='color:red;margin-right:10px;'>RE :</b><a onclick='findArticle("+data[i].caid+")'>"+data[i].atitle+"</a></td>";
						tableStr += "<td class='alt' style='border:none;'><a onclick='userDetail("+data[i].usid+")'>@ :"+data[i].uname+"</td>";
						tableStr += "<td class='alt' style='border:none;'>"+data[i].ctime+"</td>";
						tableStr += "<td class='alt' style='border:none;'><a style='margin-right:10px; font-size:15px;' onclick='deleteComment2("+data[i].cid+")'>删除</a></th></tr>";
						tableStr += "<tr><td colspan='4' style='text-align:left;border:none;'>"+data[i].ccontent+"</td><tr>";
					}
				}
				$("#table_body").html(tableStr);
			});
			
		}
		/* 用户所发的文章的评论数 */
		function findNum(){
			$.post("comment/findNum",{pageSize:pageSize},function(data){
				var ulStr = "";
				ulStr +="<li ><a onclick='prePage2()'>&laquo; 上一页</a></li>";
				ulStr +="<li ><a onclick='firstPage2()'>首页</a></li>";
				ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
				ulStr +="<li><a>共:"+data.total+"条</a></li>";
				ulStr +="<li ><a onclick='lastPage2()'>尾页</a></li>";
				ulStr +="<li ><a onclick='nextPage2()'>下一页 &raquo;</a></li>";
				totalPage = data.totalPage;
				$("#myUI").html(ulStr);
			});
		}
		/* 我所发的文章 的分页操作 */
		/* 下一页 */
		function nextPage2(){
			if(currPage == totalPage){
				currPage = currPage;
			}else{
				currPage += 1;
				findComment();
				findNum();

			}
		}
		/* 上一页 */
		function prePage2(){
			if(currPage == 1){
				currPage = currPage;
			}else{
				currPage -= 1;
				findComment();
				findNum();
			}
		}
		/* 首页 */
		function firstPage2(){
			currPage = 1;
			findComment();
			findNum();
		}
		/* 尾页 */
		function lastPage2(){
			currPage = totalPage;
			findComment();
			findNum();
		}
		/* 删除评论 */
		function deleteComment2(index){
			$.post("comment/delete",{cid:index},function(data){
				if(data > 0){
					$.messager.alert("操作提示","删除成功!","info",function(){
						myArticleComment();
					});
				}else{
					$.messager.alert("操作提示","删除失败!","error");
				}
			});
		}
		/* ----------------------------------------------------- */
		
		/* 显示我所发的评论 */
		function sendComment(){
			listMyComment();
			listNum();
		}
		function listMyComment(){
			$.post("comment/findCommentByUsid",{currPage:currPage,pageSize:pageSize},function(data){
				var tableStr;
				for(var i=0;i<data.length;i++){
					tableStr += "<tr><td class='alt' style='text-align: left;border:none;'>"+
						"<b style='color:red;margin-right:10px;'>RE :</b><a onclick='findArticle("+data[i].caid+")'>"+data[i].atitle+"</a></td>";
					tableStr += "<td class='alt' style='border:none;'>@ :"+data[i].uname+"</td>";
					tableStr += "<td class='alt' style='border:none;'>"+data[i].ctime+"</td>";
					tableStr += "<td class='alt' style='border:none;'><a style='margin-right:10px; font-size:15px;' onclick='deleteComment("+data[i].cid+")'>删除</a></th></tr>";
					tableStr += "<tr><td colspan='4' style='text-align:left;border:none;'>"+data[i].ccontent+"</td><tr>";
				}
				$("#table_body").html(tableStr);
			});
		}
		function listNum(){
			$.post("comment/findNumByUsid",{pageSize:pageSize},function(data){
				var ulStr = "";
				ulStr +="<li ><a onclick='prePage()'>&laquo; 上一页</a></li>";
				ulStr +="<li ><a onclick='firstPage()'>首页</a></li>";
				ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
				ulStr +="<li><a>共:"+data.total+"条</a></li>";
				ulStr +="<li ><a onclick='lastPage()'>尾页</a></li>";
				ulStr +="<li ><a onclick='nextPage()'>下一页 &raquo;</a></li>";
				totalPage = data.totalPage;
				$("#myUI").html(ulStr);
			});
		}
		/* 删除评论 */
		function deleteComment(index){
			$.post("comment/delete",{cid:index},function(data){
				if(data > 0){
					$.messager.alert("操作提示","删除成功!","info",function(){
						listMyComment();
					});
				}else{
					$.messager.alert("操作提示","删除失败!","error");
				}
			});
		}
		/* 下一页 */
		function nextPage(){
			if(currPage == totalPage){
				currPage = currPage;
			}else{
				currPage += 1;
				listMyComment();
				listNum();

			}
		}
		/* 上一页 */
		function prePage(){
			if(currPage == 1){
				currPage = currPage;
			}else{
				currPage -= 1;
				listMyComment();
				listNum();
			}
		}
		/* 首页 */
		function firstPage(){
			currPage = 1;
			listMyComment();
			listNum();
		}
		/* 尾页 */
		function lastPage(){
			currPage = totalPage;
			listMyComment();
			listNum();
		}
		/* 查看文章信息 */
		function findArticle(index){
			$.post("article/updateAviewNum",{aid:index},function(data){
				location.href="article.jsp?aid="+index;
			});  
		}
		//用户详情
		 function userDetail(index){
		 	location.href="userDetail.jsp?usid="+index;
		 }
		
	</script>
</body>
</html>