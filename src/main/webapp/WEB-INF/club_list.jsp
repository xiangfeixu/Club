<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>俱乐部管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
	body{ font-family: "微软雅黑"; background-color: #FFFFFF; }
	
	table{ width:96%; margin: 0 auto; text-align: center; border-collapse:collapse; font-size:16px;}
	td, th{ padding: 5px;}
	th{ background-color: #FFFFFF; width:120px; }
	th.width-40{ width: 40px; }
	th.width-50{ width: 50px; }
	th.width-64{ width: 64px; }
	th.width-80{ width: 80px; }
	th.width-120{ width: 100px; }
	hr{ margin-bottom:20px; border:1px solid #aaa; }
	#add-order{text-align:center;font-size:20px;}
</style>
<script type="text/javascript">
	
</script>
</head>
<body><!-- body-start  -->



<a style="border:0px ;float: left;
line-height: 35px;
height: 35px;font-size:26px;text-decoration:none;width:10%;color:white;background:#1289BB;text-align:center;" href="add" >
新增</a>


<table border="1">
	<tr>
		<th class="width-50">俱乐部名称</th>
		<th class="width-50">俱乐部负责人</th>
		<th class="width-120">俱乐部类型</th>
		<th class="width-50">创建时间</th>
		<th class="width-50">活动次数</th>
		<th class="width-50">会员数量</th>
		<th class="width-80">操 作</th>
	</tr>
    <c:forEach items="${ list }" var="club" varStatus="status">
    
    <tr>    
	   <td>${ club.name }</td>
	   <td>${ club.charger }</td>
	   <td>
	   <c:if test="${club.type==1 }">足球</c:if>
	   <c:if test="${club.type==2 }">羽毛球</c:if>
	   <c:if test="${club.type==3 }">蓝球</c:if>
	   <c:if test="${club.type==4 }">乒乓球</c:if>
	   </td>	 
	   <td>				
				<fmt:formatDate value="${ club.founded }"
						pattern="yyyy-MM-dd"/>				
			</td>
	   <td>${ club.number }</td>
	   <td>${ club.member }</td>
	   <td>
			<a href="clubInfo?id=${ club.id }">修改</a>
			&nbsp;|&nbsp;
			<a href="clubDelete?id=${ club.id }">删除</a>
		</td>
	 </tr>
	 </c:forEach>
</table>

</body><!-- body-end  -->
</html>



