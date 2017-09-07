/**
 * 类别管理
 */
var currPage = 1;
var pageSize = 8;
var totalPage;

$(function(){
	start();
});

function start(){
	listById();
	listNum();
}

function listById(){ 
	$.post("article/listById",{currPage:currPage,pageSize:pageSize},function(data){
		var tableStr ;
		if(data == ""){
			tableStr +="<tr><td colspan='5' style='text-align:center;'>暂无文章</td></tr>";
		}else{
			for(var i=0;i<data.length;i++){
				tableStr += "<tr><td class='specalt' style='display:none;'>"+data[i].aid+"</td>";
				tableStr += "<td class='alt'>"+data[i].atitle+"</td>";
				tableStr += "<td class='alt'>"+data[i].atime+"</td>";
				tableStr += "<td class='alt'>"+data[i].aviewnum+"</td>";
				tableStr += "<td class='alt'>"+data[i].commentnum+"</td>";
				tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].aid+")'>编辑</a>";
				tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].aid+")'>删除</a></td></tr>";
			}
		}
		$("#table_body").html(tableStr);
	});}

function listNum(){
	$.post("article/listNum",{pageSize:pageSize},function(data){
		var ulStr = "";
		ulStr +="<li ><a onclick='prePage()'>&laquo; Prev</a></li>";
		ulStr +="<li ><a onclick='firstPage()'>首页</a></li>";
		ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
		ulStr +="<li><a>共:"+data.total+"条</a></li>";
		ulStr +="<li ><a onclick='lastPage()'>尾页</a></li>";
		ulStr +="<li ><a onclick='nextPage()'>Next &raquo;</a></li>";
		totalPage = data.totalPage;
		$("#myUI").html(ulStr);
	});
}


/* 获取类别标签的请求 */
$.get("tag/findAll", function(data) {
	for (var i = 0; i < data.length; i++) {
		var option = "<option onclick='findArticleByTag(" + data[i].tagid + ")'>" + data[i].tagname+"("+data[i].articlenum+")</option>";
		$("#tag").append(option);
	}
});
/* 获取类型标签的请求 */
$.get("type/findAll", function(data) {
	for (var i = 0; i < data.length; i++) {
		var option = "<option onclick='findArticleByType(" + data[i].tid + ")'>"
				+ data[i].tname + "</option>";
		$("#type").append(option);
	}
});
//点击按标题查询
function findArticleByAtitle(){
	var atitle = $("#atitle").val();
	$.post("article/findArticleByAtitle",{currPage:currPage,pageSize:pageSize,atitle:atitle},function(data){
		var tableStr ;
		if(data == ""){
			tableStr +="<tr><td colspan='5' style='text-align:center;'>暂无文章</td></tr>";
		}else{
			for(var i=0;i<data.length;i++){
				tableStr += "<tr><td class='specalt' style='display:none;'>"+data[i].aid+"</td>";
				tableStr += "<td class='alt'>"+data[i].atitle+"</td>";
				tableStr += "<td class='alt'>"+data[i].atime+"</td>";
				tableStr += "<td class='alt'>"+data[i].aviewnum+"</td>";
				tableStr += "<td class='alt'>"+data[i].commentnum+"</td>";
				tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].aid+")'>编辑</a>";
				tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].aid+")'>删除</a></td></tr>";
			}
		}
		$("#table_body").html(tableStr);
	});
	listNumByAtitle(atitle);
}
function listNumByAtitle(atitle){
	$.post("article/findArticleNumByAtitle",{pageSize:pageSize,atitle:atitle},function(data){
		var ulStr = "";
		ulStr +="<li ><a onclick='prePageByAtitle("+index+")'>&laquo; Prev</a></li>";
		ulStr +="<li ><a onclick='firstPageByAtitle("+index+")'>首页</a></li>";
		ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
		ulStr +="<li><a>共:"+data.total+"条</a></li>";
		ulStr +="<li ><a onclick='lastPageByAtitle("+index+")'>尾页</a></li>";
		ulStr +="<li ><a onclick='nextPageByAtitle("+index+")'>Next &raquo;</a></li>";
		totalPage = data.totalPage;
		$("#myUI").html(ulStr);
	});
}
function nextPageByAtitle(index){
	if(currPage == totalPage){
		currPage = currPage;
	}else{
		currPage += 1;
		findArticleByAtitle(index);
	}
}
/* 上一页 */
function prePageByAtitle(index){
	if(currPage == 1){
		currPage = currPage;
	}else{
		currPage -= 1;
		findArticleByAtitle(index);
	}
}
/* 首页 */
function firstPageByAtitle(index){
	currPage = 1;
	findArticleByAtitle(index);
}
/* 尾页 */
function lastPageByAtitle(index){
	currPage = totalPage;
	findArticleByAtitle(index);
}


//----------------------------查询文章以文章类别 分页查询----------------
function findArticleByTag(index){
	$.post("article/findArticleByTag",{currPage:currPage,pageSize:pageSize,tagid:index},function(data){
		var tableStr ;
		if(data == ""){
			tableStr +="<tr><td colspan='5' style='text-align:center;'>暂无文章</td></tr>";
		}else{
			for(var i=0;i<data.length;i++){
				tableStr += "<tr><td class='specalt' style='display:none;'>"+data[i].aid+"</td>";
				tableStr += "<td class='alt'>"+data[i].atitle+"</td>";
				tableStr += "<td class='alt'>"+data[i].atime+"</td>";
				tableStr += "<td class='alt'>"+data[i].aviewnum+"</td>";
				tableStr += "<td class='alt'>"+data[i].commentnum+"</td>";
				tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].aid+")'>编辑</a>";
				tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].aid+")'>删除</a>";
				tableStr += "<select style='border:none;'><option>你好</option></select></td></tr>";
			}
		}
		$("#table_body").html(tableStr);
	});
	
	listNumByTag(index);
}
//------------------------------查询文章以 文章类别（tag）分页查询  后的文章总数
function listNumByTag(index){
	$.post("article/findArticleNumByTag",{pageSize:pageSize,tagid:index},function(data){
		var ulStr = "";
		ulStr +="<li ><a onclick='prePageByTag("+index+")'>&laquo; Prev</a></li>";
		ulStr +="<li ><a onclick='firstPageByTag("+index+")'>首页</a></li>";
		ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
		ulStr +="<li><a>共:"+data.total+"条</a></li>";
		ulStr +="<li ><a onclick='lastPageByTag("+index+")'>尾页</a></li>";
		ulStr +="<li ><a onclick='nextPageByTag("+index+")'>Next &raquo;</a></li>";
		totalPage = data.totalPage;
		$("#myUI").html(ulStr);
	});
}
//---------------------------------查询文章以 文章类型分页查询 的操作也

/* 下一页 */
function nextPageByTag(index){
	if(currPage == totalPage){
		currPage = currPage;
	}else{
		currPage += 1;
		findArticleByTag(index);
	}
}
/* 上一页 */
function prePageByTag(index){
	if(currPage == 1){
		currPage = currPage;
	}else{
		currPage -= 1;
		findArticleByTag(index);
	}
}
/* 首页 */
function firstPageByTag(index){
	currPage = 1;
	findArticleByTag(index);
}
/* 尾页 */
function lastPageByTag(index){
	currPage = totalPage;
	findArticleByTag(index);
}
//------------------------------------------------------------------------------

//----------------------------查询文章以 文章类型分页查询
function findArticleByType(index){
	$.post("article/findArticleByType",{currPage:currPage,pageSize:pageSize,tid:index},function(data){
		var tableStr ;
		if(data == ""){
			tableStr +="<tr><td colspan='5' style='text-align:center;'>暂无文章</td></tr>";
		}else{
			for(var i=0;i<data.length;i++){
				tableStr += "<tr><td class='specalt' style='display:none;'>"+data[i].aid+"</td>";
				tableStr += "<td class='alt'>"+data[i].atitle+"</td>";
				tableStr += "<td class='alt'>"+data[i].atime+"</td>";
				tableStr += "<td class='alt'>"+data[i].aviewnum+"</td>";
				tableStr += "<td class='alt'>"+data[i].commentnum+"</td>";
				tableStr += "<td class='alt'><a style='margin-right:10px; font-size:15px;' onclick='editrow("+data[i].aid+")'>编辑</a>";
				tableStr += "<a style='margin-right:10px; font-size:15px;' onclick='deleterow("+data[i].aid+")'>删除</a></td></tr>";
			}
		}
		$("#table_body").html(tableStr);
	});
	
	listNumByType(index);
}
//------------------------------查询文章以 文章类型分页查询  后的文章总数
function listNumByType(index){
	$.post("article/findArticleNumByType",{pageSize:pageSize,tid:index},function(data){
		var ulStr = "";
		ulStr +="<li ><a onclick='prePageByType("+index+")'>&laquo; Prev</a></li>";
		ulStr +="<li ><a onclick='firstPageByType("+index+")'>首页</a></li>";
		ulStr +="<li><a>"+currPage+"/"+data.totalPage+"</a></li>";
		ulStr +="<li><a>共:"+data.total+"条</a></li>";
		ulStr +="<li ><a onclick='lastPageByType("+index+")'>尾页</a></li>";
		ulStr +="<li ><a onclick='nextPageByType("+index+")'>Next &raquo;</a></li>";
		totalPage = data.totalPage;
		$("#myUI").html(ulStr);
	});
}

//---------------------------------查询文章以 文章类型分页查询 的操作也

/* 下一页 */
function nextPageByType(index){
	if(currPage == totalPage){
		currPage = currPage;
	}else{
		currPage += 1;
		findArticleByType(index);

	}
}
/* 上一页 */
function prePageByType(index){
	if(currPage == 1){
		currPage = currPage;
	}else{
		currPage -= 1;
		findArticleByType(index);
	}
}
/* 首页 */
function firstPageByType(index){
	currPage = 1;
	findArticleByType(index);
}
/* 尾页 */
function lastPageByType(index){
	currPage = totalPage;
	findArticleByType(index);
}

//--------------------------------------------------


/* 编辑 */
function editrow(index){
	window.location.href="page/blog_add.jsp?aid="+index;
}
/* 删除 */
function deleterow(index){
	$.post("article/delete",{aid:index},function(data){
		$.messager.alert("操作提示","删除成功!","info",function(){
			location.reload();
		});
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
