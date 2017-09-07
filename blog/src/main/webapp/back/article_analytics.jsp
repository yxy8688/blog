<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>用户发表文章排行</title>
</head>
<body>
<div id="container" style="min-width:400px;height:400px"></div>
<div class="message"></div>

<script type="text/javascript">
var jsonXData = [];
var jsonyD1 = [];
var map = new HashMap();
show();
function show() {
    // 获取 CSV 数据并初始化图表
    $.ajax({ 
		url:"article/analytics",
		type:"POST",
		dataType:"JSON",
		success: function (data) {
			//alert(JSON.stringify(data));
			//alert(data);
			for(var i=0;i<data.length;i++){
				var uname = data[i].uname;
				var usid=data[i].usid;
				var Num = data[i].articleNum;
				 map.put(usid,uname);
				jsonXData.push(usid); //赋值
				jsonyD1.push(Num);
				//alert(uname+Num+jsonXData.push(uname)+jsonyD1.push(Num));
			}
        $('#container').highcharts({
            title: {
                text: '用户发表文章数量排行'
            },
            xAxis: {
            	categories: jsonXData,
				lineWidth: 2,
                gridLineWidth: 1,
                title: {
                    text: "用户id"
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: -3
                }
            },
            yAxis: [{ // 第一个 Y 轴，放置在左边（默认在坐标）
                title: {
                    text: "文章数/篇"
                },
                labels: {
                    align: 'left',
                    x: 3,
                    y: 16,
                },
                showFirstLabel: false
            }, {    // 第二个坐标轴，放置在右边
                linkedTo: 0,
                gridLineWidth: 0,
                opposite: true,  // 通过此参数设置坐标轴显示在对立面
                title: {
                	text: "文章数/篇"
                },
                labels: {
                    align: 'right',
                    x: -3,
                    y: 16,
                },
                showFirstLabel: false
            }],
            legend: {
                align: 'left',
                verticalAlign: 'top',
                y: 20,
                floating: true,
                borderWidth: 0
            },
            tooltip: {
                shared: true,
                crosshairs: true,
                formatter: function () {
                	//alert(map.get(this.x));
					return '用户id:' + this.x + '</b><br/>用户名：' +map.get(this.x)+ '</b><br/>发表文章数: ' + this.y;
				}
            },
            plotOptions: {
                series: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            // 数据点点击事件
                            // 其中 e 变量为事件对象，this 为当前数据点对象
                            click: function (e) {
                            	alert(JSON.stringify(e));
                                $('.message').html( '用户id:'+this.x+'</b><br/>用户名：' +map.get(this.x)+ '<br/> 发表文章数：' +this.y );
                            }
                        }
                    },
                    marker: {
                        lineWidth: 1
                    }
                }
            },
            series: [{
				name: '文章数',
				data: jsonyD1
			}]
        });
    }});
}

function HashMap()
{
    /** Map 大小 **/
    var size = 0;
    /** 对象 **/
    var entry = new Object();
     
    /** 存 **/
    this.put = function (key , value)
    {
        if(!this.containsKey(key))
        {
            size ++ ;
        }
        entry[key] = value;
    }
     
    /** 取 **/
    this.get = function (key)
    {
        if( this.containsKey(key) )
        {
            return entry[key];
        }
        else
        {
            return null;
        }
    }
     
    /** 删除 **/
    this.remove = function ( key )
    {
        if( delete entry[key] )
        {
            size --;
        }
    }
     
    /** 是否包含 Key **/
    this.containsKey = function ( key )
    {
        return (key in entry);
    }
     
    /** 是否包含 Value **/
    this.containsValue = function ( value )
    {
        for(var prop in entry)
        {
            if(entry[prop] == value)
            {
                return true;
            }
        }
        return false;
    }
     
    /** 所有 Value **/
    this.values = function ()
    {
        var values = new Array(size);
        for(var prop in entry)
        {
            values.push(entry[prop]);
        }
        return values;
    }
     
    /** 所有 Key **/
    this.keys = function ()
    {
        var keys = new Array(size);
        for(var prop in entry)
        {
            keys.push(prop);
        }
        return keys;
    }
     
    /** Map Size **/
    this.size = function ()
    {
        return size;
    }
}



</script>

</body>
</html>