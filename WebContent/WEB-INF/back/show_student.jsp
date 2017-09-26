<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.situ.mall.pojo.Student"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<script type="text/javascript">
	function goPage(pageIndex) {
		$("#pageIndex").val(pageIndex);
		$("#a").submit();
	}
	$(function(){
		$("#gender option[value='${condition.gender}']").prop("selected",true);	
	});
	$(function(){
		$("#banji_id option[value='${condition.banji_id}']").prop("selected",true);	
	});
	function delStudent(id){
		var isDel = confirm("您确认要删除吗？")
		if(isDel){
			location.href="${pageContext.request.contextPath}/student/deleteStudent.action?id=" + id;
		}
	}
	function selectAll(){
		$("input[name=selectIds]").prop("checked",$("#slectAlls").is(":checked"));
	}
	function deleteAll(){
	   var isDel = confirm("您确认要删除吗？");
	     if(isDel){
	    		$("#mainForm").submit();
	    	 //要删除
	    	 $("#mainForm").attr("action","${pageContext.request.contextPath}/student/deleteById.action");
	     }
	
	}
</script>



</head>
<body>
	<!-- 调head路径 -->
	<%@include file="../common/head.jsp" %>
	<!-- 调头部  -->
	<jsp:include page="../common/logo.jsp" />
	
	 <div class="container">
	 	<div class="row">
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
		  <!-- 结束	 -->	
		  
		  	
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
<!-- 列表开始  -->	
	<%-- <input type="button" onclick="deleteAll()" value="批量删除"/>
    <form id="mainForm" action="${pageContext.request.contextPath}/student?method=deleteAll" method="post"> --%>
     
            <table class="table table-striped table-bordered table-hover"style="width: 800px;" align="center">
			<tr>
			    <td><input type="checkbox" onclick="selectAll();" id="slectAlls" /></td>
				<td>学号</td>
				<td>姓名</td>
				<td>年龄</td>
				<td>性别</td>
				<td>地址</td>	
				<td>出生日期</td>
				<td>班级</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${list}" var="student">
				<tr>
				    <td><input type="checkbox" name="selectIds" value="${student.id}"></td>
					<td>${student.id}</td>
					<td>${student.name}</td>
					<td>${student.age}</td>
					<td>${student.gender}</td>
					<td>${student.address}</td>
					<td><a
						href="${pageContext.request.contextPath}/student/toupdate.action?id=${student.id}"
						method="post">修改</a>
						<%-- <a
						href="javascript:toupdentStudent('${Student.id}"
						method="post">修改</a>  --%>
						</td>
					<td>
					<%--  <a href="${pageContext.request.contextPath}/student/deleteById.action?id=${student.id}" method="post" >删除</a> --%>
					<a href="javascript:delStudent('${student.id}')"
						method="post" >删除</a> 
					</td> 
			</c:forEach>
		</table>	      
   </form>	
<!-- 列表结束  -->
	
	<!--分页开始  -->
				<div align="center">
					<nav aria-label="Page navigation">
					<ul class="pagination">
						<!-- 上一页 开始-->
						<c:if test="${pageBean.pageIndex==1}">
						  <li class="disabled"><a href="javascript:void(0)" aria-label="Previous">
						      <span aria-hidden="true">&laquo;</span>
							</a>
						  </li>
						</c:if>
		
						<c:if test="${pageBean.pageIndex!=1}">
							<li>
							   <a href="javascript:goPage('${pageBean.pageIndex-1 }');"
								aria-label="Previous">
							      <span aria-hidden="true">&laquo;</span>
							   </a>
							</li>
						</c:if>
					   <!-- 上一页 结束-->
						<c:forEach begin="1" end="${pageBean.totalpage}" var="page">
							<c:if test="${pageBean.pageIndex!=page}">
								
						             <li><a href="javascript:goPage('${page}');">${page}</a></li> 
							</c:if>
					   <!-- 遍历的时候page和pageIndex相等，高亮显示 -->
							<c:if test="${pageBean.pageIndex==page}">
							  
							  <li class="active"><a href="javascript:goPage('${page}');">${page}</a></li>
							</c:if>
						</c:forEach>
						<!-- 下一页开始   -->
						<c:if test="${pageBen.pageIndex==pageBean.totalpage }">
							<li class="disabled"><a href="javascript:void(0)" aria-label="Next">
							 <span aria-hidden="true">&raquo;</span>
							</li>
						</c:if>
						<c:if test="${pageBen.pageIndex!=pageBean.totalpage}">
								 <li>
									<a href="javascript:goPage('${pageBean.pageIndex+1 }');"
										aria-label="previous"> 
								    <span aria-hidden="true">&raquo;</span>
									</a>
								 </li>
						</c:if>
						<!-- 下一页结束   -->
					</ul>
					</nav>
			    	</div>    
			<!-- 分页结束 -->	
</body>
</html>