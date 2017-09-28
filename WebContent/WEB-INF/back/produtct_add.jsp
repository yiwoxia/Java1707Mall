<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.situ.mall.pojo.Product"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加商城</title>
<!-- 调head路径 -->
<%@include file="../common/head.jsp" %>
<style type="text/css">
		#categoryParentId,#categoryChildId{
			width: 20%;
			float: left;
			
		}
		#text{
			float: left;
			margin-top: 7px;
		}
		.form-group{
			clear: left;
		}
	</style>
<script type="text/javascript">
function uploadPic(){
		//定义参数
		var options = {
				url : "${pageContext.request.contextPath}/upload/uploadPic.action",
				dataType : "json",
				type : "post",
				success : function(data){
					$("#mainImage").val(data.fileName);
					$("#imgId").attr("src" , "/pic/" + data.fileName);
				}
		};
		$("#form-add").ajaxSubmit(options);
	}
	/*商品分类二级联动开始*/
	$(function(){

		$.ajax({
			url:"/Java1707Mall/category/categoryParent.action",
			dateType:"json",
			success:function(data,textStatus,ajax){
				//append_template(data, "province");
				var html = "<option value=''>-请选择1111-</option>";
				for(var i=0;i<data.length;i++){
					  html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
				}
				$("#categoryParentId").html(html);
			}
		});	
	});
	function selectCategories(obj){
		var parentId = $(obj).val();
		//清空子类下拉框中的内容，出第一项外
		$("#categoryChildId option:gt(0)").remove();
		$.ajax({
			url:"/Java1707Mall/category/category.action",
			//内容
			data:"parentId="+parentId,
			//类型
			dataType:"json",
			success:function(data,textStatus,ajax){
				//append_template(data, "city");
				var html = "<option value=''>-请选择-</option>"
				for(var i=0;i<data.length;i++){
					html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
				}
				$("#categoryChildId").html(html);
			}
		});
	}
	 function selectId() {
			var categoryParentVal = $("#categoryParentId").val();
			var categoryVal = $("#categoryChildId").val();
			
			if (categoryVal != '') {
				$("#categoryId").val(categoryVal);
			} else {
				$("#categoryId").val(categoryParentVal);
			}
		}

	   //封装其通用内容
	    function append_template(jsonData,target){
	        var length = jsonData.length;
	        var html = "<option value=''>-请选择-</option>";
	        for(var i=0;i<length;i++){
	            html +="<option value='"+data[i].id+"'>"+data[i].name+"</option>";
	        }
	        $("#"+target).html(html);
	    }; 
		/* 商品分类二级联动 结束 */

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
					<li role="presentation" ><a href="${prc }/mall/pageList.action">商品管理</a></li>
					<li role="presentation" class="active"><a href="javascript:void(0)">添加商品</a></li>
				</ul>
			</div>
			<!-- 左边导航栏结束  -->
			<!-- 右边栏开始  -->
			<div class="col-md-10">
				<ul class="nav nav-tabs">
					<li role="presentation" ><a href="${ctx }/student/pageList.action">商品管理</a></li>
					<li role="presentation" class="active"><a  href="javascript:void(0)">添加商品</a></li>
				</ul>
				<!-- 添加商品 开始 -->
				<form style="margin-top: 10px;" action="${ctx}/mall/addProdutCont.action" method="post" enctype="multipart/form-data" id="form-add">
				<!-- 商品分类开始 -->
				  <div class="form-group" onmouseout="selectId()" >
						<label for="exampleInputEmail1" id="text">产品分类：&nbsp;&nbsp;&nbsp;</label>
					    <select id="categoryParentId" onchange="selectCategories(this)" class="form-control select">
					       <option value="">-请选择-</option>
					    </select>
						<label for="exampleInputEmail1" id="text" >&nbsp;&nbsp;&nbsp;产品类型：&nbsp;&nbsp;&nbsp;</label>
					    <select id="categoryChildId" class="form-control select" >
					       <option value="">-请选择-</option>
					    </select>
				  </div>
				  <input type="hidden" id="categoryId" name="categoryId" >
				<!-- 商品分类结束 -->
				<div class="form-group">
					   <label for="exampleInputEmail1">商品名称</label>
					   <input type="text" name="name" class="form-control" id="exampleInputEmail1" placeholder="商品名称">
				  </div>
				  <div class="form-group">
					   <label for="exampleInputEmail1">	商品副标题</label>
					   <input type="text" name="subtitle" categoryId" class="form-control" id="exampleInputEmail1" placeholder="副标题">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">价格</label>
					  <input type="text" name="price" class="form-control" id="exampleInputPassword1" placeholder="价格">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">库存</label>
					  <input type="text" name="stock" class="form-control" id="exampleInputPassword1" placeholder="库存">
				  </div>
				  <div class="form_group">
						<label for="exampleInputPassword1">状态</label>
						<select name="status" class="form-control" >
							<option value="" >请选择</option>
							<option value="1">在售</option>
							<option value="2">下架</option>
							<option value="3" >删除</option>		
						</select>
					</div>
				<!--   
				  <div class="form-group">
					  <label for="exampleInputPassword1">商品价格</label>
					  <input type="text" name="price" class="form-control" id="exampleInputPassword1" placeholder="商品价格">
				  </div>
				  <div class="form-group">
					  <label for="exampleInputPassword1">货存</label>
					  <input type="text" name="stock" class="form-control" id="exampleInputPassword1" placeholder="货存">
				  </div> -->
				   
				       <div class="form-group">
				       		<label>上传头像</label>
				           <img alt="" id="imgId" src="" width=100 height=100>
				           <input type="hidden" name="mainImage" id="mainImage"/>
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