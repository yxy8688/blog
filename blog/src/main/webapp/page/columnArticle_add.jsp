<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
<base href="${deployName}">
<head>
<link rel="stylesheet" type="text/css" href="jquerySelect/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="jquerySelect/css/jquery-ui.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="jquerySelect/js/jquery-ui.min.js"></script>
<script type="text/JavaScript" src="jquerySelect/js/jquery.multiselect.js"></script>

<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
<script type="text/javascript" src="js/jquery.easyui.min.js"></script> 
</head>

<body>
	<div
		style="width: 500px; height: 400px; margin: 100px auto; border: 10px solid #CAE8EA;">
		<div style="text-align: center; margin: 100px auto;">
			<div id="content" style="float:left;margin-left:30px;"></div>
			<button type="button" style="width: 90px;" id="btnok">确定添加</button>
			<button type="button" style="width: 90px;margin-top:20px;" id="back">返回</button>
		</div>
	</div>


	<script type="text/javascript">
		var coid = "<%=request.getParameter("coid")%>";
	
		$(function() {
			/* 获取该用户的文章 */
			$.post("column/findArticleByUsid", function(data) {
				var optionStr = '';
				if(data == null){
					optionStr ='<select id="example" name="example" multiple="multiple" style="width: 300px" onchange="showValues()"></select>';
					$("#content").html(optionStr);
					
					$("#example").multiselect({
						height : 200,
						minWidth : 200,
						noneSelectedText : "==请选择要添加的文章==",
						checkAllText : "全选",
						uncheckAllText : '全不选',
						selectedList : 10
					});
				}else{
					optionStr +='<select id="example" name="example" multiple="multiple" style="width: 300px" onchange="showValues()">';
					for (var i = 0; i < data.length; i++) {
						optionStr += '<option value="'+data[i].aid+'">' + data[i].atitle + '</option>';
					}
					optionStr +='</select>';
					$("#content").html(optionStr);
					
					$("#example").multiselect({
						height : 200,
						minWidth : 200,
						noneSelectedText : "==请选择要添加的文章==",
						checkAllText : "全选",
						uncheckAllText : '全不选',
						selectedList : 10
					});
				}
			});
		});
		//获取选中下拉项的值
		 function showValues() {
			var array_of_checked_values = $("select").multiselect("getChecked").map(function() {
						return this.value;
					}).get();
		} 
		//获取选中项	
		$("#btnok").click(function() {
			var ids = [];
			$("#example :checked").each(function(i, item) {
				ids.push($(item).attr("value"));
			});
			if(ids == ""){
				$.messager.alert("操作提示","文章为空","error");
			}else{
				var coaid = ids.join(",");
				$.post("column/addArticleByCoid",{coaid:coaid,coid:coid},function(data){
						if(data > 0){
							$.messager.alert("操作提示","添加成功...","info",function(){
								location.href="page/blog_column.jsp";
							});
						}else{
							$.messager.alert("操作提示","添加失败！！","error");
						}
				});
			}
		});
		/* 返回 */
		$("#back").click(function(){
			location.href="page/blog_column.jsp";
		});
	</script>
</body>
</html>