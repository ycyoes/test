<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>H码可视化数据管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/uim/hcode/">H码可视化数据列表</a></li>
		<shiro:hasPermission name="uim:hcode:edit"><li><a href="${ctx}/uim/hcode/form">H码可视化数据添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="hcode" action="${ctx}/uim/hcode/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>省份</th>
				<th>城市</th>
				<th>号段</th>
				<th>省号段总数</th>
				<th>地市号段总数</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="uim:hcode:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="hcode">
			<tr>
				<td><a href="${ctx}/uim/hcode/form?id=${hcode.id}">
					${hcode.province}
				</a></td>
				<td>
					${hcode.city}
				</td>
				<td>
					${hcode.segnum}
				</td>
				<td>
					${hcode.pcount}
				</td>
				<td>
					${hcode.ccount}
				</td>
				<td>
					<fmt:formatDate value="${hcode.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${hcode.remarks}
				</td>
				<shiro:hasPermission name="uim:hcode:edit"><td>
    				<a href="${ctx}/uim/hcode/form?id=${hcode.id}">修改</a>
					<a href="${ctx}/uim/hcode/delete?id=${hcode.id}" onclick="return confirmx('确认要删除该H码可视化数据吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>