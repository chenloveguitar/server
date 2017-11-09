<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Toutiao"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/luzou.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/calendar1.css" />
<script src="${pageContext.request.contextPath}/common/lib/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/common/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/common/js/jquery.date_input.pack.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/pager/jquery.z-pager.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/pager/pager.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/common/page/js/Content_management_End.js"></script>
</head>
<%
	List<Toutiao> list = Server_Func.end();
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
				<input type="text" name="" value="" id="guangjianzi_search"
					placeholder="关键字" class="input-rate" />
						<a href="javascript:void(0);" id="guangjianzi_search_button" style="position: absolute; z-index: 2; margin-left: -70px; margin-top: 8px;">
							<img src="${pageContext.request.contextPath}/common/image/search.png">
						</a>
					 
				<select name="" id="change_paixu" class="third-select">
					<option value="">排序</option>
					<option value="时间由早到晚">时间由早到晚</option>
					<option value="时间由晚到早">时间由晚到早</option>
					<option value="转发量从高到低">转发量从高到低</option>
					<option value="转发量从低到高">转发量从低到高</option>
					<option value="点赞量从高到低">点赞量从高到低</option>
					<option value="点赞量从低到高">点赞量从低到高</option>
					<option value="阅读量从高到低">阅读量从高到低</option>
					<option value="阅读量从低到高">阅读量从低到高</option>
				</select>
			</div>
			<div class="position-write">
					<ul class="clearfix">
						<li class="position-show-title1">标题内容</li>
						<li class="position-author1">作者</li>
						<li class="position-fa">是否发布</li>
						<li class="position-red1">红包</li>
						<li class="position-red2">红包</li>
						<li class="position-ye">是否推广</li>
						<li class="position-de">操作</li>
					</ul>
				</div>
			<div class="position-show">

				<ul class="clearfix" id="clear-fix-1">
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i><img class="position-square" -->
<%-- 									src="${list.pictures.get(0).picture_url}" /> <span --%>
<!-- 									class="position-title"> <span>这里是标题</span> <span -->
<%-- 									class="position-share">阅读量:${list.yuedu_count} --%>
<%-- 										分享:${list.share_count} 收藏:${list.shoucang_count}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<img class="icon-author" src="${list.releaser_touxiang}"> --%>
<%-- 								<span class="position-title"> <span>${list.releaser_name}</span> --%>
<%-- 									<span class="position-share">${list.time}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>已下架</span> -->
<!-- 									<span class="position-share"></span> -->
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<!-- 								<p class="edit-exit"> -->
<!-- 								<a class="icon-edit icon-webpage" -->
<%-- 									href="<%=request.getContextPath()%>/page/content-detail2.jsp?chaxun_id=${list.id}&Tag=1"></a><a --%>
<!-- 									class="icon-edit icon-del" -->
<%-- 									href="<%=request.getContextPath()%>/Handle_NoExamine_neirong?del_id=${list.id}&Tag=1"></a> --%>
<!-- 							</p> -->
						
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
			</div>
		</div>
		<div class="position-footer">
			<input type="radio" class="select-all" />全选 <a href="###"
				class="position-delete">删除</a> 
				<div id="page-1" class="pager clearfix"></div>
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
			
			//关键字搜索
			var a = $('.key-bord').val();
			$('.position ul li').each(function() {})
			
			//改变推荐
			$(function() {
				$("#change_paixu").change(function() {
					
					
					$.ajax({
						url : "/mServer/Handle_end_neirong?Tag=" + flag,
						type : "POST",
						data : {
							"change_paixu" : $("#change_paixu").val()
						},
						dataType : "json",
						success : function(message) {
							console.log(message);
							var str = "";
							if(message.code == "0000"){
								var message = message.data.results;
								for (var i in message) {
									str += "	<li>"
									str += "		<p class=\"position-show-title\">"
									str += "		<i class=\"position-circle\"></i><img class=\"position-square\""
									str += "		src=\"" + message[i]["pictures"][0]["picture_url"] + "\"/> <span"
									str += "	class=\"position-title\"> <span>" + message[i]["title"] + "</span> <span"
									str += "	class=\"position-share\">阅读量:" + message[i]["yuedu_count"] + ""
									str += "	分享:" + message[i]["share_count"] + " 收藏:" + message[i]["shoucang_count"] + "</span>"
									str += "	</span>"
									str += "	</p>"
									str += "	<p class=\"position-author\">"
									str += "	<img class=\"icon-author\" src=\"" + message[i]["releaser_touxiang"] + "\">"
									str += "	<span class=\"position-title\"> <span>" + message[i]["releaser_name"] + "</span>"
									str += "	<span class=\"position-share\">" + message[i]["time"] + "</span>"
									str += "	</span>"
									str += "	</p>"
									str += "	<p class=\"position-public\">"
									str += "	<span class=\"position-title position-p\"> <span>" + message[i]["shenhe"] + "</span>"
									str += "		<span class=\"position-share\">" + message[i]["tuijian_Tag"] + "</span>"
									str += "		</span> <span class=\"position-title position-p\"> <span>点赞红包</span>"
									str += "			<span class=\"position-share\">剩余" + message[i]["dianzan_hongbao"] + "元</span>"
									str += "		</span> <span class=\"position-title position-p\"> <span>分享红包</span>"
									str += "		<span class=\"position-share\">剩余" + message[i]["share_hongbao"] + "元</span>"
									str += "		</span> <span class=\"position-title position-p\"> <span>" + message[i]["tuijian_message"] + "</span>"
									str += "			<span class=\"position-share\">剩余" + message[i]["days"] + "天</span>"
									str += "		</span>"
									str += "	</p>"
									str += "	<p class=\"edit-exit\">"
									str += "	<i class=\"icon-edit icon-webpage\"><a class=\"icon-edit icon-webpage\" href=\"/mServer/Handle_NoExamine_neirong?tableName="+message[i]["table_name"]+"&republish="+message[i]["id"]+"&Tag=1\"</i> <i"
									str += "	class=\"icon-edit icon-del\"><a class=\"icon-edit icon-del\" href=\"/mServer/Handle_NoExamine_neirong?tableName="+message[i]["table_name"]+"&del_id="+message[i]["id"]+"&Tag=1\"></a></i>"
									str += "	</p>"
									str += "	</li>"
								}
							}
							$("#clear-fix-1").html(str);
						},
						error : function() {
							alert("error");
						}
					});
				})
				
			$("#guangjianzi_search_button").click(function() {
				if($("#guangjianzi_search").val().trim() != ""){
					$.ajax({
						url : "/mServer/Handle_end_neirong?Tag=" + flag,
						type : "POST",
						data : {
							"guangjianzi_search" : $("#guangjianzi_search").val()
						},
						dataType : "json",
						success : function(message) {
							console.log(message)
							var str = "";
							if(message.code == "0000"){
								var message = message.data.results;
								for (var i in message) {
									str += "	<li>"
									str += "		<p class=\"position-show-title\">"
									str += "		<i class=\"position-circle\"></i><img class=\"position-square\""
									str += "		src=\"" + message[i]["pictures"][0]["picture_url"] + "\"/> <span"
									str += "	class=\"position-title\"> <span>" + message[i]["title"] + "</span> <span"
									str += "	class=\"position-share\">阅读量:" + message[i]["yuedu_count"] + ""
									str += "	分享:" + message[i]["share_count"] + " 收藏:" + message[i]["shoucang_count"] + "</span>"
									str += "	</span>"
									str += "	</p>"
									str += "	<p class=\"position-author\">"
									str += "	<img class=\"icon-author\" src=\"" + message[i]["releaser_touxiang"] + "\">"
									str += "	<span class=\"position-title\"> <span>" + message[i]["releaser_name"] + "</span>"
									str += "	<span class=\"position-share\">" + message[i]["time"] + "</span>"
									str += "	</span>"
									str += "	</p>"
									str += "	<p class=\"position-public\">"
									str += "	<span class=\"position-title position-p\"> <span>" + message[i]["shenhe"] + "</span>"
									str += "		<span class=\"position-share\">" + message[i]["tuijian_Tag"] + "</span>"
									str += "		</span> <span class=\"position-title position-p\"> <span>点赞红包</span>"
									str += "			<span class=\"position-share\">剩余" + message[i]["dianzan_hongbao"] + "元</span>"
									str += "		</span> <span class=\"position-title position-p\"> <span>分享红包</span>"
									str += "		<span class=\"position-share\">剩余" + message[i]["share_hongbao"] + "元</span>"
									str += "		</span> <span class=\"position-title position-p\"> <span>" + message[i]["tuijian_message"] + "</span>"
									str += "			<span class=\"position-share\">剩余" + message[i]["days"] + "天</span>"
									str += "		</span>"
									str += "	</p>"
									str += "	<p class=\"edit-exit\">"
									str += "	<i class=\"icon-edit icon-webpage\"><a class=\"icon-edit icon-webpage\" href=\"/mServer/Handle_NoExamine_neirong?tableName="+message[i]["table_name"]+"&republish="+message[i]["id"]+"&Tag=1\"</i> <i"
									str += "	class=\"icon-edit icon-del\"><a class=\"icon-edit icon-del\" href=\"/mServer/Handle_NoExamine_neirong?tableName="+message[i]["table_name"]+"&del_id="+message[i]["id"]+"&Tag=1\"></a></i>"
									str += "	</p>"
									str += "	</li>"
								}
							}
							$("#clear-fix-1").html(str);
						},
						error : function() {
							alert("error");
						}
					});
				}
			})
			})
		})
	</script>
</body>
</html>
