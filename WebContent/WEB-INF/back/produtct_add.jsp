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
function uploadPic(){
		//定义参数
		var options = {
				url : "${pageContext.request.contextPath}/upload/uploadPic.action",
				dataType : "json",
				type : "post",
				success : function(data){
					$("#main_image").val(data.fileName);
					$("#imgId").attr("src" , "/pic/" + data.fileName);
				}
		};
		$("#form-add").ajaxSubmit(options);
	}
</script>
</head>
<body>
	
	<!-- 导航条  -->
	<jsp:include page="../common/logo.jsp" />
	<div class="container" >
		<div class="row">
			<!-- 左边导航栏开始  -->
			<div class="col-md-2" >
				<ul class="nav nav-pills nav-stacked">
					<li role="presentation" ><a href="${ctx}/student/pageList.action">学生管理</a></li>
				    <li role="presentation" class="active"><a href="${ctx }/student/toAddStudent.action">添加学生</a></li>
				</ul>
			</div>
			<!-- 左边导航栏结束  -->
			<!-- 右边栏开始  -->
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${ctx }/student/pageList.action">学生管理</a></li>
					<li role="presentation" class="active"><a href="${pageContext.request.contextPath }/student/toaddStudent.action">添加学生</a></li>
				</ul>
				<!-- 添加学生 开始 -->
				<form style="margin-top: 10px;" action="${ctx}/mall/addProdutCont.action" method="post" enctype="multipart/form-data" id="form-add">
				<div class="form-group">
					   <label for="exampleInputEmail1">货号</label>
					   <input type="text" name="id" class="form-control" id="exampleInputEmail1" placeholder="货号">
				  </div>
				  <div class="form-group">
					   <label for="exampleInputEmail1">商品编号</label>
					   <input type="text" name="category_id" class="form-control" id="exampleInputEmail1" placeholder="商品编号">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">商品名称</label>
					  <input type="text" name="name" class="form-control" id="exampleInputPassword1" placeholder="商品名称">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">状态</label>
					  <input type="text" name="subtitle" class="form-control" id="exampleInputPassword1" placeholder="商品价格">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">商品价格</label>
					  <input type="text" name="price" class="form-control" id="exampleInputPassword1" placeholder="货存">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">货存</label>
					  <input type="text" name="stock" class="form-control" id="exampleInputPassword1" placeholder="状态">
				  </div>
				   
				       <div class="form-group">
				       		<label>上传头像</label>
				           <img alt="" id="imgId" src="" width=100 height=100>
				           <input type="hidden" name="main_image" id="main_image"/>
				           <input type="file" name="pictureFile" onchange="uploadPic();"/>
				       </div>
				  
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
				<!-- 添加学生 结束 -->
			</div>
			<!-- 右边栏结束  -->
		</div>
	</div>
</body>
</html>