<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page import="com.magicmoble.luzhouapp.model.server.User_model"%>
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
<script src="../common/page/js/User_management.js"></script>
</head>
<%
	List<User_model> list = Server_Func.get_User();
	request.setAttribute("list", list);
	List<User_model> list2 = Server_Func.get_mingren();
	request.setAttribute("list2", list2);
	List<User_model> list3 = Server_Func.get_qiye();
	request.setAttribute("list3", list3);
	List<User_model> list4 = Server_Func.get_bianji();
	request.setAttribute("list4", list4);
	List<User_model> list6 = Server_Func.get_tuijian_user();
	request.setAttribute("list6", list6);
	List<User_model> list5 = new ArrayList<User_model>();
	list5.addAll(list);
	list5.addAll(list2);
	list5.addAll(list3);
	list5.addAll(list4);

	request.setAttribute("list5", list5);
%>
<body>
	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li class="position-header-click" onclick="Tag(1)"><img
					src="../common/image/icon-1.png" />
					<p>全部</p></li>
				<li onclick="Tag(2)"><img src="../common/image/icon-2.png" />
					<p>推荐</p></li>
				<li onclick="Tag(3)"><img src="../common/image/icon-3.png" />
					<p>普通用户</p></li>
				<li onclick="Tag(4)"><img src="../common/image/icon-4.png" />
					<p>名人</p></li>
				<li onclick="Tag(5)"><img src="../common/image/icon-5.png" />
					<p>团体企业</p></li>
				<li onclick="Tag(6)"><img src="../common/image/icon-6.png" />
					<p>编辑组</p></li>

			</ul>
		</div>
		<div class="position-content">
			<div class="position-status">
				<select name="classify" id="classify" class="input-text">
					<option value="">分类查找</option>
					<option value="1">个人已加V</option>
					<option value="2">第三方注册</option>
					<option value="3">手机注册</option>
				</select> 
				<select name="" class="input-text" id="sex-change">
					<option value="">性别</option>
					<option value="男">男</option>
					<option value="女">女</option> 
				</select>
					<input type="text" name="" id="guangjianzi_search" value="" placeholder="关键字" class="input-rate" />
					<a href="javascript:void(0);" id="guangjianzi_search_button" style="position: absolute; z-index: 2; margin-left: -70px; margin-top: 8px;">
						<img src="${pageContext.request.contextPath}/common/image/search.png">
					</a> 
					<select name="orderBy" id="orderBy" class="third-select">
					<option value="">排序</option>
					<option value="fensi,desc">粉丝量从高到低</option>
					<option value="fensi,asc">粉丝量从低到高</option>
					<option value="guanzhu,desc">关注量从高到低</option>
					<option value="guanzhu,asc">关注量从低到高</option>
					<option value="shuoshuo,desc">发布说说量从高到低</option>
					<option value="shuoshuo,asc">发布说说量从低到高</option>
					<option value="time,desc">注册时间从早到晚</option>
					<option value="time,asc">注册时间从晚到早</option>
				</select> <a href="user-add.jsp" class="rebuild">添加用户</a>
			</div>
			<div class="position-show">
				<ul class="clearfix" id="clear-fix-1">
<%-- 					<c:forEach var="list" items="${list5}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.touxiang}" /> <span class="position-title"> --%>
<%-- 									<span>${list.name}</span> <span class="position-share">粉丝:${list.fensi} --%>
<%-- 										关注:${list.guanzhu} 时间:${list.time}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title"> <span>${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>加V说明</span> -->
<%-- 									<span class="position-share">${list.renzheng_Tag}</span> --%>
<!-- 								</span> <span class="position-title position-p"> <span>余额</span> -->
<%-- 									<span class="position-share">剩余${list.qianbao}元</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/user-update.jsp?id=${list.id}"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>

				<ul class="clearfix" id="clear-fix-2" style="display: none;">
<%-- 					<c:forEach var="list" items="${list6}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.touxiang}" /> <span class="position-title"> --%>
<%-- 									<span>${list.name}</span> <span class="position-share">粉丝:${list.fensi} --%>
<%-- 										关注:${list.guanzhu} 时间:${list.time}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title"> <span>${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>加V说明</span> -->
<%-- 									<span class="position-share">${list.renzheng_Tag}</span> --%>
<!-- 								</span> <span class="position-title position-p"> <span>余额</span> -->
<%-- 									<span class="position-share">剩余${list.qianbao}元</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/user-update.jsp?id=${list.id}"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
				<ul class="clearfix" id="clear-fix-3" style="display: none;">
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.touxiang}" /> <span class="position-title"> --%>
<%-- 									<span>${list.name}</span> <span class="position-share">粉丝:${list.fensi} --%>
<%-- 										关注:${list.guanzhu} 时间:${list.time}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title"> <span>${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>加V说明</span> -->
<%-- 									<span class="position-share">${list.renzheng_Tag}</span> --%>
<!-- 								</span> <span class="position-title position-p"> <span>余额</span> -->
<%-- 									<span class="position-share">剩余${list.qianbao}元</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/user-update.jsp?id=${list.id}"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
				<ul class="clearfix" id="clear-fix-4" style="display: none;">
<%-- 					<c:forEach var="list" items="${list2}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.touxiang}" /> <span class="position-title"> --%>
<%-- 									<span>${list.name}</span> <span class="position-share">粉丝:${list.fensi} --%>
<%-- 										关注:${list.guanzhu} 时间:${list.time}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title"> <span>${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>加V说明</span> -->
<%-- 									<span class="position-share">${list.renzheng_Tag}</span> --%>
<!-- 								</span> <span class="position-title position-p"> <span>余额</span> -->
<%-- 									<span class="position-share">剩余${list.qianbao}元</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/user-update.jsp?id=${list.id}"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
				<ul class="clearfix" id="clear-fix-5" style="display: none;">
<%-- 					<c:forEach var="list" items="${list3}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.touxiang}" /> <span class="position-title"> --%>
<%-- 									<span>${list.name}</span> <span class="position-share">粉丝:${list.fensi} --%>
<%-- 										关注:${list.guanzhu} 时间:${list.time}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title"> <span>${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>加V说明</span> -->
<%-- 									<span class="position-share">${list.renzheng_Tag}</span> --%>
<!-- 								</span> <span class="position-title position-p"> <span>余额</span> -->
<%-- 									<span class="position-share">剩余${list.qianbao}元</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/user-update.jsp?id=${list.id}"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
				<ul class="clearfix" id="clear-fix-6" style="display: none;">
<%-- 					<c:forEach var="list" items="${list4}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.touxiang}" /> <span class="position-title"> --%>
<%-- 									<span>${list.name}</span> <span class="position-share">粉丝:${list.fensi} --%>
<%-- 										关注:${list.guanzhu} 时间:${list.time}</span> --%>
<!-- 								</span> -->

<!-- 							</p> -->
<!-- 							<p class="position-author"> -->
<%-- 								<span class="position-title"> <span>${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public"> -->
<!-- 								<span class="position-title position-p"> <span>加V说明</span> -->
<%-- 									<span class="position-share">${list.renzheng_Tag}</span> --%>
<!-- 								</span> <span class="position-title position-p"> <span>余额</span> -->
<%-- 									<span class="position-share">剩余${list.qianbao}元</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/page/user-update.jsp?id=${list.id}"></a> <i --%>
<!-- 									class="icon-edit icon-del"></i> -->
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
			</div>
		</div>
		<div class="position-footer">
			<input type="radio" class="select-all" />全选 <a href="###" class="position-delete">删除</a> 
				<div id="page-1" class="pager clearfix"></div>
				<div id="page-2" class="pager clearfix hide"></div>
				<div id="page-3" class="pager clearfix hide"></div>
				<div id="page-4" class="pager clearfix hide"></div>
				<div id="page-5" class="pager clearfix hide"></div>
				<div id="page-6" class="pager clearfix hide"></div>
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
				listxt.eq(index).attr("id", "clear-fix").siblings().removeAttr("id");
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
	
		function Tag(a) {
			$("ul[id^='clear-fix-']").hide();
			$("#clear-fix-"+a).show();
			$("div[id^='page-']").hide();
			$("#page-"+a).show();
			flag = a;
		}
	
		$("#classify").change(function() {
			$.ajax({
				url : "/mServer/Handle_user?Tag=" + flag,
				type : "POST",
				data : {
					"classify" : $("#classify").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
	
						str +='<li>'+
					    '<p class="position-show-title">'+
					    '<i class="position-circle"></i>'+
					    '<img class="position-square" src="'+data[i].touxiang_picture+'" />'+
					    '<span class="position-title">'+
					        '<span>'+data[i].name+'</span>'+
					        '<span class="position-share">粉丝:'+data[i].fensi+' 关注:'+data[i].guanzhu+' 时间:'+data[i].time+'</span>'+
					    '</span>'+
						'</p>'+
						'<p class="position-author">'+
						    '<span class="position-title">'+
						        '<span>'+data[i].qianming+'</span>'+
						    '</span>'+	
						'</p>'+
						'<p class="position-public">'+
						    '<span class="position-title position-p">'+
						        '<span>加V说明</span>'+
						        '<span class="position-share">'+data[i].renzheng_Tag+'</span>'+
						    '</span>'+
						    '<span class="position-title position-p">'+
						        '<span>余额</span>'+
						        '<span class="position-share">剩余'+data[i].qianbao+'元</span>'+
						    '</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/user-add.jsp?id='+data[i].id+'"></a>'+
						    '<a class="icon-edit icon-del" href="/mServer/Handle_user?type=delete&del_id='+data[i].id+'"></a></i>'+
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
				url : "/mServer/Handle_user?Tag=" + flag,
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
					    '<p class="position-show-title">'+
					    '<i class="position-circle"></i>'+
					    '<img class="position-square" src="'+data[i].touxiang_picture+'" />'+
					    '<span class="position-title">'+
					        '<span>'+data[i].name+'</span>'+
					        '<span class="position-share">粉丝:'+data[i].fensi+' 关注:'+data[i].guanzhu+' 时间:'+data[i].time+'</span>'+
					    '</span>'+
						'</p>'+
						'<p class="position-author">'+
						    '<span class="position-title">'+
						        '<span>'+data[i].qianming+'</span>'+
						    '</span>'+	
						'</p>'+
						'<p class="position-public">'+
						    '<span class="position-title position-p">'+
						        '<span>加V说明</span>'+
						        '<span class="position-share">'+data[i].renzheng_Tag+'</span>'+
						    '</span>'+
						    '<span class="position-title position-p">'+
						        '<span>余额</span>'+
						        '<span class="position-share">剩余'+data[i].qianbao+'元</span>'+
						    '</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/user-add.jsp?id='+data[i].id+'"></a>'+
						    '<a class="icon-edit icon-del" href="/mServer/Handle_user?type=delete&del_id='+data[i].id+'"></a></i>'+
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
		
		$("#guangjianzi_search").blur(function() {
			$.ajax({
				url : "/mServer/Handle_user?Tag=" + flag,
				type : "POST",
				data : {
					"name" : $("#guangjianzi_search").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var str = "";
					var data = message.data.results;
					for (var i in data) {
	
						str +='<li>'+
					    '<p class="position-show-title">'+
					    '<i class="position-circle"></i>'+
					    '<img class="position-square" src="'+data[i].touxiang_picture+'" />'+
					    '<span class="position-title">'+
					        '<span>'+data[i].name+'</span>'+
					        '<span class="position-share">粉丝:'+data[i].fensi+' 关注:'+data[i].guanzhu+' 时间:'+data[i].time+'</span>'+
					    '</span>'+
						'</p>'+
						'<p class="position-author">'+
						    '<span class="position-title">'+
						        '<span>'+data[i].qianming+'</span>'+
						    '</span>'+	
						'</p>'+
						'<p class="position-public">'+
						    '<span class="position-title position-p">'+
						        '<span>加V说明</span>'+
						        '<span class="position-share">'+data[i].renzheng_Tag+'</span>'+
						    '</span>'+
						    '<span class="position-title position-p">'+
						        '<span>余额</span>'+
						        '<span class="position-share">剩余'+data[i].qianbao+'元</span>'+
						    '</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/user-add.jsp?id='+data[i].id+'"></a>'+
						    '<a class="icon-edit icon-del" href="/mServer/Handle_user?type=delete&del_id='+data[i].id+'"></a></i>'+
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
		$("#sex-change").change(function() {
	
	
			$.ajax({
				url : "/mServer/Handle_user?Tag=" + flag,
				type : "POST",
				data : {
					"sex" : $("#sex-change").val(),
					"type":"search"
				},
				dataType : "json",
				success : function(message) {
					var data = message.data.results;
					var str = "";
					for (var i in data) {
						str +='<li>'+
							    '<p class="position-show-title">'+
							    '<i class="position-circle"></i>'+
							    '<img class="position-square" src="'+data[i].touxiang_picture+'" />'+
							    '<span class="position-title">'+
							        '<span>'+data[i].name+'</span>'+
							        '<span class="position-share">粉丝:'+data[i].fensi+' 关注:'+data[i].guanzhu+' 时间:'+data[i].time+'</span>'+
							    '</span>'+
							'</p>'+
							'<p class="position-author">'+
							    '<span class="position-title">'+
							        '<span>'+data[i].qianming+'</span>'+
							    '</span>'+	
							'</p>'+
							'<p class="position-public">'+
							    '<span class="position-title position-p">'+
							        '<span>加V说明</span>'+
							        '<span class="position-share">'+data[i].renzheng_Tag+'</span>'+
							    '</span>'+
							    '<span class="position-title position-p">'+
							        '<span>余额</span>'+
							        '<span class="position-share">剩余'+data[i].qianbao+'元</span>'+
							    '</span>'+
							'</p>'+
							'<p class="edit-exit">'+
							    '<a class="icon-edit icon-webpage" href="/mServer/page/user-add.jsp?id='+data[i].id+'"></a>'+
							    '<a class="icon-edit icon-del" href="/mServer/Handle_user?type=delete&del_id='+data[i].id+'"></a>'+
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
	</script>
</body>
</html>
