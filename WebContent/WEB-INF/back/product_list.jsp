<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.situ.mall.pojo.Product"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 调head路径 -->
	<%@include file="../common/head.jsp" %>
	<!-- 导航条  -->
	<jsp:include page="../common/logo.jsp" />
	
	<!-- 全局部属   -->
	 <div class="container">
	 	<div class="row">
	 		<!-- 左边栏开始 -->
	 		<div class="col-md-2" >
	 		   <ul class="nav nav-pills nav-stacked" >
   					<li role="presentation" class="active"><a href="#" >学生管理</a></li>
				    <li role="presentation"  ><a href="${ctx}/student/toaddStudent.action" method="post">添加学生</a></li> 
               </ul>
	 		</div>
	 		<!-- 左边导航栏结束  -->
			
			
			
			<!-- 右边栏开始  -->
	 		<div class="col-md-10">
	 		      
                <ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="#">学生管理</a></li>
					<li role="presentation"><a href="${ctx}/student/toaddStudent.action" method="post">添加学生</a></li>
				</ul>
		  <!-- 右边栏结束结束	 -->	
		  
		  	
 <!--  多条件查询开始  -->
		  <form action="${ctx}/student/seacherByCondition.action" method="post" class="form-inline" id="a" style="margin-left: 90px;" >

				<!-- 用于查找+分页 记录反的页数 -->
					<input type="hidden" name="pageIndex" id="pageIndex" /> 
				
					<label for="exampleInputName2" >姓名：</label> 
					  <input type="text" name="name" class="form-control" id="exampleInputName2" placeholder="姓名"
						value="${condition.name}" style="width: 90px; " />
		
				    <label for="exampleInputName2" >年龄：</label>
					  <input type="text" name="age" class="form-control" id="exampleInputName2" placeholder="年龄" value="${condition.age}" style="width: 90px; " >
			
					<label for="exampleInputName2">性别：</label>
					 <select id="gender" name="gender" >
						<option value="">请选择</option>
						<option value="男">男</option>
						<option value="女">女</option>
					 </select>
			
			
					<div class="form-group">
						  <label for="exampleInputName2">住址：</label> 
						    <input type="text" name="address" class="form-control" id="exampleInputName2"
								placeholder="地址" value="${condition.address}" style="width: 90px; "> 
								
								
						  <label for="exampleInputName2">出生日期：</label> 
						    <input type="text" name="birthday" style="width: 100px" class="form-control"
								id="exampleInputName2" placeholder="出生日期"
								value="${condition.birthday}">
						<div class="form-group">
							<label for="exampleInputName2">班级：</label>
								<select id="banji_id" name="banji_id" >
									<option value="" >请选择</option>
									<c:forEach items="${bList}" var="banji">
										<option value="${banji.id }" >${banji.name }</option>								
									</c:forEach>
								</select>		
					    </div>	 
						<button type="submit" class="btn btn-default">搜索</button>
					</div>
			</form> 
 <!--  多条件查询结束 -->
<!-- 列表开始  -->	
            <table class="table table-striped table-bordered table-hover"style="width: 800px;" align="center">
			<tr>
			    <td><input type="checkbox" onclick="selectAll();" id="slectAlls" /></td>
			    <td>id</td>
				<td>商品编号</td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>货存</td>
				<td>状态</td>
				<td>创建日期</td>
				<td>更新日期</td>	
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${list}" var="product">
				<tr>
				   <td><input type="checkbox" name="selectIds" value="${product.id}"></td>
					<td>${product.id}</td>
					<td>${product.category_id}</td>
					<td>${product.name}</td>
					<td>${product.price}</td>
					<td>${product.stock}</td>
					<td>${product.subtitle}</td>
					<td>${product.create_time}</td>
					<td>${product.update_time}</td>
					<td><a
						href="${ctx}/student/toupdate.action?id=${product.id}"
						method="post">修改</a>
					<td>
					<a href="javascript:delProduct('${product.id}')"
						method="post" >删除</a> 
					</td> 
			</c:forEach>
		</table>	      
   </form>	
<!-- 列表结束  -->
	

</body>
</html>