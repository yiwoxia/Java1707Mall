<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <%@include file="../common/head.jsp" %>
<style type="text/css">
	.float_left{
		float: left;
	}
	.float_right{
		float: right;
	}
	.clearfix{
		clear: both;	
	}
</style>
</head>
<body>
	
	 <!-- 顶部导航条 begin -->
	<nav class="navbar navbar-default">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">商城管理系统</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="${ctx}/product/pageList.action"><span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;商品管理 </a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;班级管理</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;课程管理</a></li>
	        <li><a href="#"><span class="glyphicon glyphicon-tag"></span>&nbsp;&nbsp;教务管理</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="/ShiXun09/login?method=logout"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a></li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<!-- 顶部导航条 end -->   
    <div  class="container">
    	<div class="row">
		    <div class="col-md-2">
				<ul class="nav nav-pills nav-stacked" >
				  <li role="presentation" class="active"><a href="${ctx }/product/getPageList.action">学生管理</a></li>
				  <li role="presentation"><a href="${ctx }/product/toAddProduct.action">添加商品</a></li>
				</ul>
		    </div>
			<div class="col-md-10">
				<form action="${ctx }/mall/updateProduct.action" method="post">
					<div class="form_group">
						<label for="exampleInputEmail1">商品Id</label>
						<input type="text" value="${product.id}"  name="id" readonly="readonly" class="form-control" id="exampleInputEmail1">
					</div>
					<div for="exampleInputEmail1">
						<label>分类id</label>
						<input type="text" value="${product.category_id}" class="form-control" id="exampleInputEmail1" name="category_id">
					</div>
					<div class="form_group">
						<label>商品名称</label>
						<input type="text" value="${product.name}" class="form-control" id="exampleInputPassword1" name="name">
					</div>
					<div class="form_group">
						<label>商品二级标题</label>
						<input type="text" value="${product.subtitle}" class="form-control" id="exampleInputPassword1" name="subtitle">
					</div>
					<div class="form_group">
						<label>商品价格</label>
						<input type="text" value="${product.price}" class="form-control" name="price">
					</div>
					<div class="form_group">
						<label>货存</label>
						<input type="text" value="${product.stock}" class="form-control" name="stock">
					</div>
					<div class="form_group">
						<label>状态</label>
						<input type="text" value="${product.status}" class="form-control" name="status">
					</div>
					<input type="submit" class="btn btn-default" value="修改">
				</form>
	    	</div>    
	    </div>
	</div>
	
</body>
</html>