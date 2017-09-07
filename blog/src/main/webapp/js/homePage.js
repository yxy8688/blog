var currPage = 1;
var pageSize = 6;
var totalPage;
var currUser = $("#user_usid").val();
var navStr = '';

if (currUser == "") {
	navStr += '<ul class="nav_right">';
	navStr += '<li><a href="register.jsp">注册 </a></li>';
	navStr += '<li>|</li>';
	navStr += '<li><a href="login.jsp"> 登录 </a></li></ul>';
	$("#top_right").html(navStr);
} else {
	navStr += '<div style="float:right;height:100%;line-height: 50px;">';
	navStr += '<span style="color: #10D07A;">已登录</span>';
	navStr += '<select id="user_select" style="border: none;">';
	navStr += '<option disabled="disabled" selected="selected">&nbsp;&nbsp;更多</option>';
	navStr += '<option onclick="switch_user()">切换用户</option>';
	navStr += '<option onclick="login_out()">退出</option>';
	navStr += '</select></div>';
	$("#top_right").html(navStr);
}

pageHotArticle(); // 页面初始化

function pageHotArticle() {
	$
			.get(
					"article/findByHot",
					{
						currPage : currPage,
						pageSize : pageSize
					},
					function(data) {
						var articleStr = '';
						for (var i = 0; i < data.length; i++) {
							articleStr += '<div class="blogs">';
							if (data[i].apic != null) {
								articleStr += '<figure><img src="'
										+ data[i].apic + '"></figure>';
							} else {
								articleStr += '<figure><img src="images/not_img1.png"></figure>';
							}
							articleStr += '<ul><h3><a onclick="articleDetail('
									+ data[i].aid + ')">' + data[i].atitle
									+ '</a></h3>';
							articleStr += '<div id="con_text" class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
									+ data[i].acontent + '</div>';
							articleStr += '<p class="autor"><span class="lm f_l"><a onclick="userDetail('
									+ data[i].usid
									+ ')">'
									+ data[i].uname
									+ '</a></span>';
							articleStr += '<span class="dtime f_l">'
									+ data[i].atime + '</span>';
							articleStr += '<span class="viewnum f_r"><a onclick="articleDetail('
									+ data[i].aid
									+ ')">浏览（'
									+ data[i].aviewnum
									+ '）</a></span>';
							articleStr += '<span class="pingl f_r"><a onclick="articleDetail('
									+ data[i].aid
									+ ')">评论（'
									+ data[i].commentnum + '）</a></span></p>';
							articleStr += '</ul></div>';
						}
						$("#content").html(articleStr);
					}, "json");

}
function moreArticle() {

	$
			.get(
					"article/findArticle",
					{
						currPage : currPage,
						pageSize : pageSize
					},
					function(data) {
						var articleStr = '';
						for (var i = 0; i < data.length; i++) {
							articleStr += '<div class="blogs">';
							if (data[i].apic != null) {
								articleStr += '<figure><img src="'
										+ data[i].apic + '"></figure>';
							} else {
								articleStr += '<figure><img src="images/not_img1.png"></figure>';
							}
							articleStr += '<ul><h3><a onclick="articleDetail('
									+ data[i].aid + ')">' + data[i].atitle
									+ '</a></h3>';
							articleStr += '<div id="con_text" class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
									+ data[i].acontent + '</div>';
							articleStr += '<p class="autor"><span class="lm f_l"><a onclick="userDetail('
									+ data[i].usid
									+ ')">'
									+ data[i].uname
									+ '</a></span>';
							articleStr += '<span class="dtime f_l">'
									+ data[i].atime + '</span>';
							articleStr += '<span class="viewnum f_r"><a onclick="articleDetail('
									+ data[i].aid
									+ ')">浏览（'
									+ data[i].aviewnum
									+ '）</a></span>';
							articleStr += '<span class="pingl f_r"><a onclick="articleDetail('
									+ data[i].aid
									+ ')">评论（'
									+ data[i].commentnum + '）</a></span></p>';
							articleStr += '</ul></div>';
						}
						$("#content").html(articleStr);
					}, "json");

}

function loadMoreArticle() {
	pageSize = 10;
	$("#content").html("");
	moreArticle();

	$("#loadMore").css("display","none");
	
	$.post("article/articleTotal",function(data){
		 var ulStr = "";
		 ulStr +="<li ><a onclick='prePage()'>&laquo;上一页</a></li>";
		 ulStr +="<li ><a onclick='firstPage()'>首页</a></li>";
		 ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
		 ulStr +="<li><a>共:"+data.total+"条</a></li>";
		 ulStr +="<li ><a onclick='lastPage()'>尾页</a></li>";
		 ulStr +="<li ><a onclick='nextPage()'>下一页 &raquo;</a></li>";
		 totalPage = data.totalPage;
		 $("#myUI").html(ulStr);
	 });

}

/* 下一页 */
function nextPage() {
	if (currPage == totalPage) {
		currPage = currPage;
	} else {
		currPage += 1;
		loadMoreArticle();

	}
}
/* 上一页 */
function prePage() {
	if (currPage == 1) {
		currPage = currPage;
	} else {
		currPage -= 1;
		loadMoreArticle();
	}
}
/* 首页 */
function firstPage() {
	currPage = 1;
	loadMoreArticle();
}
/* 尾页 */
function lastPage() {
	currPage = totalPage;
	loadMoreArticle();
}

// 文章详情
function articleDetail(index) {
	if ($("#user_usid").val() == "") {

		$.messager.confirm('操作提示', '你尚未登陆，请先登录!', function(r) {
			if (r) {
				location.href = "login.jsp";
			}
		});
	} else {
		$.post("article/updateAviewNum", {
			aid : index
		}, function(data) {
			location.href = "article.jsp?aid=" + index;
		});
	}
}
// 用户详情
function userDetail(index) {
	if ($("#user_usid").val() == "") {
		$.messager.confirm("操作提示", "你尚未登陆，请先登录!", function(data) {
			if (data) {
				alert(12);
				location.href = "login.jsp";
			}
		});
	} else {
		if (index != null) {
			location.href = "userDetail.jsp?usid=" + index;
		}
	}
}

function check_login() {
	if ($("#user_usid").val() == "") {
		$.messager.alert("操作提示", "你尚未登陆，请先登录!", "info", function() {
			location.href = "login.jsp";
		});
	} else {
		location.href = "personPage.jsp";
	}
}
function check_login2() {
	if ($("#user_usid").val() == "") {
		$.messager.alert("操作提示", "你尚未登陆，请先登录!", "info", function() {
			location.href = "login.jsp";
		});
	} else {
		location.href = "blogProfessor.jsp";
	}
}

function check_login3() {
	if ($("#user_usid").val() == "") {
		$.messager.alert("操作提示", "你尚未登陆，请先登录!", "info", function() {
			location.href = "login.jsp";
		});
	} else {
		location.href = "blogColumn.jsp";
	}
}
// 异步加载标签信息
$.post("tag/list", function(data) {
	for (var i = 0; i < data.length; i++) {
		
		if ($("#user_usid").val() == "") {
			$("#tag").append("<li><a><b>" + data[i].tagname + "</b></a></li>");
			$("#tag a").click(function(){
				$.messager.alert("操作提示", "你尚未登陆，请先登录!", "info", function() {
					location.href = "login.jsp";
				});
			});
		} else {
			$("#tag").append(
					"<li><a href='tagArticleDetail.jsp?tagname=" + data[i].tagname+"'><b>" + data[i].tagname + "</b></a></li>");
		}
	}
}, "json");

// 异步加载排行文章
$.get("article/findByHot", {
	currPage : 1,
	pageSize : 6
}, function(data) {
	var articleHot = "";
	for (var i = 0; i < data.length; i++) {
		$("#listArticleByHot").append(
				"<li><a onclick='articleDetail(" + data[i].aid + ")'><b>"
						+ data[i].atitle + "</b></a></li>");
	}
}, "json");

// 异步加载最新文章
$.get("article/findArticle", {
	currPage : 1,
	pageSize : 6
}, function(data) {
	var articleNew = "";
	for (var i = 0; i < data.length; i++) {
		$("#listArticleByNew").append(
				"<li><a onclick='articleDetail(" + data[i].aid + ")'><b>"
						+ data[i].atitle + "</b></a></li>");
	}
}, "json");
