/**
 * 类别管理
 */
$(function() {
	$('#table_content')
			.datagrid(
					{
						fit : true,
						border : false,
						fitColumns : true,
						singleSelect : true,
						url : 'tag/findAll',
						columns : [ [
								{
									field : 'tagid',
									title : '编号',
									hidden : true
								},
								{
									field : 'tagname',
									title : '类别',
									width : 180,
									editor : 'text',
									align : 'center'
								},
								{
									field : 'articlenum',
									title : '文章',
									width : 80,
									align : 'right',
									align : 'center'
								},
								{
									field : 'action',
									title : '操作',
									width : 80,
									align : 'center',
									formatter : function(value, row, index) {
										if (row.editing) {
											var s = '<a style="margin-right:10px; font-size:15px;" onclick="saverow('
													+ index + ')">保存</a> ';
											var c = '<a style="font-size:15px;" onclick="cancelrow('
													+ index + ')">取消</a>';
											return s + c;
										} else {
											var e = '<a style="margin-right:10px; font-size:15px;" onclick="editrow('
													+ index + ')">修改</a> ';
											var d = '<a style="font-size:15px;" onclick="deleterow('
													+ index + ')">删除</a>';
											return e + d;
										}
									}
								} ] ],
						onBeforeEdit : function(index, row) {
							row.editing = true;
							$('#table_content').datagrid('updateRow', {
								index : index
							});
						},
						onAfterEdit : function(index, row) {
							row.editing = false;
							$('#table_content').datagrid('updateRow', {
								index : index
							});
							// save
							var tagid = row.tagid;
							var tagname = row.tagname;
							$.get("tag/modify", {
								tagid : tagid,
								tagname : tagname
							}, function(data) {
								$.messager.alert("操作提示", "保存成功", "info");
							});
						},
						onCancelEdit : function(index, row) {
							row.editing = false;
							$('#table_content').datagrid('updateRow', {
								index : index
							});
						}
					});
});

// 修改类别标签
function editrow(editIndex) {
	$('#table_content').datagrid('beginEdit', editIndex);
}
function saverow(editIndex) {
	$('#table_content').datagrid('endEdit', editIndex);
}

// 删除类别标签
function deleterow(editIndex) {
	var rows = $('#table_content').datagrid('getRows');
	var row = rows[editIndex];
	var tagid = row.tagid;
	var articlenum = row.articlenum;
	if (articlenum == 0) {
		$('#table_content').datagrid('deleteRow', editIndex);
		$.get("tag/delete", {
			tagid : tagid
		}, function(data) {
			$.messager.alert("操作提示", "保存成功", "info");
		});
	} else {
		$.messager.alert("错误提示", "文章数目不为空", "error");
	}
}
function cancelrow(editIndex) {
	$('#table_content').datagrid('cancelEdit', editIndex);
}

// 添加类别标签
function tag_add() {
	var newTag = $("#add_tag").val();
	if(newTag == ""){
		$.messager.alert("失败提示","类别不能为空","error");
	}else{
		$.post("tag/add",{tagname:newTag},function(){
			$.messager.alert("操作提示","添加成功","info",function(){
				$("#add_tag").val("");
				location.reload();
			});
		});
	}
}
