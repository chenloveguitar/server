<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Dingdan_model"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/common/pager/jquery.z-pager.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/pager/pager.css">
</head>



<%
	String order_type = request.getParameter("order_type");

	request.setAttribute("order_type", order_type);
%>

<body>
	<div class="content">
		<div class="position-header">
			<ul class="clearfix">
				<li onclick="Tag(1)" class="position-header-click">
				<img src="../common/image/icon-1.png" />
					<p>全部</p></li>
				<li onclick="Tag(2)"><img src="../common/image/icon-2.png" />
					<p>商品</p></li>
				<li onclick="Tag(3)"><img src="../common/image/icon-3.png" />
					<p>服务</p></li>


			</ul>
		</div>
		<div class="position-content">
			<div class="position-status">
				<c:if test="${order_type != 'djd'}">
					<select name="pay_status" id="pay_status" class="input-text">
						<option value="">支付状态</option>
						<option value="success">支付成功</option>
						<option value="no_pay">未支付</option>
						<option value="pay_error">支付失败</option>
					</select> 
					
					<select name="pay_type" id="pay_type" class="input-text">
						<option value="">付款方式</option>
						<option value="alipay">支付宝</option>
						<option value="weixin">微信</option>
					</select> 
				</c:if>
				<input type="text" placeholder="日期查找" name="time" class="input-rate " id="time" /> 
				<input type="text" name="searchValue" id="searchValue" value="" placeholder="关键字" class="input-rate key-bord" /> 
				<select name="orderBy" id="orderBy" class="third-select">
					<option value="">排序</option>
					<option value="time,desc">日期从早到晚</option>
					<option value="time,asc">日期从晚到早</option>
					<option value="total_price,desc">价格从高到低</option>
					<option value="total_price,asc">价格从低到高</option>
				</select> 
<!-- 				<a href="content.jsp" class="rebuild">新增内容</a> -->
			</div>
			<div class="position-write">
				<ul class="clearfix">
					<li class="position-show-title">订单信息</li>
					<li class="position-author position-aut">卖家</li>
					<li class="position-author position-aut">买家</li>
					<li class="position-author position-aut">价格数量</li>
					<li class="edit-exit">操作</li>
				</ul>
			</div>
			<div class="position-show">
				<ul class="clearfix" id="clear-fix-1">
				</ul>
				<ul class="clearfix" id="clear-fix-2" style="display: none;">
				</ul>
				<ul class="clearfix" id="clear-fix-3" style="display: none;">
				</ul>
			</div>
		</div>
		<div class="position-footer">
			<input type="checkbox" class="select-all" />全选 
<!-- 			<a href="###" class="position-delete">删除</a>  -->
<!-- 			<span>分页的位置</span> -->
			<div id="page-1" class="pager clearfix"></div>
			<div id="page-2" class="pager clearfix"></div>
			<div id="page-3" class="pager clearfix"></div>
		</div>
	</div>

	<script type="text/javascript">
		var flag = 1;
		$(function() {
			//全部1,商品2,服务3
			$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/Handle_order?Tag=1&type=search&order_type=${order_type}",args:{Tag:1,order_type:"${order_type}"}});
			$("#page-2").pagination($("#clear-fix-2"),{url:"/mServer/Handle_order?Tag=2&type=search&order_type=${order_type}",args:{Tag:2,order_type:"${order_type}"}});
			$("#page-3").pagination($("#clear-fix-3"),{url:"/mServer/Handle_order?Tag=3&type=search&order_type=${order_type}",args:{Tag:3,order_type:"${order_type}"}});
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
			var flag = true;
			$(".select-all").click(function() {
				if (flag) {
					$(".position-circle").addClass("list-click");
					flag = false;
					$(".position-delete").click(function() {
						$(".position-show ul li").remove();
						$(this).css("color", "#00C8E8");
					})
				} else {
					$(".position-circle").removeClass("list-click");
					flag = true;
				}
	
	
			})
			//删除
			$(".position-delete").click(function() {
				$(".list-click").parent().parent().remove();
				$(this).css("color", "#00C8E8");
			})
	
			//选择日期
			$('#time').date_input();
	
	
			//关键字搜索
			var a = $('.key-bord').val();
			$('.position ul li').each(function() {})
		});
		
		function Tag(value){
			$("ul[id^='clear-fix-']").hide();
			$("#clear-fix-"+value).show();
			$("div[id^='page-']").hide();
			$("#page-"+value).show();
			flag = value;
		}
		
		$("#orderBy").change(function() {
			$.ajax({
				url : "/mServer/Handle_order?Tag=" + flag,
				type : "POST",
				data : {
					"orderBy" : $("#orderBy").val(),
					"type":"search",
					"order_type":"${order_type}"
				},
				dataType : "json",
				success : function(message) {
					if(message.code == '0000'){
						var data = message.data.results;
						var str = "";
						for(var i in data){
							str += getLi(data[i],null);
						}
						$("#clear-fix-"+flag).html(str);
					}
				},
				error : function() {
					alert("error");
				}
			});
		})
		
		$("#searchValue").blur(function() {
			$.ajax({
				url : "/mServer/Handle_order?Tag=" + flag,
				type : "POST",
				data : {
					"searchValue" : $("#searchValue").val(),
					"type":"search",
					"order_type":"${order_type}"
				},
				dataType : "json",
				success : function(message) {
					if(message.code == '0000'){
						var data = message.data.results;
						var str = "";
						for(var i in data){
							str += getLi(data[i],null);
						}
						$("#clear-fix-"+flag).html(str);
					}
				},
				error : function() {
					alert("error");
				}
			});
		})
		$("#time").change(function() {
			$.ajax({
				url : "/mServer/Handle_order?Tag=" + flag,
				type : "POST",
				data : {
					"time" : new Date($("#time").val()).format("yyyy-MM-dd"),
					"type":"search",
					"order_type":"${order_type}"
				},
				dataType : "json",
				success : function(message) {
					if(message.code == '0000'){
						var data = message.data.results;
						var str = "";
						for(var i in data){
							str += getLi(data[i],null);
						}
						$("#clear-fix-"+flag).html(str);
					}
				},
				error : function() {
					alert("error");
				}
			});
		});
			
		$("#pay_status").change(function() {
			
			
			$.ajax({
				url : "/mServer/Handle_order?Tag=" + flag,
				type : "POST",
				data : {
					"pay_status" : $("#pay_status").val(),
					"type":"search",
					"order_type":"${order_type}"
				},
				dataType : "json",
				success : function(message) {
					if(message.code == '0000'){
						var data = message.data.results;
						var str = "";
						for(var i in data){
							str += getLi(data[i],null);
						}
						$("#clear-fix-"+flag).html(str);
					}
				},
				error : function() {
					alert("error");
				}
			});
		});
		
		$("#pay_type").change(function() {
			
			
			$.ajax({
				url : "/mServer/Handle_order?Tag=" + flag,
				type : "POST",
				data : {
					"pay_type" : $("#pay_type").val(),
					"type":"search",
					"order_type":"${order_type}"
				},
				dataType : "json",
				success : function(message) {
					if(message.code == '0000'){
						var data = message.data.results;
						var str = "";
						for(var i in data){
							str += getLi(data[i],null);
						}
						$("#clear-fix-"+flag).html(str);
					}
				},
				error : function() {
					alert("error");
				}
			});
		});

		(function(root,factory,plugin){
			factory(root.jQuery,plugin);
		})(window,function($,plugin){
			$.fn[plugin] = function(container,params){
				var _this = this;
				_this.zPager({
					url:params.url,
					htmlBox: container,
					btnShow: false,
					dataRender: function(data){
						console.log(data)
						var lis = "";
						for ( var index in data) {
							lis += getLi(data[index],params.args.Tag);
						}
						console.log(data);
						container.empty();
						container.append(lis);
					}
				});
			}
		},"pagination");

		function getLi(data,Tag) {
			return   '<li>'+
					    '<p class="position-show-title">'+
						    '<i class="position-circle"></i>'+ 
						    '<img class="position-square" src="'+data.picture.split(",")[0]+'" />'+ 
						    '<span class="position-title">'+ 
						        '<span>'+data.title+'</span> '+
						        '<span class="position-share">'+data.transaction_id+'</span>'+
						    '</span>'+
						'</p>'+
						'<p class="position-author position-aut">'+
						    '<img class="icon-author" src="'+data.buyer_picture+'" /> '+
						    '<span class="position-title">'+ 
						        '<span>'+data.buyer_name+'</span>'+
						    '</span>'+
						'</p>'+
						'<p class="position-author position-aut">'+
						    '<img class="icon-author" src="'+data.seller_picture+'" />'+ 
						    '<span class="position-title">'+ 
						        '<span>'+data.seller_name+'</span>'+
						    '</span>'+
						'</p>'+
						'<p class="position-author position-pub">'+
						    '<span class="position-title position-p">'+ 
						        '<span>数量</span>'+
						        '<span class="position-share">购买数量:'+data.shuliang+'</span>'+
						    '</span>'+ 
						    '<span class="position-title position-p">'+ 
						        '<span>总价</span>'+
						        '<span class="position-share">总价:'+data.total_price+'</span>'+
						    '</span>'+
						'</p>'+
						'<p class="edit-exit">'+
						    '<a class="icon-edit icon-webpage" href="/mServer/page/order-detail.jsp?order_id='+data.transaction_id+'&guangjie_fenlei_Tag='+data.guangjie_fenlei_Tag+'"></a>'+
						'</p>'+    
					'</li>';
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
