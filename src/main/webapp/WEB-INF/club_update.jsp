<%@ page pageEncoding="utf-8"%>
<%-- 引入JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
<title>修改</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<script type="text/javascript">
		document.getElementById("abc").readOnly=true;
	</script>
<style type="text/css">
	body{ font-family: "微软雅黑"; background-color: #EDEDED; }
	h2{ text-align: center;font-size:26px; }
	table{ margin: 30px auto; text-align: center; border-collapse:collapse; width:50%; }
	td, th{ padding: 7px;font-size:18px;}
	hr{ margin-bottom:20px; border:1px solid #aaa; }
	input,select,textarea{ width:284px; height:30px; background:#EDEDED; border:1px solid #999; text-indent:5px; font-size:18px; }
	input[type='submit']{ width:130px; height:36px; cursor:pointer; border-radius:5px 5px 5px 5px; background:#ddd; }
	select{text-indent:0px;}
	textarea{height:100px;font-size:22px;}
</style>
</head>
<body><!-- body-start  -->

<h2>修改</h2>
<hr/>
<form action="" method="POST">
    <input type="hidden" name="id" value="${ club.id }"/>
	<table border="1">
		<tr>
			<td width="30%">俱乐部名称</td>
			<td>
				<input type="text" name="name" required="true" value="${ club.name }"/>
			</td>
		</tr>
		<tr>
			<td width="30%">负责人</td>
			<td>
				<input type="text" name="charger" required="true" value="${ club.charger }"/>
			</td>
		</tr>
		<tr>
			<td>创建时间</td>
			<td>
				<input type="text"  id="abc" id="abc" name="founded" required="true" 
				value='<fmt:formatDate 
					value="${ club.founded }"
					pattern="yyyy-MM-dd "/>'/>
			</td>
		</tr>
		<tr>
			<td>俱乐部类型</td>
			<td>
				<select  name="type" id="abc">					
					<c:forEach items="${ list }" var="type">
						<option value="${ type.id }"
							<c:if test="${ club.type == type.id }">
								selected="true"
							</c:if>
						>${ type.content }</option>
					</c:forEach>
					
				</select>
			</td>
		</tr>
		<tr>
			<td>活动次数</td>
			<td>
				<input type="text" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" required="true" id="abc" readonly="readonly" name="number"  value="${ club.number }"/>
			</td>
		</tr>
		<tr>
					<td>会员数量</td>
					<td>
				<input type="text" οnkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')"s required="true" name="member" value="${ club.member }"/>
			</td>					
				</tr>
		<tr>
					<td>备注：</td>
				<td>
				<input type="text" name="note" id="abc" cols="30" rows="5" value="${ club.note }"/>	
				</td>
			</tr>
		<tr>	
		<td>
		        <input type="submit" value="取消"  onclick="javascript:this.form.action='findAll';"/>	
		</td>							
			<td>
			    <input type="submit" value="保存"  onclick="javascript:this.form.action='clubUpdate';"/>			    
			</td>			
		</tr>
	</table>
</form>

</body><!-- body-end  -->
</html>



