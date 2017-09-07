
var currPage = 1;
var pageSize = 5;
var totalPage;

$(function(){
	listById();
	listNum();
});

function listById(){ 
	$.post("article/listById",{currPage:currPage,pageSize:pageSize},function(data){
		var articleStr = "";
		for (var i = 0; i < data.length; i++){
			articleStr +='<article class="am-g blog-entry-article">';
			articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-img">';
			if(data[i].apic != null){
				articleStr +='<img src="'+data[i].apic+'" alt="" style="height:250px;" class="am-u-sm-12"></div>';
			}else{
				articleStr +='<img src="images/not_img1.png" alt="" style="height:250px;" class="am-u-sm-12"></div>';
			}
			articleStr +='<div class="am-u-lg-6 am-u-md-12 am-u-sm-12 blog-entry-text">';
			articleStr +='<span>author:&nbsp;</span>';
			articleStr +='<span>@<a class="blog-color">'+data[i].uname+'&nbsp;</a></span>';
			articleStr +='<span style="float:right;">'+data[i].atime+'</span>';
			articleStr +='<h1><a onclick="articleDetail('+data[i].aid+')">'+data[i].atitle+'</a></h1>';
			articleStr +='<div class="con_text">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data[i].acontent+'</div>';
			articleStr +='<p><a class="blog-continue">continue reading</a></p>';
			articleStr +='<span class="viewnum f_r"><a style="padding-left:20px;" onclick="articleDetail('+data[i].aid+')">浏览（'+data[i].aviewnum+'）</a></span>';
			articleStr +='<span class="pingl f_r"><a style="padding-left:20px;" onclick="articleDetail('+data[i].aid+')">评论（'+data[i].commentnum+'）</a></span></p>';
			articleStr +='</div></article>';
		}
		$("#personArticle").html(articleStr);
	},"json");
}

function listNum(){
	$.post("article/listNum",{pageSize:pageSize},function(data){
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

/* 下一页 */
function nextPage(){
	if(currPage == totalPage){
		currPage = currPage;
	}else{
		currPage += 1;
		listById();
		listNum();

	}
}
/* 上一页 */
function prePage(){
	if(currPage == 1){
		currPage = currPage;
	}else{
		currPage -= 1;
		listById();
		listNum();
	}
}
/* 首页 */
function firstPage(){
	currPage = 1;
	listById();
	listNum();
}
/* 尾页 */
function lastPage(){
	currPage = totalPage;
	listById();
	listNum();
}

//文章详情
function articleDetail(index){
	$.post("article/updateAviewNum",{aid:index},function(data){
		location.href="article.jsp?aid="+index;
	});
}
