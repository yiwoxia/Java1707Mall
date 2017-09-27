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
<!-- 调head路径 -->
<%@include file="../common/head.jsp" %>
<script type="text/javascript">
	function goPage(pageIndex) {
		$("#pageIndex").val(pageIndex);
		$("#a").submit();
	}
	//单个删除
	function deleProduct(id){
		var isDel = confirm("您确认要删除吗？")
		if(isDel){
			location.href="${ctx}/mall/deleteById.action?id=" + id;
		}
	}
	//全部删除
/* 	function delProduct(){
		   var isDel = confirm("您确认要删除吗？");
		     if(isDel){
		    		$("#mainForm").submit();
		    	 //要删除
		    	 $("#mainForm").attr("action","${ctx}/mall/deleteById.action");
		     }
		
		} */
</script>
</head>
<body>

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
					<li role="presentation"><a href="${ctx}/mall/toaddProdutct.action" method="post">添加学生</a></li>
				</ul>
		  <!-- 右边栏结束结束	 -->	
		  
		  	
 <!--  多条件查询开始  -->
		  <form action="${ctx}/mall/seacherByCondition.action" method="post" class="form-inline" id="a" style="margin-left: 90px;" >

				<!-- 用于查找+分页 记录反的页数 -->
					<input type="hidden" name="pageIndex" id="pageIndex" /> 
				
					<label for="exampleInputName2" >商品编号：</label> 
					  <input type="text" name="product.category_id" class="form-control" id="exampleInputName2" placeholder="商品编号"
						value="${condition.product.category_id}" style="width: 90px; " /> 
						<button type="submit" class="btn btn-default">搜索</button>
					</div>
			</form> 
 <!--  多条件查询结束 -->
<!-- 列表开始  -->
			<form id="mainForm" method="post">
            <table class="table table-striped table-bordered table-hover"style="width: 800px;" align="center">
			<tr>
			    <td><input type="checkbox" onclick="selectAll();" id="slectAlls" /></td>
			    <td>商品id</td>
				<td>分类id</td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>货存</td>
				<td>商品副标题</td>
				<td>商品图片</td>
				<td>状态</td>
				<td>创建日期</td>
				<td>更新日期</td>	
				<td colspan="2">操作</td>
			</tr>
			
			<c:forEach items="${pageBean.list}" var="product">
				<tr>
				   <td><input type="checkbox" name="selectIds" value="${product.id}"></td>
					<td>${product.id}</td>
					<td>${product.category_id}</td>
					<td>${product.name}</td>
					<td>${product.price}</td>
					<td>${product.stock}</td>
					<td>${product.subtitle}</td>
					<td><img alt="" src="/pic/${product.main_image}" width="50" height="50"></td>
					<c:if test="${product.status==1}">
						<td>在售</td>
					</c:if>
					<c:if test="${product.status==2}">
						<td>下架</td>
					</c:if>
					<td>${product.create_time}</td>
					<td>${product.update_time}</td>
					<td><a href="${ctx}/mall/toupdateProduct.action?id=${product.id}"
						method="post">修改</a>
					<td>
					<a href="javascript:deleProduct('${product.id}')"
						method="post" >删除</a> 
					</td> 
				</tr>
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