<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>H码可视化数据管理</title>
<meta name="decorator" content="default" />
<!-- 引入样式 -->
<link rel="stylesheet" href="//unpkg.com/element-ui@1.3.7/lib/theme-default/index.css">
<script src="//unpkg.com/vue/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@1.3.7/lib/index.js"></script>
<script src="//cdn.bootcss.com/fetch/2.0.3/fetch.js"></script>
<%-- <link rel="stylesheet" href="${ctxStatic}/vue/element-ui1.3.7.css">
<script src="${ctxStatic}/vue/vue2.3.4.js"></script>
<script src="${ctxStatic}/vue/element-ui1.3.7.js"></script>
<script src="${ctxStatic}/vue/fetch2.0.3.js"></script> --%>
<script src="${ctxStatic}/vue/moment.min.js"></script>

</head>
<body>
<form:form id="searchForm" modelAttribute="taskOrder" action="http://localhost:7001/getTaskOrder" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>卡商：</label>
				<form:select path="spName" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>任务单号：</label>
				<form:input path="taskNum" id="taskNum" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			<li><label>任务单明细：</label>
				<form:input path="taskDetailNum" id="taskDetailNum" htmlEscape="false" maxlength="40" class="input-medium"/>
			</li>
			<li><label>标包：</label>
				<form:select path="standardPackage" id="standardPackage" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			
			<li class="ad"><label>省份：</label>
				<form:select path="province" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="ad"><label>地市：</label>
				<form:select path="city" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>订单状态：</label>
				<form:select path="orderStatus" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>物流单号：</label>
				<form:input path="logisticsNum" htmlEscape="false" maxlength="20" class="input-medium"/>
			</li>
			
			<li><label>卡产品类型：</label>
				<form:select path="cardProductType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>制卡类型：</label>
				<form:select path="makeCardType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>业务类型：</label>
				<form:select path="cardBusinessType" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>延迟发货：</label>
				<form:select path="isDelaySend" class="input-medium">
					<form:option value="" label="请选择"/>
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			
			<%-- <li><label>订单生成时间：</label>
				<input name="beginArriveDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${checkOthers.beginArriveDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endArriveDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${checkOthers.endArriveDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>发货时间：</label>
				<input name="beginArriveDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${checkOthers.beginArriveDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endArriveDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${checkOthers.endArriveDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li>
			<li><label>到货时间：</label>
				<input name="beginCheckDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${checkOthers.beginCheckDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/> - 
				<input name="endCheckDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${checkOthers.endCheckDate}" pattern="yyyy-MM-dd"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
			</li> --%>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="button" value="查询"/>
				<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
				<!-- <input id="btnImport" class="btn btn-primary" type="button" value="导入"/> -->
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>

	
<div id="app">
	<!-- <el-form ref="form" :model="form" label-width="80px">
		<el-form-item label="活动名称">
			<el-input v-model="form.task_num" placeholder="请输入任务单号"></el-input>
	  	</el-form-item>
	    <el-button type="primary">查询</el-button>
	</el-form> -->
	<template>
	  <el-table ref="multipleTable" :data="tableData" border tooltip-effect="dark" fit>
	    <!-- <el-table-column type="selection" width="55"></el-table-column> -->
	    <el-table-column prop="task_num" label="任务单号" min-width="170" fixed></el-table-column>
	    <el-table-column prop="task_detail_num" label="任务单明细号" min-width="130" fixed></el-table-column>
	    <el-table-column prop="sp_name" label="卡商" min-width="130"></el-table-column>
	    <el-table-column prop="create_time" label="任务单生成时间" min-width="170" :formatter="dateFormatter"></el-table-column>
	    <el-table-column prop="province" label="省份" min-width="120"></el-table-column>
	    <el-table-column prop="city" label="地市" min-width="120"></el-table-column>
	    <el-table-column prop="count" label="订单数量" min-width="120"></el-table-column>
	    <!-- <el-table-column prop="devanning_num" label="拆单数量" min-width="120"></el-table-column> -->
	    <el-table-column prop="deliver_num" label="发货数量" min-width="120"></el-table-column>
	    <el-table-column prop="standard_package" label="标包" min-width="120"></el-table-column>
	    <el-table-column prop="card_product_type" label="卡产品类型" min-width="170" show-overflow-tooltip></el-table-column>
	    <el-table-column prop="make_card_type" label="制卡类型" min-width="120"></el-table-column>
	    <el-table-column prop="function_type" label="业务类型" min-width="170" show-overflow-tooltip></el-table-column>
	    <el-table-column prop="deliver_check_time" label="完成出货检测时间" min-width="170" :formatter="dateFormatter"></el-table-column>
	    <el-table-column prop="deliver_check_result" label="出货检测结果" min-width="140"></el-table-column>
	    <el-table-column prop="send_time" label="发货时间" min-width="170" :formatter="dateFormatter"></el-table-column>
	    <el-table-column prop="arrive_time" label="到货时间" min-width="170" :formatter="dateFormatter"></el-table-column>
	    <el-table-column prop="check_time" label="完成到货检测时间" min-width="170" :formatter="dateFormatter"></el-table-column>
	    <el-table-column prop="check_result" label="到货检测结果" min-width="140"></el-table-column>
	    <el-table-column prop="is_delay_send" label="是否延迟发货" min-width="140"></el-table-column>
	    <el-table-column prop="order_status" label="订单状态" min-width="120"></el-table-column>
	    <el-table-column prop="logistics_num" label="物流单号" min-width="120"></el-table-column>
	  </el-table>
	  <div class="block">
	    <el-pagination @size-change="handleSizeChange" @current-change="handleCurrentChange" :current-page="currentPage" 
	    :page-sizes="[1, 6, 20, 40]" :page-size="pageSize" layout="total, sizes, prev, pager, next, jumper" :total="total">
	    </el-pagination>
	  </div>
	</template>
</div>

<script type="text/javascript">
$(function() {
  $('#btnSubmit').click(function() {
    var formParams = new URLSearchParams(); 
    let taskNum = $('#taskNum').val();
    let taskDetailNum = $('#taskDetailNum').val();
    let standardPackage = $('#standardPackage').val();
    /* if(taskNum) {
    	formParams.append('taskNum', "T01N161012328140");
    } */
    	formParams.append('taskNum', "T01N161012328140");
    if(standardPackage) {
    	formParams.append('standardPackage', standardPackage);
    }
  //  alert(formParams);
    console.log("--------query params: " + formParams);
    getData(formParams);
 
    var Main = {
	methods: { 
	  fetchData: function(){
	  	let self = this;
	  	console.log("-----------------this---start-----------------" + self.pageSizes);
	  	console.log(this);
	  	console.log("-----------------this---end-----------------");
	    console.log('pageSize: ' + self.pageSize + ' pageIndex: ' + self.pageIndex + ' currentPage:' + this.currentPage);
	  	let params = "pageSize=" + (self.pageSize ? self.pageSize : 3) +
	  				"&currentPage=" + (self.currentPage ? self.currentPage : 1) + 
	  				(!formParams ? "&" + formParams : '');
	  	console.log("----------------params: " + params);
	  	fetch('http://localhost:7001/getTaskOrder', {
	  		method: "POST",
	  		mode: "cors",
	  		headers: headers,
	  		body: params
	  	}).then(function(res) {
		  console.log(res)
		   if (res.ok) {	
		    res.json().then(function(data) {
		      //console.log("---------self: "  + self); 
		      console.log("---------data: "  + data); 
		      //console.log("---------data: "  + JSON.stringify(data)); 
		      self.tableData = data.data;
		      self.total = data.total;
		      self.pageSize = data.pageSize;
		      self.currentPage = data.currentPage;
			  console.log('---------return -------------pageSize: ' + self.pageSize + ' pageIndex: ' + self.pageIndex + ' currentPage:' + self.currentPage);
			  console.log('---------return -------------pageSize: ' + data.pageSize + ' pageIndex: ' + data.pageIndex + ' currentPage:' + data.currentPage);
			  console.log('---------return -------------pageSize: ' + this.pageSize + ' pageIndex: ' + this.pageIndex + ' currentPage:' + this.currentPage);
		    });
			  } else {
			    console.log("Looks like the response wasn't perfect, got status", res.status);
			  }
			}, function(e) {
			  console.log("Fetch failed!", e); 
		});
	  },
	  
      handleSizeChange: function(pageSize) {
        console.log('pageSize: ' + pageSize);
        this.pageSize = pageSize;
        this.fetchData();
      },
      
      handleCurrentChange: function(currentPage) {
        console.log('currentPage: ' + currentPage);
        this.currentPage = currentPage;
        this.fetchData();
      },
      
      dateFormatter: function(row, column) {	//格式化时间
      	let val = row[column.property];
      	if(val) {
	      	return moment(val).format("YYYY-MM-DD HH:mm:ss");
      	}
      }
    },
	data(){
		return {
			tableData: this.fetchData(),
			currentPage: 1,
			pageSize: 10,
			pageSizes: [1, 6, 30, 40],
			total:  100
		}
	}
};

/* var Ctor = Vue.extend(Main);
new Ctor().$mount('#app'); */
 
    
    
    
    
  });
});
//$('#app').height($(window).height());
var headers = new Headers();
headers.append('Accept', 'application/json'); 
/* headers.append('Content-Type', 'application/json');  */
headers.append('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8'); 
headers.append('Access-Control-Allow-Origin', 'http://localhost:8080'); 
headers.append('Access-Control-Max-Age','86400'); 
headers.append('Access-Control-Allow-Headers','Content-Type'); 
headers.append('Access-Control-Allow-Methods', 'POST, GET, OPTIONS, PUT, DELETE'); 

var request = new Request('http://localhost:7001/getTaskOrder', {
    method: 'POST', 
    mode: 'cors', 
    credentials: 'credentials',
    cache: 'default'
});

getData();

function getData(formParams) {
console.log("------------formParams: " + formParams);
  var Main = {
	methods: { 
	  fetchData: function(){
	  	let self = this;
	  	console.log("-----------------this---start-----------------" + self.pageSizes);
	  	console.log(this);
	  	console.log("-----------------this---end-----------------");
	    console.log('pageSize: ' + self.pageSize + ' pageIndex: ' + self.pageIndex + ' currentPage:' + this.currentPage);
	  	let params = "pageSize=" + (self.pageSize ? self.pageSize : 3) +
	  				"&currentPage=" + (self.currentPage ? self.currentPage : 1) + 
	  				(!formParams ? "&" + formParams : '');
	  	console.log("----------------params: " + params);
	  	/* let formData = new FormData();
	  	formData.append("pageSize", 20);
	  	formData.append("currentPage", 2); */
	  	fetch('http://localhost:7001/getTaskOrder', {
	  		method: "POST",
	  		mode: "cors",
	  		headers: headers,
	  		body: params
	  	}).then(function(res) {
		  console.log(res)
		   if (res.ok) {	
		    res.json().then(function(data) {
		      //console.log("---------self: "  + self); 
		      console.log("---------data: "  + data); 
		      //console.log("---------data: "  + JSON.stringify(data)); 
		      self.tableData = data.data;
		      self.total = data.total;
		      self.pageSize = data.pageSize;
		      self.pageSizes = data.pageSizes;
		      self.currentPage = data.currentPage;
		      console.log('---------return -------------pageSize: ' + self.pageSize + ' pageIndex: ' + self.pageIndex + ' currentPage:' + self.currentPage);
			  console.log('---------return -------------pageSize: ' + data.pageSize + ' pageIndex: ' + data.pageIndex + ' currentPage:' + data.currentPage);
			  console.log('---------return -------------pageSize: ' + this.pageSize + ' pageIndex: ' + this.pageIndex + ' currentPage:' + this.currentPage);
		    });
			  } else {
			    console.log("Looks like the response wasn't perfect, got status", res.status);
			  }
			}, function(e) {
			  console.log("Fetch failed!", e); 
		});
	  },
	  
      handleSizeChange: function(pageSize) {
        console.log('pageSize: ' + pageSize);
        this.pageSize = pageSize;
        this.fetchData();
      },
      
      handleCurrentChange: function(currentPage) {
        console.log('currentPage: ' + currentPage);
        this.currentPage = currentPage;
        this.fetchData();
      },
      
      dateFormatter: function(row, column) {	//格式化时间
      	let val = row[column.property];
      	if(val) {
	      	return moment(val).format("YYYY-MM-DD HH:mm:ss");
      	}
      }
    },
	data(){
		return {
			tableData: this.fetchData(),
			currentPage: 1,
			pageSize: 10,
			pageSizes: [1, 6, 30, 40],
			total:  100
		}
	}
};

var Ctor = Vue.extend(Main);
new Ctor().$mount('#app');
}

var Main = {
	methods: {
	  fetchData: function(){
	  	let self = this;
	    console.log('pageSize: ' + self.pageSize + ' pageIndex: ' + self.pageIndex + ' currentPage:' + this.currentPage);
	  	let params = "pageSize=" + (self.pageSize ? self.pageSize : 10) +
	  				"&currentPage=" + (self.currentPage ? self.currentPage : 1);
	  	console.log("----------------params: " + params);
	  	let formData = new FormData();
	  	formData.append("pageSize", 20);
	  	formData.append("currentPage", 2);
	  	fetch('http://localhost:7001/getTaskOrder', {
	  		method: "POST",
	  		mode: "cors",
	  		headers: headers,
	  		body: params
	  	}).then(function(res) {
		  console.log(res)
		   if (res.ok) {	
		    res.json().then(function(data) {
		      console.log( typeof data);
		      self.tableData = data.data;
		      self.total = data.total;
		      self.pageSize = data.pageSize;
		      self.currentPage = data.currentPage;
		    });
			  } else {
			    console.log("Looks like the response wasn't perfect, got status", res.status);
			  }
			}, function(e) {
			  console.log("Fetch failed!", e); 
		});
	  },
	  
      handleSizeChange: function(pageSize) {
        console.log('pageSize: ' + pageSize);
        this.pageSize = pageSize;
        this.fetchData();
      },
      
      handleCurrentChange: function(currentPage) {
        console.log('currentPage: ' + currentPage);
        this.currentPage = currentPage;
        this.fetchData();
      },
      
      dateFormatter: function(row, column) {	//格式化时间
      	let val = row[column.property];
      	if(val) {
	      	return moment(val).format("YYYY-MM-DD HH:mm:ss");
      	}
      }
    },
	data(){
		return {
			tableData: this.fetchData(),
			currentPage: 1,
			pageSize: 10,
			total:  100
		}
	}
};

/* var Ctor = Vue.extend(Main);
new Ctor().$mount('#app'); */

/* $.ajax({
  url: "http://localhost:7001/getTaskOrder",
  beforeSend: function(request) {
              request.setRequestHeader("Access-Control-Allow-Origin", "http://localhost:7001");
          },
  type: "POST",
  contentType: "application/json",
  dataType: "application/json",
  data: {
  	pageSize: 20,
	currentPage: 2
  },
  timeout: 10000,
  crossDomain: true,
  success: function(data) {
  	console.log(data);
  },
  error: function(err) {
  	console.log('err: ' + JSON.stringify(err));
  },
  complete: function(XMLHttpRequest, status) {
  	console.log('status: ' + status + " " + XMLHttpRequest.readyState);
  }
}); */


	
</script>
</body>

</html>