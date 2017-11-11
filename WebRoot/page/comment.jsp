<%@page import="com.magicmoble.luzhouapp.server.ctrl.add_user"%>
<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Pinglun_model"%>
<%@page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>评论管理</title>
<link rel="stylesheet" type="text/css" href="../common/css/luzou.css" />
<link rel="stylesheet" type="text/css" href="../common/css/calendar1.css" />
<script src="../common/lib/jquery-1.9.0.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../common/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../common/js/jquery.date_input.pack.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="../common/page/js/comment.js"></script>
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
</head>
<%
	List<Pinglun_model> list1 = Server_Function.getpinglun_toutiao();
	request.setAttribute("list1", list1);
	List<Pinglun_model> list2 = Server_Function.getpinglun_faxian();
	request.setAttribute("list2", list2);
	List<Pinglun_model> list3 = Server_Function.getpinglun_quchu();
	request.setAttribute("list3", list3);
	List<Pinglun_model> list4 = Server_Function.getpinglun_commodity();
	request.setAttribute("list4", list4);
	List<Pinglun_model> list5 = Server_Function.getpinglun_fuwu();
	request.setAttribute("list5", list5);
	List<Pinglun_model> list6 = new ArrayList<Pinglun_model>();
	list6.addAll(list1);
	list6.addAll(list2);
	list6.addAll(list3);
	list6.addAll(list4);
	list6.addAll(list5);
	request.setAttribute("list6", list6);
%>
<body>
	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li class="position-header-click"><img
					src="../common/image/icon-1.png">
					<p>全部</p></li>
				<li><img src="../common/image/icon-3.png">
					<p>头条</p></li>
				<li><img src="../common/image/icon-7.png">
					<p>发现</p></li>
				<li><img src="../common/image/icon-8.png">
					<p>去处</p></li>
				<li><img src="../common/image/icon-9.png">
					<p>商品</p></li>
				<li><img src="../common/image/icon-9.png">
					<p>服务</p></li>

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
				</select> <a href="Add_Shuoshuo.jsp" class="rebuild">添加评论</a>
			</div>
			<div class="position-write">
				<ul class="clearfix">
					<li class="position-show-title1 header-title">标题内容</li>
					<li class="position-author1 header-author">作者</li>
					<li class="position-ye header-status">栏目</li>
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
				<ul class="clearfix" id="clear-fix-4">
				</ul>
				<ul class="clearfix" id="clear-fix-5">
				</ul>
				<ul class="clearfix" id="clear-fix-6">
				</ul>
			</div>
		</div>
		<div class="position-footer">
				<div id="page-1" class="pager clearfix"></div>
				<div id="page-2" class="pager clearfix"></div>
				<div id="page-3" class="pager clearfix"></div>
				<div id="page-4" class="pager clearfix"></div>
				<div id="page-5" class="pager clearfix"></div>
				<div id="page-6" class="pager clearfix"></div>
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
			$(".icon-webpage").click(function() {
				window.location.href = "comment-update.jsp"
			})
			$(".icon-del").click(function() {
				$(this).parent().parent().remove();
			})
	
			//全选
			var fla = true;
			$(".select-all").click(function() {
				if (fla) {
					$(".position-circle").addClass("list-click");
					fla = false;
				} else {
					$(".position-circle").removeClass("list-click");
					fla = true;
				}
	
				$(".position-delete").click(function() {
					$(".position-show ul li").remove();
					$(this).css("color", "#00C8E8");
				})
			})
	
			var flag = true;
			$(".position-circle").click(function() {
				if ($(this).hasClass("list-click")) {
					$(this).removeClass('list-click');
				} else {
					$(this).addClass('list-click');
					$(this).parent().parent().find(".edit-exit").find(".icon-del").click(function() {
						$(this).parent().parent().remove();
					})
				}
			})
			//删除
			$(".position-delete").click(function() {
				$(".list-click").parent().parent().remove();
				$(this).css("color", "#00C8E8");
			})
	
		})
		function tiaozhuan(a) {
			window.location.href = "comment-detail.jsp?id=" + a;
	
	
		}
	</script>
</body>
</html>
