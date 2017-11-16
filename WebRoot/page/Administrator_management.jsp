<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Admin"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="../common/css/luzou.css" />
<link rel="stylesheet" type="text/css" href="../common/css/calendar1.css" />
<script src="../common/lib/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../common/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../common/js/jquery.date_input.pack.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../common/page/js/Administrator_management.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/pager/jquery.z-pager.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/pager/pager.css">
<style type="text/css">
		.header-title{
		width:54%;
	}
	.header-author{
		width:15%;
	}
	.header-status{
		width:15%;
	}
	.header-operate{
		width:15%;
	}
	
	.column-content{
		width:54%;
	}
	.column-content .position-square{
		width:30px;
	}
	.column-author{
		width:15%;
	    position: relative;
    	left: 3%;
	}
	.column-status{
		text-align: center;
		width:15%;
	}
	.column-operate{
		width:15%;
		padding:0;
		text-align: center;
	}
</style>
</head>

<%
	List<Admin> admins = Server_Function.getadmin();
	request.setAttribute("admin", admins);
%>

<body>

	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li class="position-header-click" onclick="Tag(1);">
					<img src="../common/image/icon-1.png" />
					<p>全部</p>
				</li>
				<li onclick="Tag(2);">
					<img src="../common/image/icon-2.png" />
					<p>超级管理员</p>
				</li>
				<li onclick="Tag(3);">
					<img src="../common/image/icon-3.png" />
					<p>编辑</p>
				</li>
				<li onclick="Tag(4);">
					<img src="../common/image/icon-4.png" />
					<p>财务</p>
					</li>

			</ul>
		</div>
		<div class="position-content">
			<div class="position-status">
				
				<select name="admin_Tag" class="input-text" id="tag-change">
					<option value="">状态选择</option>
					<option value="1">正常</option>
					<option value="2">离职</option> 
					<option value="3">休假</option> 
				</select>
				<input type="text" placeholder="日期查找" class="input-rate " id="rate-search" /> 
				<input type="text" name="name" id="guanjianzi_search" value="" placeholder="关键字" class="input-rate key-bord" /> 
				<a href="admin-add.jsp" class="rebuild">添加管理员</a>
			</div>
			<div class="position-write">
				<ul class="clearfix">
					<li class="header-title">头像昵称</li>
					<li class="header-author">联系方式</li>
					<li class="header-author">状态</li>
					<li class="header-operate">操作</li>
				</ul>
			</div>
			<div class="position-show">
				<ul class="clearfix" id="clear-fix-1">
				</ul>
				<ul class="clearfix" style="display: none;" id="clear-fix-2">
				</ul>
				<ul class="clearfix" style="display: none;" id="clear-fix-3">
				</ul>
				<ul class="clearfix" style="display: none;" id="clear-fix-4">
				</ul>
			</div>
		</div>
		<div class="position-footer">
			<input type="radio" class="select-all" />全选 <a href="###" class="position-delete">删除</a> 
				<div id="page-1" class="pager clearfix"></div>
				<div id="page-2" class="pager clearfix"></div>
				<div id="page-3" class="pager clearfix"></div>
				<div id="page-4" class="pager clearfix"></div>
		</div>
	</div>

	<script type="text/javascript">
	var flag = 1;
		$(function() {
			//切换样式选项卡
			$(".position-header ul li").click(function() {
				$(this).addClass("position-header-click").siblings().removeClass("position-header-click");
			})
	
			var lis = $('.position-header ul li');
			var listxt = $('.position-show ul');
			lis.click(function() {
				$(this).addClass('li-clicked').siblings().removeClass('li-clicked');
				var index = lis.index(this);
				listxt.eq(index).show().siblings().hide();
	
			});
	
			//input点击效果
			$(".input-status .input-recommend").focus(function() {
				$(this).css("background-image", "none");
			})
			//列表操作
			$(".position-circle").click(function() {
				$(this).addClass("list-click");
			})
			$(".rebuild").click(function() {
				$(this).css("background", "#00C8E8");
			})
			$(".icon-webpage").click(function() {
				window.location.href = "content.jsp"
			})
			$(".icon-del").click(function() {
				$(this).parent().parent().remove();
			})
			//全选
			$(".select-all").click(function() {
				$(".position-circle").addClass("list-click");
				$(".position-delete").click(function() {
					$(".position-show ul li").remove();
					$(this).css("color", "#00C8E8");
				})
			})
			//删除
			$(".position-delete").click(function() {
				$(".list-click").parent().parent().remove();
				$(this).css("color", "#00C8E8");
			})
	
			//选择日期
			$('#rate-search').date_input();
	
	
			//关键字搜索
			var a = $('.key-bord').val();
			$('.position ul li').each(function() {})
		})
		function Tag(value){
			$("ul[id^='clear-fix-']").hide();
			$("#clear-fix-"+value).show();
			$("div[id^='page-']").hide();
			$("#page-"+value).show();
			flag = value;
		}
		
		$("#tag-change").change(function() {
			$.ajax({
				url : "/mServer/add_admin?Tag=" + flag,
				type : "POST",
				data : {
					"admin_Tag" : $("#tag-change").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
						var admin_Tag = data[i].admin_Tag;
						var admin_message = "";
						if(admin_Tag == "1"){
							admin_message = "正常";
						}else if(admin_Tag == "2"){
							admin_message = "离职";
						}else if(admin_Tag == "3"){
							admin_message = "休假";
						}
						str +='<li>'+
					    '<p class="position-show-title column-content">'+
					    '<i class="position-circle"></i>'+
					    '<img class="position-square" src="'+data[i].picture+'" />'+
					    '<span class="position-title">'+
					        '<span>'+data[i].name+'</span>'+
					        '<span class="position-share">审核内容:时间:'+new Date(data[i].register_time).format("yyyy-MM-dd")+'</span>'+
					    '</span>'+
						'</p>'+
						'<p class="position-author column-author">'+
						    '<span>'+
						        '<span>'+data[i].phone+'</span>'+
						    '</span>'+	
						'</p>'+
						'<p class="position-author column-author">'+
					        '<span>'+admin_message+'</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/admin-add.jsp?id='+data[i].id+'"></a>'+
						    '<a class="icon-edit icon-del" href="/mServer/add_admin?type=delete&del_id='+data[i].id+'"></a></i>'+
						'</p>'+
					'</li>';
	
					}
					console.log(str)
					$("#clear-fix-"+flag).html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
		
		$("#guanjianzi_search").blur(function() {
			$.ajax({
				url : "/mServer/add_admin?Tag=" + flag,
				type : "POST",
				data : {
					"name" : $("#guanjianzi_search").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
						var admin_Tag = data[i].admin_Tag;
						var admin_message = "";
						if(admin_Tag == "1"){
							admin_message = "正常";
						}else if(admin_Tag == "2"){
							admin_message = "离职";
						}else if(admin_Tag == "3"){
							admin_message = "休假";
						}
						str +='<li>'+
					    '<p class="position-show-title column-content">'+
					    '<i class="position-circle"></i>'+
					    '<img class="position-square" src="'+data[i].picture+'" />'+
					    '<span class="position-title">'+
					        '<span>'+data[i].name+'</span>'+
					        '<span class="position-share">审核内容:时间:'+new Date(data[i].register_time).format("yyyy-MM-dd")+'</span>'+
					    '</span>'+
						'</p>'+
						'<p class="position-author column-author">'+
						    '<span>'+
						        '<span>'+data[i].phone+'</span>'+
						    '</span>'+	
						'</p>'+
						'<p class="position-author column-author">'+
					        '<span>'+admin_message+'</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/admin-add.jsp?id='+data[i].id+'"></a>'+
						    '<a class="icon-edit icon-del" href="/mServer/add_admin?type=delete&del_id='+data[i].id+'"></a></i>'+
						'</p>'+
					'</li>';
	
					}
	
	
					$("#clear-fix-"+flag).html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
		$("#rate-search").change(function() {
	
	
			$.ajax({
				url : "/mServer/add_admin?Tag=" + flag,
				type : "POST",
				data : {
					"register_time" : $("#rate-search").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var data = message.data.results;
					var str = "";
					for (var i in data) {
						var admin_Tag = data[i].admin_Tag;
						var admin_message = "";
						if(admin_Tag == "1"){
							admin_message = "正常";
						}else if(admin_Tag == "2"){
							admin_message = "离职";
						}else if(admin_Tag == "3"){
							admin_message = "休假";
						}
						str +='<li>'+
					    '<p class="position-show-title column-content">'+
					    '<i class="position-circle"></i>'+
					    '<img class="position-square" src="'+data[i].picture+'" />'+
					    '<span class="position-title">'+
					        '<span>'+data[i].name+'</span>'+
					        '<span class="position-share">审核内容:时间:'+new Date(data[i].register_time).format("yyyy-MM-dd")+'</span>'+
					    '</span>'+
						'</p>'+
						'<p class="position-author column-author">'+
						    '<span>'+
						        '<span>'+data[i].phone+'</span>'+
						    '</span>'+	
						'</p>'+
						'<p class="position-author column-author">'+
					        '<span>'+admin_message+'</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/admin-add.jsp?id='+data[i].id+'"></a>'+
						    '<a class="icon-edit icon-del" href="/mServer/add_admin?type=delete&del_id='+data[i].id+'"></a></i>'+
						'</p>'+
					'</li>';
					}
	
	
					$("#clear-fix-"+flag).html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
	</script>
</body>
</html>
