$("#commentList")
		.datagrid(
				{
					url : "comment/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					singleSelect : true,
					remoteSort : false,
					nowrap : false,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'atitle',
								title : '文章标题',
								width : 100,
								align : 'center'
							},
							{
								field : 'uemail',
								title : '评论者邮箱',
								width : 100,
								align : 'center'
							},
							{
								field : 'uname',
								title : '评论者昵称',
								width : 100,
								align : 'center'
							},
							{
								field : 'ccontent',
								title : '评论内容',
								width : 100,
								align : 'center'
							},
							{
								field : 'ctime',
								title : '评论时间',
								width : 100,
								align : 'center'
							},
							{
								field : 'opr',
								title : '操作',
								width : 60,
								align : 'center',
								formatter : function(value, row, index) {
									var oprStr = '<a class="deleteBtn" href="javascript:void(0)" onclick="deleteDate('
											+ index
											+ ')">删除</a>'
											+ '<script>$(".deleteBtn").linkbutton({iconCls: "icon-remove"});</script>';
									return oprStr;
								}
							} ] ],
				/*
				 * view: detailview, detailFormatter: function(rowIndex,
				 * rowData){ return '<table><tr>' + '<td rowspan=2 style="border:0">' +
				 * rowData.cid + '"></td>' + '<td style="border:0">' + '<p>Attribute: ' +
				 * rowData.attr1 + '</p>' + '<p>Status: ' + rowData.status + '</p>' + '</td>' + '</tr></table>'; }
				 */
				});

function deleteDate(index) {
	// 删除时先获取选择行
	var row = $("#commentList").datagrid("getRows")[index];
	alert(JSON.stringify(row));
	var cid = row.cid;
	// 选择要删除的行
	$.messager.confirm("提示", "你确定要删除吗?", function(r) {
		if (r) {
			$.post("comment/delete", {
				cid : cid
			}, function(data) {
				if (data > 0) {
					$("#commentList").datagrid("reload"); // 刷新修改数据
				} else {
					alert("删除失败失败");
				}
			});
			// 将选择到的行存入数组并用,分隔转换成字符串，
			// 本例只是前台操作没有与数据库进行交互所以此处只是弹出要传入后台的id
		}
	});
}
