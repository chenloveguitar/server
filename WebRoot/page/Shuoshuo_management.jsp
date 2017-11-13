<%@page
	import="com.magicmoble.luzhouapp.model.server.Shuoshuo_xiangqing"%>
<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page import="com.magicmoble.luzhouapp.business.ShuoshuoBusiness"%>
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
<script type="text/javascript" src="../common/page/js/Shuoshuo_management.js"></script>
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
</style>
<%
	List<Shuoshuo_xiangqing> list = Server_Func.limitShuoshuo_ser(1, 10);
	request.setAttribute("list", list);
%>
</head>
<body>
	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li class="position-header-click"><img src="../common/image/icon-1.png" />
				<p>全部</p></li>
			</ul>
		</div>
		<div class="position-content">
			<div class="position-status">
				<select name="" class="input-text" id="change_recommend">
					<option value="0">是否推荐</option>
					<option value="1">正在推荐</option>
					<option value="3">推荐到期</option>
					<option value="2">从未推荐</option>
				</select>  
				<input type="text" placeholder="日期查找" class="input-text" id="rate-search" name="searchDate"/>
				<input type="text" name="searchWords" id="guanjianzi_search" value="" placeholder="关键字" class="input-rate"/>
				<a id="searchIcon" href="javascript:void(0);" style="height: 32px; padding: 0; margin: 0; position: relative; top: 14px; left: -71px; border: 0px;">
					<img src="../common/image/search.png">
				</a>
				<select name="" class="third-select" id="sort">
					<option value="">排序</option>
					<option value="yuedu,desc">阅读量从高到低</option>
					<option value="yuedu,asc">阅读量从低到高</option>
					<option value="dianzan_count,desc">点赞量从高到低</option>
					<option value="dianzan_count,asc">点赞量从低到高</option>
					<option value="time,desc">日期从早到晚</option>
					<option value="time,asc">日期从晚到早</option>
				</select> <a href="Add_Shuoshuo.jsp" class="rebuild">添加说说</a>
			</div>
			<div class="position-write">
				<ul class="clearfix">
					<li class="position-show-title1 header-title">标题内容</li>
					<li class="position-author1 header-author">作者</li>
					<li class="position-ye header-status">推荐状态</li>
					<li class="position-de header-operate">操作</li>
				</ul>
			</div>
			<div class="position-show">
				<ul class="clearfix" id="clear-fix-1">
<%-- 					<c:forEach var="list" items="${list}"> --%>
<!-- 						<li> -->
<!-- 							<p class="position-show-title column-content"> -->
<!-- 								<i class="position-circle"></i> <img class="position-square" -->
<%-- 									src="${list.pictures.get(0).picture_url}" /> <span --%>
<%-- 									class="position-title" id="position-title-1"> <span>${list.content}</span> --%>
<%-- 									<span class="position-share">阅读量:${list.yuedu_count} --%>
<%-- 										分享:${list.share_count} 时间:${list.time}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-author column-author"> -->
<%-- 								<img class="icon-author" src="${list.releaser_touxiang}"> --%>
<%-- 								<span class="position-title" id="position-title-2"> <span>${list.name}</span> --%>
<%-- 									<span class="position-share">${list.qianming}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="position-public column-status"> -->
<!-- 								<span class="position-title position-p" id="position-title-3"> -->
<%-- 									<span>${list.tuijian_message}</span> --%>
<!-- 								</span> -->
<!-- 							</p> -->
<!-- 							<p class="edit-exit column-operate"> -->
<%-- 								<a class="icon-edit icon-webpage" href="<%=request.getContextPath()%>/Update_Shuoshuo?updete_id=${list.id}"></a> --%>
<%-- 								<a class="icon-edit icon-del"  href="<%=request.getContextPath()%>/Handle_Shuoshuo?del_id=${list.id}"></a> --%>
<!-- 							</p> -->
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
				</ul>
			</div>
		</div>
		<div class="position-footer">
				<div id="page-1" class="pager clearfix"></div>
<!-- 			<input type="radio" class="select-all" />全选 <a href="###" -->
<!-- 				class="position-delete">删除</a> <span> <a href="##">首页</a> <a -->
<!-- 				href="##">上一页</a> <a href="/mServer/PaginationServlet?pageno=1">1</a> -->
<!-- 				<a href="/mServer/PaginationServlet?pageno=2">2</a> <a -->
<!-- 				href="/mServer/PaginationServlet?pageno=3">3</a> <a href="##">下一页</a> -->
<!-- 				<a href="##">末页</a> -->
<!-- 			</span> -->
		</div>
	</div>

	<script type="text/javascript">
		function updateShuoshuo(id) {
			location.href = "<%=request.getContextPath()%>/Update_Shuoshuo?updete_id=" + id;
		}
		function deleteShuoshuo(id) {
			location.href = "<%=request.getContextPath()%>/Handle_Shuoshuo?del_id=" + id;
		}
		function ChangeDateFormat(d) {
			//将时间戳转为int类型，构造Date类型
			var date = new Date(parseInt(d.time, 10));
	
			//月份得+1，且只有个位数时在前面+0
			var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) :
				date.getMonth() + 1;
	
			//日期为个位数时在前面+0
			var currentDate = date.getDate() < 10 ? "0" + date.getDate() :
				date.getDate(); //getFullYear得到4位数的年份 ，返回一串字符串 return
			date.getFullYear() + "-" + month + "-" + currentDate + " " +
			date.getHours() + ":" + date.getMinutes() + ":" +
			date.getSeconds() + "." + date.getMilliseconds();
		}
	
		$(function() { //改变推荐
			$("#change_recommend").change(function() {
				$.ajax({
					url : "/mServer/ShuoshuoServlet",
					type : "POST",
					data : {
						"tuijian_Tag" : "=,"+$("#change_recommend").val(),
						"type":"search"
						
					},
					dataType : "json",
					success : function(message) {
						message = message.data.results;
						var str = "";
						for (var i in message) {
							str += "<li>"
							str += "<p class=\"position-show-title column-content\">";
							str += "	<i class=\"position-circle\"></i> <img class=\"position-square\" "
							str += "	src=\"" + message[i]["pictures"][0]["picture_url"] + "\" /> <span"
							str += "	class=\"position-title\" id=\"position-title-1\"> <span>" + message[i]["content"] + "</span>"
							str += "		<span class=\"position-share\">阅读量:" + message[i]["yuedu_count"] + ""
							str += "			分享:" + message[i]["share_count"] + " 时间:" + message[i]["time"] + "</span>"
							str += "	</span>"
							str += "	</p>"
							str += "	<p class=\"position-author column-author\">"
							str += "		<img class=\"icon-author\" src=\""+message[i]["releaser_touxiang"]+"\"> <span class=\"position-title\""
							str += "		id=\"position-title-2\"> <span>" + message[i]["name"] + "</span> <span"
							str += "		class=\"position-share\">" + message[i]["qianming"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"position-public column-status\">"
							str += "		<span class=\"position-title position-p\" id=\"position-title-3\">"
							str += "			<span>" + message[i]["tuijian_message"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"edit-exit column-operate\">"
							str += "		<a class=\"icon-edit icon-webpage\" "
							str += "			href='tiaozhuan.jsp?updete_id=" + message[i]["id"] + " '></a>"
							str += "	<a class=\"icon-edit icon-del\" "
							str += "		href=tiaozhuan.jsp?del_id=" + message[i]["id"] + " \"></a>"
							str += "	</p>"
							str += "</li>"
						}
						$("#clear-fix-1").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			});
			$("#searchIcon").click(function() {
				$.ajax({
					url : "/mServer/ShuoshuoServlet",
					type : "POST",
					data : {
						"content" : " like,'%"+$("#guanjianzi_search").val()+"%'",
						"type":"search"
					},
					dataType : "json",
					success : function(message) {
						message = message.data.results;
						var str = "";
						for (var i in message) {
							str += "<li>"
							str += "<p class=\"position-show-title column-content\">";
							str += "	<i class=\"position-circle\"></i> <img class=\"position-square\" "
							str += "	src=\"" + message[i]["pictures"][0]["picture_url"] + "\" /> <span"
							str += "	class=\"position-title\" id=\"position-title-1\"> <span>" + message[i]["content"] + "</span>"
							str += "		<span class=\"position-share\">阅读量:" + message[i]["yuedu_count"] + ""
							str += "			分享:" + message[i]["share_count"] + " 时间:" + message[i]["time"] + "</span>"
							str += "	</span>"
							str += "	</p>"
							str += "	<p class=\"position-author column-author\">"
							str += "		<img class=\"icon-author\" src=\""+message[i]["releaser_touxiang"]+"\"> <span class=\"position-title\""
							str += "		id=\"position-title-2\"> <span>" + message[i]["name"] + "</span> <span"
							str += "		class=\"position-share\">" + message[i]["qianming"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"position-public column-status\">"
							str += "		<span class=\"position-title position-p\" id=\"position-title-3\">"
							str += "			<span>" + message[i]["tuijian_message"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"edit-exit column-operate\">"
							str += "		<a class=\"icon-edit icon-webpage\" "
							str += "			href='tiaozhuan.jsp?updete_id=" + message[i]["id"] + " '></a>"
							str += "	<a class=\"icon-edit icon-del\" "
							str += "		href=tiaozhuan.jsp?del_id=" + message[i]["id"] + " \"></a>"
							str += "	</p>"
							str += "</li>"
						}
						$("#clear-fix-1").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			})
			$("#sort").change(function() {
				$.ajax({
					url : "/mServer/ShuoshuoServlet",
					type : "POST",
					data : {
						"type":"search",
						"orderBy" : $("#sort").val()
					},
					dataType : "json",
					success : function(message) {
						message = message.data.results;
						var str = "";
						for (var i in message) {
							str += "<li>"
							str += "<p class=\"position-show-title column-content\">";
							str += "	<i class=\"position-circle\"></i> <img class=\"position-square\" "
							str += "	src=\"" + message[i]["pictures"][0]["picture_url"] + "\" /> <span"
							str += "	class=\"position-title\" id=\"position-title-1\"> <span>" + message[i]["content"] + "</span>"
							str += "		<span class=\"position-share\">阅读量:" + message[i]["yuedu_count"] + ""
							str += "			分享:" + message[i]["share_count"] + " 时间:" + message[i]["time"] + "</span>"
							str += "	</span>"
							str += "	</p>"
							str += "	<p class=\"position-author column-author\">"
							str += "		<img class=\"icon-author\" src=\""+message[i]["releaser_touxiang"]+"\"> <span class=\"position-title\""
							str += "		id=\"position-title-2\"> <span>" + message[i]["name"] + "</span> <span"
							str += "		class=\"position-share\">" + message[i]["qianming"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"position-public column-status\">"
							str += "		<span class=\"position-title position-p\" id=\"position-title-3\">"
							str += "			<span>" + message[i]["tuijian_message"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"edit-exit column-operate\">"
							str += "		<a class=\"icon-edit icon-webpage\" "
							str += "			href='tiaozhuan.jsp?updete_id=" + message[i]["id"] + " '></a>"
							str += "	<a class=\"icon-edit icon-del\" "
							str += "		href=tiaozhuan.jsp?del_id=" + message[i]["id"] + " \"></a>"
							str += "	</p>"
							str += "</li>"
						}
						$("#clear-fix-1").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			})
			
			$("#rate-search").change(function() {
				$.ajax({
					url : "/mServer/ShuoshuoServlet",
					type : "POST",
					data : {
						"type":"search",
						"time" : "like,'%"+ new Date($("#rate-search").val()).format("yyyy-MM-dd") + "%'"
					},
					dataType : "json",
					success : function(message) {
						message = message.data.results;
						var str = "";
						for (var i in message) {
							str += "<li>"
							str += "<p class=\"position-show-title column-content\">";
							str += "	<i class=\"position-circle\"></i> <img class=\"position-square\" "
							str += "	src=\"" + message[i]["pictures"][0]["picture_url"] + "\" /> <span"
							str += "	class=\"position-title\" id=\"position-title-1\"> <span>" + message[i]["content"] + "</span>"
							str += "		<span class=\"position-share\">阅读量:" + message[i]["yuedu_count"] + ""
							str += "			分享:" + message[i]["share_count"] + " 时间:" + message[i]["time"] + "</span>"
							str += "	</span>"
							str += "	</p>"
							str += "	<p class=\"position-author column-author\">"
							str += "		<img class=\"icon-author\" src=\""+message[i]["releaser_touxiang"]+"\"> <span class=\"position-title\""
							str += "		id=\"position-title-2\"> <span>" + message[i]["name"] + "</span> <span"
							str += "		class=\"position-share\">" + message[i]["qianming"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"position-public column-status\">"
							str += "		<span class=\"position-title position-p\" id=\"position-title-3\">"
							str += "			<span>" + message[i]["tuijian_message"] + "</span>"
							str += "		</span>"
							str += "	</p>"
							str += "	<p class=\"edit-exit column-operate\">"
							str += "		<a class=\"icon-edit icon-webpage\" "
							str += "			href='tiaozhuan.jsp?updete_id=" + message[i]["id"] + " '></a>"
							str += "	<a class=\"icon-edit icon-del\" "
							str += "		href=tiaozhuan.jsp?del_id=" + message[i]["id"] + " \"></a>"
							str += "	</p>"
							str += "</li>"
						}
						$("#clear-fix-1").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			})
			
	
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
		
	/**  
	 * 日期格式化（原型扩展或重载）  
	 * 格式 YYYY/yyyy/ 表示年份  
	 * MM/M 月份  
	 * dd/DD/d/D 日期  
	 * @param {formatStr} 格式模版  
	 * @type string  
	 * @returns 日期字符串  
	 */  
	Date.prototype.format = function(formatStr){   
	        var str = formatStr;   
	        var Week = ['日','一','二','三','四','五','六'];   
	        str=str.replace(/yyyy|YYYY/,this.getFullYear());  
	        str=str.replace(/MM/,(this.getMonth()+1)>9?(this.getMonth()+1).toString():'0' + (this.getMonth()+1));   
	        str=str.replace(/dd|DD/,this.getDate()>9?this.getDate().toString():'0' + this.getDate());   
	       return str;   
	} 
	</script>

</body>
</html>
