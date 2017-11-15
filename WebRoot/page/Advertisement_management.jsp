﻿<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Guanggao_model"%>
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
<script type="text/javascript" src="../common/page/js/Advertisement_management.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/pager/jquery.z-pager.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/pager/pager.css">
<style>
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
	.column-image{
		width:12%;
	}
	.column-position{
		width:98%;
	}
</style>
</head>


<%
	List<Guanggao_model> list = Server_Func.getguanggao();
	request.setAttribute("list", list);
%>
<body>
	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li class="position-header-click"><img
					src="../common/image/icon-1.png" />
					<p>全部</p></li>
			</ul>
		</div>
		<div class="position-content">
			<div class="position-status">
				<select name="shangjia_Tag" id="shangjia_Tag" class="input-text">
					<option value="">状态</option>
					<option value="">正常</option>
					<option value="">已过期</option>
				</select> 
				<input type="text" placeholder="日期查找" name="time" class="input-rate " id="rate-search" /> 
				<input type="text" name="guanggao_name" id="guanggao_name" value="" placeholder="关键字" class="input-rate key-bord" /> 
				<select name="orderBy" id="orderBy" class="third-select">
					<option value="">排序</option>
					<option value="dianji_count,desc">点击量从高到低</option>
					<option value="dianji_count,asc">点击量从低到高</option>
				</select> <a href="advert-add.jsp" class="rebuild">添加广告</a>
			</div>
			<div class="position-write">
				<ul class="clearfix">
					<li class="position-show-title1 header-title">广告内容</li>
					<li class="position-author1 header-author">时间</li>
					<li class="position-ye header-status">状态</li>
					<li class="position-de header-operate">操作</li>
				</ul>
			</div>
			<div class="position-show">
				<ul class="clearfix" id="clear-fix-1">
				</ul>
				<ul class="clearfix" id="clear-fix-2">
				</ul> 
				<ul class="clearfix" id="clear-fix-3">
				</ul>
<!-- 				<ul class="clearfix"> -->
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title column-content"> -->
<!-- 								<i class="position-circle "></i> <span class="position-title"> -->
<%-- 									<span class="advert-manage column-image"> <img src="${list.picture}" --%>
<!-- 										alt="" /> -->
<%-- 								</span> <span class="advert-position column-position">${list.url}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-author column-author"> -->
<%-- 								<span class="position-title advert-time"> ${list.time} </span> --%>
<!-- 							</p> -->
<!-- 							<p class="position-author column-status"> -->
<!-- 								<span class="position-title advert-time"> -->
<%-- 									${list.shangjia_message}</span> --%>
<!-- 							</p> -->
<!-- 							<p class="edit-exit column-operate"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/advert-add.jsp"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->

<%-- 					</c:forEach> --%>

<!-- 				</ul> -->

<!-- 				<ul class="clearfix" style="display: none;"> -->
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle "></i> <span class="position-title"> -->
<%-- 									<span class="advert-manage"> <img src="${list.picture}" --%>
<!-- 										alt="" /> -->
<%-- 								</span> <span class="advert-position">${list.url}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title advert-time"> ${list.time} </span> --%>
<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<!-- 								<span class="position-title advert-time"> -->
<%-- 									${list.shangjia_message}</span> --%>
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/advert-update.jsp"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->

<%-- 					</c:forEach> --%>
<!-- 				</ul> -->
<!-- 				<ul class="clearfix" style="display: none;"> -->
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle "></i> <span class="position-title"> -->
<%-- 									<span class="advert-manage"> <img  src="${list.picture}" --%>
<!-- 										alt="" /> -->
<%-- 								</span> <span class="advert-position">${list.url}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title advert-time"> ${list.time} </span> --%>
<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<!-- 								<span class="position-title advert-time"> -->
<%-- 									${list.shangjia_message}</span> --%>
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/advert-update.jsp"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->

<%-- 					</c:forEach> --%>
<!-- 				</ul> -->
			</div>
		</div>
		<div class="position-footer">
			<input type="radio" class="select-all" />全选 
			<a href="###" class="position-delete">删除</a> 
			<div id="page-1" class="pager clearfix"></div>
<!-- 			<div id="page-2" class="pager clearfix"></div> -->
<!-- 			<div id="page-3" class="pager clearfix"></div> -->
		</div>
	</div>

	<script type="text/javascript">
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
				window.location.href = "advert-update.jsp"
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
			
		$("#rate-search").change(function() {
			$.ajax({
				url : "/mServer/Handle_guanggao?Tag=1",
				type : "POST",
				data : {
					"time" : $("#rate-search").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
	
						str +='<li>'+
								    '<p class="position-show-title column-content">'+
								    '<i class="position-circle "></i>'+
								    '<span class="position-title">'+
								        '<span class="advert-manage column-image">'+
								            '<img src="'+data.picture+'" alt="" />'+
								        '</span>'+
								        '<span class="advert-position column-position">'+data.url+'</span>'+
								    '</span>'+
								'</p>'+
								'<p class="position-author column-author">'+
								    '<span class="position-title advert-time">'+data.time+'</span>'+
								'</p>'+
								'<p class="position-author column-status">'+
								    '<span class="position-title advert-time">'+
								        data.shangjia_message+
								    '</span>'+
								'</p>'+
								'<p class="edit-exit column-operate">'+
								    '<a class="icon-edit icon-webpage" href="/mServer/page/advert-add.jsp?type=edit&id='+data.id+'"></a>'+
								    '<a class="icon-edit icon-del" href="/mServer/GuanggaoServlet?type=delete&id='+data.id+'"></a>'
								'</p>'+
							'</li>';
	
					}
	
	
					$("#clear-fix").html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
		
		$("#orderBy").change(function() {
			$.ajax({
				url : "/mServer/Handle_guanggao?Tag=1",
				type : "POST",
				data : {
					"orderBy" : $("#orderBy").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
	
						str +='<li>'+
							    '<p class="position-show-title column-content">'+
							    '<i class="position-circle "></i>'+
							    '<span class="position-title">'+
							        '<span class="advert-manage column-image">'+
							            '<img src="'+data.picture+'" alt="" />'+
							        '</span>'+
							        '<span class="advert-position column-position">'+data.url+'</span>'+
							    '</span>'+
							'</p>'+
							'<p class="position-author column-author">'+
							    '<span class="position-title advert-time">'+data.time+'</span>'+
							'</p>'+
							'<p class="position-author column-status">'+
							    '<span class="position-title advert-time">'+
							        data.shangjia_message+
							    '</span>'+
							'</p>'+
							'<p class="edit-exit column-operate">'+
							    '<a class="icon-edit icon-webpage" href="/mServer/page/advert-add.jsp?type=edit&id='+data.id+'"></a>'+
							    '<a class="icon-edit icon-del" href="/mServer/GuanggaoServlet?type=delete&id='+data.id+'"></a>'
							'</p>'+
						'</li>';
			
					}
	
	
					$("#clear-fix").html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
		
		$("#guanggao_name").blur(function() {
			$.ajax({
				url : "/mServer/Handle_guanggao?Tag=1",
				type : "POST",
				data : {
					"guanggao_name" : $("#guanggao_name").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
	
						str +='<li>'+
								    '<p class="position-show-title column-content">'+
								    '<i class="position-circle "></i>'+
								    '<span class="position-title">'+
								        '<span class="advert-manage column-image">'+
								            '<img src="'+data.picture+'" alt="" />'+
								        '</span>'+
								        '<span class="advert-position column-position">'+data.url+'</span>'+
								    '</span>'+
								'</p>'+
								'<p class="position-author column-author">'+
								    '<span class="position-title advert-time">'+data.time+'</span>'+
								'</p>'+
								'<p class="position-author column-status">'+
								    '<span class="position-title advert-time">'+
								        data.shangjia_message+
								    '</span>'+
								'</p>'+
								'<p class="edit-exit column-operate">'+
								    '<a class="icon-edit icon-webpage" href="/mServer/page/advert-add.jsp?type=edit&id='+data.id+'"></a>'+
								    '<a class="icon-edit icon-del" href="/mServer/GuanggaoServlet?type=delete&id='+data.id+'"></a>'
								'</p>'+
							'</li>';
	
					}
	
	
					$("#clear-fix").html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
		$("#shangjia_Tag").change(function() {
	
	
			$.ajax({
				url : "/mServer/Handle_guanggao?Tag=1",
				type : "POST",
				data : {
					"shangjia_Tag" : $("#shangjia_Tag").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var data = message.data.results;
					var str = "";
					for (var i in data) {
						str +='<li>'+
								    '<p class="position-show-title column-content">'+
								    '<i class="position-circle "></i>'+
								    '<span class="position-title">'+
								        '<span class="advert-manage column-image">'+
								            '<img src="'+data.picture+'" alt="" />'+
								        '</span>'+
								        '<span class="advert-position column-position">'+data.url+'</span>'+
								    '</span>'+
								'</p>'+
								'<p class="position-author column-author">'+
								    '<span class="position-title advert-time">'+data.time+'</span>'+
								'</p>'+
								'<p class="position-author column-status">'+
								    '<span class="position-title advert-time">'+
								        data.shangjia_message+
								    '</span>'+
								'</p>'+
								'<p class="edit-exit column-operate">'+
								    '<a class="icon-edit icon-webpage" href="/mServer/page/advert-add.jsp?type=edit&id='+data.id+'"></a>'+
								    '<a class="icon-edit icon-del" href="/mServer/GuanggaoServlet?type=delete&id='+data.id+'"></a>'
								'</p>'+
							'</li>';
					}
	
	
					$("#clear-fix").html(str);
				},
				error : function() {
					alert("error");
				}
			});
		})
			
		})
	</script>
</body>
</html>
