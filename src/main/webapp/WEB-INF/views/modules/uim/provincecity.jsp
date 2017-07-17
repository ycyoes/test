<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html style="height: 100%;">
<head>
<meta name="decorator" content="default"/>
<title>H码数据可视化展示</title>
<%-- <link href="${ctxStatic}/common/fullscreen.css" rel="stylesheet" /> --%>
<link href="http://cdn.amazeui.org/amazeui/2.7.2/css/amazeui.min.css" rel="stylesheet" />
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/dist/echarts.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/dist/extension/dataTool.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/china.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/henan.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/beijing.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/anhui.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/aomen.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/chongqing.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/fujian.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/gansu.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/guangdong.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/guangxi.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/guizhou.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/hainan.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/hebei.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/heilongjiang.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/hubei.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/hunan.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/jiangsu.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/jiangxi.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/jilin.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/liaoning.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/neimenggu.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/ningxia.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/qinghai.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/shandong.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/shanghai.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/shanxi.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/shanxi1.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/sichuan.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/taiwan.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/tianjin.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/xianggang.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/xinjiang.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/xizang.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/yunnan.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/province/zhejiang.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/dist/extension/bmap.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/echarts3.5.3/map/js/area.js"></script>

<script type="text/javascript" src="${ctxStatic}/common/fullscreen.js"></script>

</head>

 <body style="height: 100%; margin:0; overflow-y:hidden">
	 <!-- <ul class="nav nav-tabs">
		<li class="active"><a href="javascript:void(0);">H码可视化数据列表</a></li>
	</ul> -->
  <%-- <a href="javascript:void(0);" id="fullscreen">
  	<img id="go_full" src="${ctxStatic}/images/go_full.png" style="width:20px; height:20px;" title="全屏显示"/>
  	<img id="exit_full" src="${ctxStatic}/images/exit_full.png" style="width:20px; height:20px;display:none;" title="退出全屏"/>
  </a> --%>
  <!-- <button id="btn">js控制页面的全屏展示和退出全屏显示</button>
  <p>
  	<button id="view-fullscreen">FullScreen</button>
  	<button id="cancel-fullscreen">Cancel fullscreen</button>
  </p> -->
  <div id="container" style="height:100%"></div>
  
  <script type="text/javascript">
   var pdata = ${pdata};
   var cdata = ${cdata};
   var procity = ${procity};
  	wresize();	//設置初始展示div大小
  	
	var dom = document.getElementById("container");
	var myChart = echarts.init(dom);
	var option = null;
	var curIndx = 0;
	var hcode = [
		'133', '149', '153', '170', '173', '177', '180', '181', '189'
	];	//号段
	var mapType = [
		//'china',
		// 23个省
		'广东', '青海', '四川', '海南', '陕西', 
		'甘肃', '云南', '湖南', '湖北', '黑龙江',
		'贵州', '山东', '江西', '河南', '河北',
		'山西', '安徽', '福建', '浙江', '江苏', 
		'吉林', '辽宁', 
		/* '台湾', */
		// 5个自治区
		'新疆', '广西', '宁夏', '内蒙古', '西藏', 
		// 4个直辖市
		'北京', '天津', '上海', '重庆',
		// 2个特别行政区
		/* '香港', '澳门' */
	];
	//全国地图数据处理-右侧条形图展示
	var convertData = function(data) {
			var res = [];
			for (var i = 0; i < mapType.length ; i++)
			{
				var mdata = data[mapType[i]];
				if (mdata)
				{
					res.push({
						name: mapType[i],
						value: mdata.count
					});
				}
				
				res.sort(function(a, b) {
					return a.value - b.value;
				});
				
			}
			return res;
		};
		
	//各省份数据
	var provincedata = function(data) {
			var res = [];
			for (var i = 0; i < mapType.length ; i++)
			{
				var mdata = data[mapType[i]];
				if (mdata)
				{
					res.push({
						name: mapType[i],
						value: mdata
					});
				}
			}
			return res;
		};
	
	//各省份数据处理
	var prodata = function(pro, data) {
		//alert("data: " + data['河南']);
		var res = [];
		var pro = procity[pro];
		//alert("pro: " + data[pro[2]].count);
		for (var i = 0; i < pro.length ; i++)
			{
				var mdata = data[pro[i]];
				if (mdata)
				{
					res.push({
						name: pro[i],
						value: mdata.count
					});
				}
				
				res.sort(function(a, b) {
					return a.value - b.value;
				});
				
			}
			return res;
	};
	//各地市数据
	var localData = function(pro, data) {
		//alert("data: " + data['河南']);
		var res = [];
		var pro = procity[pro];
		//alert("pro: " + data[pro[2]].count);
		for (var i = 0; i < pro.length ; i++)
			{
				var mdata = data[pro[i]];
				if (mdata)
				{
					res.push({
						name: pro[i],
						value: mdata
					});
				}
			}
			return res;
	};
	
	//判断是否为31省份
	function contains(arr, obj) {  
		var i = arr.length;  
		while (i--) {  
			if (arr[i] === obj) {  
				return true;  
			}  
		}  
		return false;  
	} 
	
	var formatter = function(params) {
		var val = params.data;
		var hc = "";
		if(val.value == undefined) {
			return val.name;
		} else {
			for(var i = 0; i < hcode.length; i++) {
				var segnum = val.value[hcode[i]];
				hc += segnum == undefined ? "" : hcode[i] + "号头:&nbsp;&nbsp;" + segnum + "</br>";
			}
			return '<div style="border-bottom: 1px solid rgba(255,255,255,.3); font-size: 18px;padding-bottom: 7px;margin-bottom: 7px">'
	               + val.name + ' 总数:' + val.value.count + '</div>' + hc;
		}
	};

	myChart.on("mapselectchanged", function (param){
		var mt = param.batch[0].name;
		var isPro = contains(mapType, mt);	//是否属于31省，用于全国地图与地市地图之间切换
		//alert("省份: " + mt + " selected: " + param.selected + " b: " + b);
		if (isPro)
		{
			var citydata = prodata(mt, cdata);
			var ydata = [];
			for(var i = 0; i < citydata.length; i++) {
				ydata.push(citydata[i].name);
			}
			option.yAxis.data = ydata;
			option.series[0].data = localData(mt, cdata);
			option.series[1].data = citydata;
			option.tooltip.formatter = function(params) {
				return formatter(params);
			};
		} else {
			mt = 'china';
			option.yAxis.data = yaxis(pdata);
			option.series[0].data = provincedata(pdata);
			option.series[1].data = convertData(pdata);
			option.tooltip.formatter = function(params) {
				return formatter(params);
			};
		}
		//alert(option.series[0].mapType + " province: " + option.title.subtext);
		option.title[0].subtext = mt + ' （点击切换）';
		option.series[0].mapType = mt;
		myChart.setOption(option, true);
	});

	var yaxis = function(data) {
		var prodata = convertData(data);
		var ydata = [];
		for(var i = 0; i < prodata.length; i++) {
			ydata.push(prodata[i].name);
		}
		return ydata;
	};
	//alert("yaxis: " + yaxis(pdata));
	
	option = {
		title: [
			{	
				text : '全国31个省市自治区H码统计展示',
				subtext : 'china'
			},
			{	
				id: "statistic",
				right: 120,
				top: 40,
				width: 100,
				textStyle: {
					color: "#fff",
					fontSize: 16
				}
			}
		],
		tooltip : {
			trigger: 'item',
			//formatter: '{b} </br> 总数:{c}'
		},
	    toolbox: {
	        show: true,
	        feature: {
	            /* dataZoom: {
	                yAxisIndex: 'none'
	            }, */
	             myTool1: {
	                show: true,
	                title: '全屏显示',
	                icon: 'image://${ctxStatic}/images/go_full.png',
	                onclick: function (){
	                    if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
							requestFullScreen(document.documentElement);
						} else {
							window.open(window.location.href, '_blank' );
						}
	                }
	            },
	             myTool2: {
	                show: true,
	                title: '退出全屏',
	                icon: 'image://${ctxStatic}/images/exit_full.png',
	                onclick: function (){
	                	window.close();
	                    exitFull();
	                }
	            },
	            saveAsImage: {},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            dataView: {readOnly: false}
	        }
	    },
		grid: {
			right: 40,
			top: 100,
			bottom: 40,
			width: "30%"
		},
		xAxis: {
			type: "value",
			scale: true,
			position: "top",
			boundaryGap: false,
			splitLine: {show: false},
			axisLine: { show: false},
			axisTick: { show: false},
			axisLabel: {margin: 2, textStyle: {color: "#000"}},
		},
		yAxis: {
			type: "category",
			name: "TOP 30",
			nameGap: 16,
			axisLine: {show: false, lineStyle: {color: "#000"}},
			axisTick: {show: false, lineStyle: {color: "#000"}},
			axisLabel: {interval: 0, textStyle: {color: "#000"}},
			data: yaxis(pdata)
		},
		
		series : [
			{
				name: '地图数据',
				type: 'map',
				mapType: 'china',
				left: "5%",
				roam: true,
				zoom: 1,
				selectedMode : 'single',
				itemStyle:{
					normal:{label:{show:true}},
					emphasis:{label:{show:true}}
				},
				data:[
					
				]
			},
			{
				id: "bar",
				zlevel: 2, 
				type: "bar",
				symbol: "none",
				tooltip : {
					trigger: 'item',
					formatter: '{b} </br> 总数:{c}'
				},
				itemStyle: {
					normal: {
						color: "#ddb926"
					}
				},
				//data: convertData(pdata)
				data: []
			}
		]
	};

	if (option && typeof option === 'object')
	{	
		option.series[0].data = provincedata(pdata);
		option.series[1].data = convertData(pdata);
		option.tooltip.formatter = function(params) {
			return formatter(params);
		};
		myChart.setOption(option, true);
		window.onresize = myChart.resize;
	}
	
  </script>
  
  <script type="text/javascript">

	$('#go_full').on('click', function () {
		$('#exit_full').show();
		$('#go_full').hide();
		if(!(self.frameElement && self.frameElement.tagName=="IFRAME")){
			requestFullScreen(document.documentElement);
		} else {
			window.open(window.location.href, '_blank' );
		}
	});

	$('#exit_full').on('click', function () {
		$('#exit_full').hide();
		$('#go_full').show();
	  	exitFull();
	});
	
	
	function requestFullScreen(element) {
    // 判断各种浏览器，找到正确的方法
    var requestMethod = element.requestFullScreen || //W3C
    element.webkitRequestFullScreen ||    //Chrome等
    element.mozRequestFullScreen || //FireFox
    element.msRequestFullScreen; //IE11
    //alert("ele: " + element + " method: " + requestMethod);
    if (requestMethod) {
        requestMethod.call(element);
    }
    else if (typeof window.ActiveXObject !== "undefined") {//for Internet Explorer
        var wscript = new ActiveXObject("WScript.Shell");
        if (wscript !== null) {
            wscript.SendKeys("{F11}");
        }
    }
}

//退出全屏 判断浏览器种类
function exitFull() {
    // 判断各种浏览器，找到正确的方法
    var exitMethod = document.exitFullscreen || //W3C
    document.mozCancelFullScreen ||    //Chrome等
    document.webkitExitFullscreen || //FireFox
    document.webkitExitFullscreen; //IE11
    //alert("ele: " + element + " method: " + requestMethod);
    if (exitMethod) {
        exitMethod.call(document);
    }
    else if (typeof window.ActiveXObject !== "undefined") {//for Internet Explorer
        var wscript = new ActiveXObject("WScript.Shell");
        if (wscript !== null) {
            wscript.SendKeys("{F11}");
        }
    }
}
	
  </script>
  
 </body>
</html>
