$("#tagList")
		.datagrid(
				{
					url : "tag/list",
					pagination : true,
					fit : true,
					border : false,
					toolbar : '#tag',
					fitColumns : true,
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'tagname',
								title : '标签名',
								width : 100,
								align : 'center'
							},
							{
								field : 'articlenum',
								title : '文章数量',
								width : 100,
								align : 'center'
							}
							
							 ] ]
				});

$("#modifyTag").dialog({
	title : "标签修改",
	closed : true,
	modal : true,
});
/*$("#addTag").dialog({
	title : "标签添加",
	closed : true,
	modal : true,
});*/
$("#modifyTagForm").form(
		{
			url : "tag/modify",
			success : function(data) {
				if (data) {
					$("#modifyTag").dialog("close"); // 关闭修改框
					$("#tagList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						title : '修改信息',
						msg : '修改失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});
$("#addTagForm").form(
		{
			url : "tag/add",
			success : function(data) {
				$("#addTag").dialog("close"); // 关闭添加框
				if (data.trim()>0) {
					$.messager.show({
						msg : '添加标签成功！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
					$("#tagList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						title : '添加标签',
						msg : '添加标签失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			}
		});
$(".closeBtn").linkbutton({
	iconCls : "icon-cancel",
	onClick : function() {
		$("#modifyTag").dialog("close");
	}
});

$(".updateBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#modifyTagForm").submit();
	}
});
$(".addBtn").linkbutton({
	iconCls : "icon-add",
	onClick : function() {
		$("#addTag").dialog("open");

	}
});
$(".updBtn").linkbutton({
	iconCls : "icon-reload",
	onClick : function() {
		$("#tagList").datagrid("reload");
	}
});

$(".submitBtn").linkbutton({
	iconCls : "icon-ok",
	onClick : function() {
		$("#addTagForm").submit();
	}
});
function openUpdate(index) {
	$("#modifyTag").dialog("open");
	var row = $("#tagList").datagrid("getRows")[index];
	$("#Tid").val(row.tagid);
	$("#Tname").val(row.tagname);

}
function deleteDate(index) {
	// 删除时先获取选择行
	var row = $("#tagList").datagrid("getRows")[index];
	var tagid = row.tagid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("tag/delete", {
				tagid : tagid
			}, function(data) {
				if (data > 0) {
					$("#tagList").datagrid("reload"); // 刷新修改数据
				} else {
					$.messager.show({
						title : '删除标签',
						msg : '删除标签失败！！！',
						showType : 'show',
						style : {
							top : document.body.scrollTop
									+ document.documentElement.scrollTop,
						}
					});
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}
