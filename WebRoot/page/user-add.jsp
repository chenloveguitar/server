<%@page import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@page import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page import="com.magicmoble.luzhouapp.business.CommonBusiness"%>
<%@page import="com.magicmoble.luzhouapp.model.Login"%>
<%@page import="com.magicmoble.luzhouapp.model.Admin_xinxi"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
<link rel="stylesheet" href="../common/bootstrap/bootstrap.css">
<link rel="stylesheet" href="../common/bootstrap/bootstrap-select.css">
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
	Admin_xinxi admin_xinxi = Server_Function.findDataByTableAndId(Admin_xinxi.class.getSimpleName().toLowerCase(), id, Admin_xinxi.class);
	Login login = Server_Function.findDataByTableAndId(Login.class.getSimpleName().toLowerCase(), id, Login.class);
	request.setAttribute("admin_xinxi", admin_xinxi);
	request.setAttribute("login", login);
%>
</head>
<body>
	<div class="user-add">
		<div class="user-add-content">
			<h2>添加用户:</h2>
				<p>
					用户分类： 
					<select name="select" id="yonghu_Tag" name="yonghu_Tag" class="selectpicker">
						<option value="3">普通用户</option>
						<option value="1">名人</option>
						<option value="4">团体企业</option>
						<option value="2">编辑组</option>
					</select>
				</p>
				<p>
					账号： <input type="text" placeholder="请输入账号" name="zhanghao" id="zhanghao" value="${admin_xinxi.phone }"/>
				</p>
				<p>
					用户名： <input type="text" placeholder="请输入用户名" name="user_name" id="user_name" value="${admin_xinxi.name }"/>
				</p>
				<p>
					密码： <input type="password" placeholder="请输入密码" name="password" id="password" value="${login.password}"/>
				</p>

				<p>
					性别： 
					<input type="radio" name="sex" checked="checked" value="男" />男 
					<input type="radio" name="sex" value="女" />女
				</p>
				<p>
					签名： <input type="text" name="qianming" id="qianming" value="${admin_xinxi.qianming }" class="autograph" />
				</p>

				<div class="header-up" style="height: 150px;">
					头像上传： 
					<div class="ad-content" style="background-color:#ddd;width: 125px;height: 125px; position: relative; top: -60px; left: 0px;border-radius: 5px;">
						<a href="javaScript:;">
							<img id="add_img" alt="" style="border-radius: 50%; position: relative; top: 35px; left: 45px;" src="../common/image/content-2.png">
							<input type="file" name="file" id="file" style="width:120px;height: 120px;opacity: 0;position: absolute; top: 0; left: 0;" name="" id="" value="" onchange="addImages(this);">
						</a>
					</div>
				</div>
				<div class="ad-add-save " style="    margin: 50px;">
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
				url:"/mServer/Handle_user",
				type:"post",
				dataType:"json",
				data:{
					yonghu_Tag:$("#yonghu_Tag").val(),
					zhanghao:$("#zhanghao").val(),
					user_name:$("#user_name").val(),
					password:$("#password").val(),
					sex:$("input[type='radio']:checked").val(),
					qianming:$("#qianming").val(),
					id:"${admin_xinxi.id}",
					type:"edit"
					
				},
				success:function(data){
					if(data.code == "0000"){
						var itemId = data.data;
						var fileNum = document.getElementById("file").files.length;
						if(fileNum > 0){
							$.ajaxFileUpload({
					            url: '/mServer/FileUploadServlet?parentId=null&deleteds=&itemId='+itemId+'&tableName=admin_xinxi', //用于文件上传的服务器端请求地址
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
						window.location.href = "User_management.jsp";
					}
				},
				error:function(data){
					
				}
			});
		});
		
		function dataEcho(){
			var sex = '${admin_xinxi.sex}';
			$("#yonghu_Tag").val("${admin_xinxi.yonghu_Tag}");
			$("input[value='"+sex+"']").attr("checked","checked");
			$("#touxiang").remove();
			var url = "${admin_xinxi.touxiang_picture}";
			console.log(url);
			var urls = url.split(",");
			console.log(urls)
			url  = urls[0];
			$("<img></img>").attr("src",url).attr("id","touxiang").attr("style","width:100%;height:100%;position: absolute;").insertBefore($("#file"));
	        $("#add_img").remove();
		}
		
		$(".ad-cancel").click(function(){
			window.location.href = "User_management.jsp";
		});
		
	});
	</script>
</body>
</html>
