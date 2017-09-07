$("#typeList").datagrid(
				{
					url : "type/list",
					pagination : true,
					fit : true,
					border : false,
					fitColumns : true,
					toolbar : '#type',
					singleSelect : true,
					pageList : [ 5, 10, 15, 20, 25, 30 ],
					columns : [ [
							{
								field : 'tid',
								title : '编号',
								width : 100,
								align : 'center'
							},
							{
								field : 'tname',
								title : '类型名',
								width : 100,
								align : 'center'
							},
							{
								field : 'articlenum',
								title : '文章数',
								width : 100,
								align : 'center'
							} ] ]
				});


