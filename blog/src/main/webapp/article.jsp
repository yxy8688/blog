<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<base href="${deployName}">
<title>文章详情</title>
<link rel="icon" type="image/png" href="assets/i/favicon.png">
<link rel="stylesheet" href="assets/css/amazeui.min.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
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
		
	</nav>
	<!-- nav end -->
	<hr>
	<!-- content srart -->
	<div class="am-g am-g-fixed blog-fixed blog-content">
		<div class="am-u-sm-12">
		 	 <!-- 文章详情 -->
			<div  id="articleDetail"></div>

			<div class="am-g blog-article-widget blog-article-margin">
				<div
					class="am-u-lg-4 am-u-md-5 am-u-sm-7 am-u-sm-centered blog-text-center">
					<span class="am-icon-tags"> &nbsp;</span>标签：<a id="tag"></a>
					<hr>
					<div id="share">
						
					</div>
				
				</div>
			</div>

			<hr>
			<!--  查看评论-->
				<h3 class="blog-comment">查看评论</h3>
			<div id="commentDetail"><!-- 评论显示 -->
			</div>
			<ul class="am-pagination" style="width:100%;text-align: center;margin-top:30px;" id="myUI">
			</ul>
			<hr>

			<div class="am-form am-g">
				<h3 class="blog-comment">发表评论</h3>
				<fieldset  class="easyui-layout">
					<div class="am-form-group">
						<textarea rows="5" placeholder="添加评论" name="ccontent" id="ccontent"></textarea>
					</div>
					<p>
						<button type="button" class="am-btn am-btn-default" onclick="addComment()">发表评论</button>
					</p>
				</fieldset>
			</div>
			<hr>
		</div>
	</div>
	<!-- content end -->
	<footer class="blog-footer">

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
	/**
	 * 文章的详情
	 */
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
	 
	var aid = "<%=request.getParameter("aid")%>";
	var currPage = 1;
	var pageSize = 5;
	var totalPage;
	if(aid != "null"){
		$.post("article/findArticleByAid",{aid:aid},function(data){
			var articleStr ='' ;
			var acontent= data.acontent.replace(/<[^>]+>/g,"");
			
			articleStr +='<article class="am-article blog-article-p"><div class="am-article-hd">';
			articleStr +='<h1 class="am-article-title blog-text-center">'+data.atitle+'</h1>';
			articleStr +='<p class="am-article-meta blog-text-center">';
			articleStr +='<span><a>author &nbsp;</a></span>@： <span><a class="blog-color">'+data.uname+'&nbsp;</a></span>';
			articleStr +='<span style="margin-left:10px;"><a>'+data.atime+'</a></span></p></div>';
			articleStr +='<div class="am-article-lead">';
			articleStr +=data.atitle+'／'+data.uname+'<br> <br>';
			articleStr +=data.acontent;
			articleStr +='</div></article>';
			$("#tag").html(data.tagname);
			$("#articleDetail").html(articleStr);
			var shareStr = '<a href="http://v.t.sina.com.cn/share/share.php?title='+acontent+'&loginRnd=1493023777628#_loginLayer_1493023844015"><span class="am-icon-weibo am-icon-fw blog-icon"></span></a>'
			$("#share").html(shareStr);
		});

		viewComment();
		listNum();

	} 

	//查看评论
	function viewComment(){
		$.get("comment/findCommentByCaid",{caid:aid,currPage:currPage,pageSize:pageSize},function(data){
			var commentDetail = '';
			if(data != ""){
				for(var i=0;i<data.length;i++){
					commentDetail += '<div style="background:#E4E4E4;width:100%;padding:10px;">';
					commentDetail += '<span>'+data[i].rn+'&nbsp;楼</span>';
					commentDetail += '<span style="margin: 0 10px;color:#C88326;">@<a>'+data[i].uname+'</a></span>';
					commentDetail += '<span>'+data[i].ctime+'</span></div>';
					commentDetail += '<div style="width:100%;padding:10px;">';
					commentDetail += '<img alt="" src="'+data[i].upic+'" style="height:35px;width:50px;margin-left:10px;">';
					commentDetail += '<span style="margin-left:20px;">'+data[i].ccontent+'</span></div>';
				}
			}else{
				commentDetail += '<div style="background:#E4E4E4;width:100%;padding:10px 20px;">暂无评论...</div>';
			}
			$("#commentDetail").html(commentDetail);
			
		});
	}
	
	//获取总数
	function listNum(){
		$.post("comment/listNum",{caid:aid},function(data){
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

	function addComment(){
		var ccontent = $("#ccontent").val();
		ccontent=htmlEncodeJQ(ccontent);
		if(aid != 'null'){
			$.get("comment/addComment",{caid:aid,ccontent:ccontent},function(data){
				if(data){
					$.messager.alert("操作提示","发表成功！","info",function(){
						window.location.reload();
						$("#ccontent").val("");
					});
				}else{
					$.messager.alert("操作提示","发表失败","error");
				}
			});
		}
	}
	/* 下一页 */
	function nextPage(){
		if(currPage == totalPage){
			currPage = currPage;
		}else{
			currPage += 1;
			viewComment();
			listNum();

		}
	}
	/* 上一页 */
	function prePage(){
		if(currPage == 1){
			currPage = currPage;
		}else{
			currPage -= 1;
			viewComment();
			listNum();
		}
	}
	/* 首页 */
	function firstPage(){
		currPage = 1;
		viewComment();
		listNum();
	}
	/* 尾页 */
	function lastPage(){
		currPage = totalPage;
		viewComment();
		listNum();
	}
	
	function htmlEncodeJQ ( str ) {
		return $('<span/>').text( str ).html();
	}
		 
	function htmlDecodeJQ ( str ) {
	  	return $('<span/>').html( str ).text();
	}
	</script>
</body>
</html>