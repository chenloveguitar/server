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
// 	List<Pinglun_model> list1 = Server_Function.getpinglun_toutiao();
// 	request.setAttribute("list1", list1);
// 	List<Pinglun_model> list2 = Server_Function.getpinglun_faxian();
// 	request.setAttribute("list2", list2);
// 	List<Pinglun_model> list3 = Server_Function.getpinglun_quchu();
// 	request.setAttribute("list3", list3);
// 	List<Pinglun_model> list4 = Server_Function.getpinglun_commodity();
// 	request.setAttribute("list4", list4);
// 	List<Pinglun_model> list5 = Server_Function.getpinglun_fuwu();
// 	request.setAttribute("list5", list5);
// 	List<Pinglun_model> list6 = new ArrayList<Pinglun_model>();
// 	list6.addAll(list1);
// 	list6.addAll(list2);
// 	list6.addAll(list3);
// 	list6.addAll(list4);
// 	list6.addAll(list5);
// 	request.setAttribute("list6", list6);
%>
<body>
	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li class="position-header-click" onclick="Tag(1)"><img
					src="../common/image/icon-1.png">
					<p>全部</p></li>
				<li onclick="Tag(2)"><img src="../common/image/icon-3.png">
					<p>头条</p></li>
				<li onclick="Tag(3)"><img src="../common/image/icon-7.png">
					<p>发现</p></li>
				<li onclick="Tag(4)"><img src="../common/image/icon-8.png">
					<p>去处</p></li>
				<li onclick="Tag(5)"><img src="../common/image/icon-9.png">
					<p>商品</p></li>
				<li onclick="Tag(6)"><img src="../common/image/icon-9.png">
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
<!-- 					<option value="yuedu,desc">阅读量从高到低</option> -->
<!-- 					<option value="yuedu,asc">阅读量从低到高</option> -->
					<option value="dianzan_count,desc">点赞量从高到低</option>
					<option value="dianzan_count,asc">点赞量从低到高</option>
					<option value="time,desc">日期从早到晚</option>
					<option value="time,asc">日期从晚到早</option>
				</select> <a href="comment-add.jsp" class="rebuild">添加评论</a>
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
	var tag = 1;
		$(function() {
			Tag(1);
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
			//选择日期
			$('#rate-search').date_input();
			$("#change_recommend").change(function() {
				$.ajax({
					url : "/mServer/PinglunServlet",
					type : "POST",
					data : {
						"Tag":tag,
// 						"tuijian_Tag" : "=,"+$("#change_recommend").val(),
						"type":"search"
					},
					dataType : "json",
					success : function(data) {
						data = data.data.results;
						var str = "";
						for (var i in data) {
							var lianmu = "";
							var table_name = data[i]["table_name"];
							switch(table_name){
							case "toutiao":
								lianmu = "头条";
								break;
							case "faxian":
								lianmu = "发现";
								break;
							case "quchu":
								lianmu = "去处";
								break;
							case "commodity":
								lianmu = "商品";
								break;
							case "fuwu":
								lianmu = "服务";
								break;
							}
							str +=  "<li>"+
							"<p class=\"position-show-title column-content\">"+
//							 <img class=\"position-square\"src=\"#\" /> " +//" + data["pictures"][0]["picture_url"] + 
								"<i class=\"position-circle\"></i>"+
								"<span class=\"position-title\" id=\"position-title-1\"> " +
								"<span>" + data[i]["content"] + "</span>"+
								"<span class=\"position-share\">阅读量:" + /*data[i]["yuedu_count"]*/ 0 + "&nbsp;分享:" + /*data[i]["share_count"]*/ 0 + "&nbsp;点赞:"+data[i]["dianzan_count"]+"&nbsp;收藏:"+ /*data[i]["shoucang_count"]*/ 0 +"&nbsp;时间:" + data[i]["time"] + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"position-author column-author\">";
							if(data[i]["pingluner_name"]){
								str += "<img class=\"icon-author\" src=\""+data[i]["pingluner_touxiang"]+"\">";								
							}
							str += "<span class=\"position-title\" id=\"position-title-2\"> " +
									"<span>" + data[i]["pingluner_name"] + "</span>" +
//									"<span class=\"position-share\">" + data[i]["qianming"] + "</span>"+
								"</span>"+
							"</p>"+
							
							"<p class=\"position-public column-status\">"+
								"<span class=\"position-title position-p\" id=\"position-title-3\">"+
									"<span>" + lianmu + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"edit-exit column-operate\">"+
								"<a class=\"icon-edit icon-webpage\" href='comment-add.jsp?updete_id=" + data[i]["id"] + "'></a>"+
								"<a class=\"icon-edit icon-del\" href=/mServer/PinglunServlet?type=delete&id=" + data[i]["id"] + " \"></a>"+
							"</p>"+
						"</li>";
						}
						$("#clear-fix").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			});
			$("#searchIcon").click(function() {
				$.ajax({
					url : "/mServer/PinglunServlet",
					type : "POST",
					data : {
						"Tag":tag,
						"content" : $("#guanjianzi_search").val(),
						"type":"search"
					},
					dataType : "json",
					success : function(data) {
						data = data.data.results;
						var str = "";
						for (var i in data) {
							var lianmu = "";
							var table_name = data[i]["table_name"];
							switch(table_name){
							case "toutiao":
								lianmu = "头条";
								break;
							case "faxian":
								lianmu = "发现";
								break;
							case "quchu":
								lianmu = "去处";
								break;
							case "commodity":
								lianmu = "商品";
								break;
							case "fuwu":
								lianmu = "服务";
								break;
							}
							str +=  "<li>"+
							"<p class=\"position-show-title column-content\">"+
//							 <img class=\"position-square\"src=\"#\" /> " +//" + data["pictures"][0]["picture_url"] + 
								"<i class=\"position-circle\"></i>"+
								"<span class=\"position-title\" id=\"position-title-1\"> " +
								"<span>" + data[i]["content"] + "</span>"+
								"<span class=\"position-share\">阅读量:" + /*data[i]["yuedu_count"]*/ 0 + "&nbsp;分享:" + /*data[i]["share_count"]*/ 0 + "&nbsp;点赞:"+data[i]["dianzan_count"]+"&nbsp;收藏:"+ /*data[i]["shoucang_count"]*/ 0 +"&nbsp;时间:" + data[i]["time"] + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"position-author column-author\">";
							if(data[i]["pingluner_name"]){
								str += "<img class=\"icon-author\" src=\""+data[i]["pingluner_touxiang"]+"\">";								
							}
							str += "<span class=\"position-title\" id=\"position-title-2\"> " +
									"<span>" + data[i]["pingluner_name"] + "</span>" +
//									"<span class=\"position-share\">" + data[i]["qianming"] + "</span>"+
								"</span>"+
							"</p>"+
							
							"<p class=\"position-public column-status\">"+
								"<span class=\"position-title position-p\" id=\"position-title-3\">"+
									"<span>" + lianmu + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"edit-exit column-operate\">"+
								"<a class=\"icon-edit icon-webpage\" href='comment-add.jsp?updete_id=" + data[i]["id"] + "'></a>"+
								"<a class=\"icon-edit icon-del\" href=/mServer/PinglunServlet?type=delete&id=" + data[i]["id"] + " \"></a>"+
							"</p>"+
						"</li>";
						}
						$("#clear-fix").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			})
			$("#sort").change(function() {
				$.ajax({
					url : "/mServer/PinglunServlet",
					type : "POST",
					data : {
						"Tag":tag,
						"type":"search",
						"orderBy" : $("#sort").val()
					},
					dataType : "json",
					success : function(data) {
						data = data.data.results;
						var str = "";
						for (var i in data) {
							var lianmu = "";
							var table_name = data[i]["table_name"];
							switch(table_name){
							case "toutiao":
								lianmu = "头条";
								break;
							case "faxian":
								lianmu = "发现";
								break;
							case "quchu":
								lianmu = "去处";
								break;
							case "commodity":
								lianmu = "商品";
								break;
							case "fuwu":
								lianmu = "服务";
								break;
							}
							str +=  "<li>"+
							"<p class=\"position-show-title column-content\">"+
//							 <img class=\"position-square\"src=\"#\" /> " +//" + data["pictures"][0]["picture_url"] + 
								"<i class=\"position-circle\"></i>"+
								"<span class=\"position-title\" id=\"position-title-1\"> " +
								"<span>" + data[i]["content"] + "</span>"+
								"<span class=\"position-share\">阅读量:" + /*data[i]["yuedu_count"]*/ 0 + "&nbsp;分享:" + /*data[i]["share_count"]*/ 0 + "&nbsp;点赞:"+data[i]["dianzan_count"]+"&nbsp;收藏:"+ /*data[i]["shoucang_count"]*/ 0 +"&nbsp;时间:" + data[i]["time"] + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"position-author column-author\">";
							if(data[i]["pingluner_name"]){
								str += "<img class=\"icon-author\" src=\""+data[i]["pingluner_touxiang"]+"\">";								
							}
							str += "<span class=\"position-title\" id=\"position-title-2\"> " +
									"<span>" + data[i]["pingluner_name"] + "</span>" +
//									"<span class=\"position-share\">" + data[i]["qianming"] + "</span>"+
								"</span>"+
							"</p>"+
							
							"<p class=\"position-public column-status\">"+
								"<span class=\"position-title position-p\" id=\"position-title-3\">"+
									"<span>" + lianmu + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"edit-exit column-operate\">"+
								"<a class=\"icon-edit icon-webpage\" href='comment-add.jsp?updete_id=" + data[i]["id"] + "'></a>"+
								"<a class=\"icon-edit icon-del\" href=/mServer/PinglunServlet?type=delete&id=" + data[i]["id"] + " \"></a>"+
							"</p>"+
						"</li>";
						}
						$("#clear-fix").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			})
			
			$("#rate-search").change(function() {
				$.ajax({
					url : "/mServer/PinglunServlet",
					type : "POST",
					data : {
						"Tag":tag,
						"type":"search",
						"time" : $("#rate-search").val()?new Date($("#rate-search").val()).format("yyyy-MM-dd"):""
					},
					dataType : "json",
					success : function(data) {
						data = data.data.results;
						var str = "";
						for (var i in data) {
							var lianmu = "";
							var table_name = data[i]["table_name"];
							switch(table_name){
							case "toutiao":
								lianmu = "头条";
								break;
							case "faxian":
								lianmu = "发现";
								break;
							case "quchu":
								lianmu = "去处";
								break;
							case "commodity":
								lianmu = "商品";
								break;
							case "fuwu":
								lianmu = "服务";
								break;
							}
							str +=  "<li>"+
							"<p class=\"position-show-title column-content\">"+
//							 <img class=\"position-square\"src=\"#\" /> " +//" + data["pictures"][0]["picture_url"] + 
								"<i class=\"position-circle\"></i>"+
								"<span class=\"position-title\" id=\"position-title-1\"> " +
								"<span>" + data[i]["content"] + "</span>"+
								"<span class=\"position-share\">阅读量:" + /*data[i]["yuedu_count"]*/ 0 + "&nbsp;分享:" + /*data[i]["share_count"]*/ 0 + "&nbsp;点赞:"+data[i]["dianzan_count"]+"&nbsp;收藏:"+ /*data[i]["shoucang_count"]*/ 0 +"&nbsp;时间:" + data[i]["time"] + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"position-author column-author\">";
							if(data[i]["pingluner_name"]){
								str += "<img class=\"icon-author\" src=\""+data[i]["pingluner_touxiang"]+"\">";								
							}
							str += "<span class=\"position-title\" id=\"position-title-2\"> " +
									"<span>" + data[i]["pingluner_name"] + "</span>" +
//									"<span class=\"position-share\">" + data[i]["qianming"] + "</span>"+
								"</span>"+
							"</p>"+
							
							"<p class=\"position-public column-status\">"+
								"<span class=\"position-title position-p\" id=\"position-title-3\">"+
									"<span>" + lianmu + "</span>"+
								"</span>"+
							"</p>"+
							"<p class=\"edit-exit column-operate\">"+
								"<a class=\"icon-edit icon-webpage\" href='comment-add.jsp?updete_id=" + data[i]["id"] + "'></a>"+
								"<a class=\"icon-edit icon-del\" href=/mServer/PinglunServlet?type=delete&id=" + data[i]["id"] + " \"></a>"+
							"</p>"+
						"</li>";
						}
						$("#clear-fix").html(str);
					},
					error : function() {
						alert("error");
					}
				});
			})
		});
		function Tag(a) {
			$("ul[id^='clear-fix-']").hide();
			$("#clear-fix-"+a).show();
			$("div[id^='page-']").hide();
			$("#page-"+a).show();
			tag = a;
		}
		function tiaozhuan(a) {
			window.location.href = "comment-detail.jsp?id=" + a;
		}
		
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
