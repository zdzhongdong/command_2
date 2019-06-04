<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查看用户拥有的角色</title>
<!-- <script src="jquery-2.1.4.js"></script>
<script type="text/javascript">
 $(function () {
	$("input").click(function() {
		  $.postJosn
	})
})
</script> -->
</head>
<body>
       <h1>${user.userName}拥有的角色</h1>
       <table>
      <tr><th>角色名</th><th>操作</th></tr>
    <c:forEach var="u1" items="${listRole}">
       <tr><td>${u1.roleName}</td><td><a href="delRole.lovo?userid=${user.id}&roleid=${u1.roleId}">删除</a></td></tr>
    </c:forEach>
       </table>
       <br>
       <h4>添加角色</h4>
       <form action="addRole.lovo?userid=${user.id}" method="post">
       <select name='roleid'>
       <c:forEach var="n1" items="${notRole}">
       <option value='${n1.roleId}'>${n1.roleName}</option>
       </c:forEach>   
       </select>
       <input type="submit" value='添加角色'>
       </form>
</body>
</html>