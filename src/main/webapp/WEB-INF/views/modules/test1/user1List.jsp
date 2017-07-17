<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>curd管理</title>
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
		<li class="active"><a href="${ctx}/test1/user1/">curd列表</a></li>
		<shiro:hasPermission name="test1:user1:edit"><li><a href="${ctx}/test1/user1/form">curd添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="user1" action="${ctx}/test1/user1/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>username：</label>
				<form:input path="username" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>name：</label>
				<form:input path="name" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>password：</label>
				<form:input path="password" htmlEscape="false" maxlength="32" class="input-medium"/>
			</li>
			<li><label>age：</label>
				<form:input path="age" htmlEscape="false" maxlength="4" class="input-medium"/>
			</li>
			<li><label>gender：</label>
				<form:input path="gender" htmlEscape="false" maxlength="1" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>username</th>
				<th>name</th>
				<th>password</th>
				<th>age</th>
				<th>gender</th>
				<shiro:hasPermission name="test1:user1:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="user1">
			<tr>
				<td><a href="${ctx}/test1/user1/form?id=${user1.id}">
					${user1.username}
				</a></td>
				<td>
					${user1.name}
				</td>
				<td>
					${user1.password}
				</td>
				<td>
					${user1.age}
				</td>
				<td>
					${user1.gender}
				</td>
				<shiro:hasPermission name="test1:user1:edit"><td>
    				<a href="${ctx}/test1/user1/form?id=${user1.id}">修改</a>
					<a href="${ctx}/test1/user1/delete?id=${user1.id}" onclick="return confirmx('确认要删除该curd吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>