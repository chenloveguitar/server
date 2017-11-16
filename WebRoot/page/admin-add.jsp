<%@page import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
<!-- <link rel="stylesheet" href="../common/bootstrap/bootstrap.css"> -->
<!-- <link rel="stylesheet" href="../common/bootstrap/bootstrap-select.css"> -->
<link rel="stylesheet" type="text/css"
	href="../common/iconfont/content/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../common/css/luzou.css" />
<link rel="stylesheet" type="text/css" href="../common/css/calendar.css" />
<link rel="stylesheet" type="text/css"
	href="../common/css/calendar1.css" />
<script src="../common/lib/jquery-1.9.0.min.js" type="text/javascript"
	charset="utf-8"></script>
	<script type="text/javascript" src="../common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="http://www.js-css.cn/jscode/jquery.min.js"></script>
<script src="../common/js/jquery.min.js" type="text/javascript"
	charset="utf-8"></script>
<script src="../common/js/jquery.date_input.pack.js"
	type="text/javascript" charset="utf-8"></script>
<script src="../common/js/calendar.js" type="text/javascript"
	charset="utf-8"></script>
<script type="text/javascript"
	src="../common/lib/scripts/jquery-ui-1.7.2.custom.min.js"></script>
<link rel="Stylesheet" type="text/css"
	href="../common/lib/style/jqueryui/ui-lightness/jquery-ui-1.7.2.custom.css" />
<script type="text/javascript"
	src="../common/lib/scripts/jHtmlArea-0.8.min.js"></script>
<link rel="Stylesheet" type="text/css"
	href="../common/lib/style/jHtmlArea.css" />
<!-- bootstrap 下拉搜索框 -->
<script src="../common/lib/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../common/bootstrap/bootstrap.js"></script>
<script src="../common/bootstrap/bootstrap-select.js"></script>
<script src="../common/bootstrap/i18n/defaults-zh_CN.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/imageUpload.js"></script>
<link rel="Stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/imageUpload.css" />
<%
	String id = request.getParameter("id");
	Admin admin = Server_Function.findDataByTableAndId(Admin.class.getSimpleName().toLowerCase(), id, Admin.class);
	request.setAttribute("admin", admin);
%>
</head>
<body>
	<div class="user-add">
		<div class="user-add-content">
			<h2>添加管理员:</h2>
			<p>
				用户分类： 
				<select name="admin_leixing" id="admin_leixing">
					<option value="1">超级管理员</option>
					<option value="2">编辑</option>
					<option value="3">财务</option>
				</select>
			</p>
			<p>
				用户状态： 
				<select name="admin_Tag" id="admin_Tag">
					<option value="1">正常</option>
					<option value="2">离职</option>
					<option value="3">休假</option>
				</select>
			</p>
			<p>
				名字： <input type="text" id="name" placeholder="请输入名字" name="name" value="${admin.name}" />
			</p>
			<p>
				账号： <input type="text" id="admin_user" placeholder="请输入账号" name="admin_user" value="${admin.admin_user}" />
			</p>
			<p>
				密码： <input type="password" id="password" placeholder="请输入密码" name="password" value="${admin.password}"/>
			</p>
			<p>
				电话： <input type="text" id="phone" placeholder="请输入电话" name="phone" value="${admin.phone}"/>
			</p>
			<div class="header-up" style="height: 150px;">
				头像上传： 
				<div class="ad-content" style="background-color:#ddd;width: 125px;height: 125px; position: relative; top: -60px; left: 0px;border-radius: 5px;">
					<a href="javaScript:;">
						<img id="add_img" alt="" style="border-radius: 50%; position: relative; top: 45px; left: 45px;" src="../common/image/content-2.png">
						<input type="file" name="file" id="file" style="width:120px;height: 120px;opacity: 0;position: absolute; top: 0; left: 0;" name="" id="" value="" onchange="addImages(this);">
					</a>
				</div>
			</div>

			<div class="ad-add-save " style="margin: 50px;">
				<input type="submit" name="" id="banner" value="保存" class="ad-save">
				<input type="submit" name="" id="" value="取消" class="ad-cancel">
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	//添加头像图片
	function addImages(obj){
		$("#touxiang").remove();
		var url = window.URL.createObjectURL(obj.files[0]);
       	var name = obj.files[0].name;
		$("<img></img>").attr("src",url).attr("id","touxiang").attr("style","width:100%;height:100%;position: absolute;").insertBefore($("#file"));
        $("#add_img").remove();
    }
	
	$(function(){
		dataEcho();
		$(".ad-save").click(function(){
			$.ajax({
				url:"/mServer/add_admin",
				type:"post",
				dataType:"json",
				data:{
					name:$("#name").val(),
					admin_user:$("#admin_user").val(),
					password:$("#password").val(),
					phone:$("#phone").val(),
					admin_Tag:$("#admin_Tag").val(),
					admin_leixing:$("#admin_leixing").val(),
					id:"${admin.id}",
					type:"edit"
				},
				success:function(data){
					if(data.code == "0000"){
						var itemId = data.data;
						var fileNum = document.getElementById("file").files.length;
						if(fileNum > 0){
							$.ajaxFileUpload({
					            url: '/mServer/FileUploadServlet?parentId=null&deleteds=&itemId='+itemId+'&tableName=admin', //用于文件上传的服务器端请求地址
					            secureuri: false, //是否需要安全协议，一般设置为false
					            fileElementId: 'file', //文件上传域的ID
					            async:false,
					            dataType: 'json', //返回值类型 一般设置为json
					            success: function (data, status){
					            	var results = data.data;
					            	if(data.code === "0000"){
					            		alert("操作成功!");
					            	}else{
					            		alert("文件上传失败!");
					            	}
					            },error: function (data, status, e){
					           		alert("文件上传失败!");
					            }
					        });
						}
						window.location.href = "Administrator_management.jsp";
					}
				},
				error:function(data){
					
				}
			});
		});
		
		function dataEcho(){
			$("#admin_user").val("${admin.admin_user}");
			$("#password").val("${admin.password}");
			$("#name").val("${admin.name}");
			$("#phone").val("${admin.phone}");
			$("#admin_Tag").val("${admin.admin_Tag}");
			$("#admin_leixing").val("${admin.admin_leixing}");
			$("#touxiang").remove();
			var url = "${admin.picture}";
			console.log(url);
			var urls = url.split(",");
			console.log(urls)
			url  = urls[urls.length-2];

			if(url){
				$("<img></img>").attr("src",url).attr("id","touxiang").attr("style","width:100%;height:100%;position: absolute;").insertBefore($("#file"));
		        $("#add_img").remove();
			}
		}
		
		console.log("${admin}");
		
		$(".ad-cancel").click(function(){
			window.location.href = "User_management.jsp";
		});
		
	});
	</script>

</body>
</html>
