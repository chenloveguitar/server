<%@page import="com.magicmoble.luzhouapp.model.Pinglun"%>
<%@page import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@page import="com.magicmoble.luzhouapp.business.CommonBusiness"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> <%@
taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加评论</title>
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
<style type="text/css">
	.comment-add-text p{
		margin-left:40px;
	}
</style>
<%
	String id = request.getParameter("updete_id");
	Pinglun pinglun = new Pinglun();
	//编辑
	if(StringUtils.isNotBlank(id)){
		pinglun = Server_Function.findDataByTableAndId(Pinglun.class.getSimpleName().toLowerCase(), id, Pinglun.class);
	}
	
	request.setAttribute("pinglun", pinglun);
	request.setAttribute("id", id);
%>
</head>
<body>
	<form action="/mServer/PinglunServlet" method="post">
		<input type="hidden" name="id" value="${pinglun.id}">
		<input type="hidden" name="type" value="edit">
		<div class="content comment-add-header">
			<p class="comment-header">评论添加</p>
			<div class="comment-add-text">
				<p>
					<span>评论对象分类&emsp;</span>
					<select class="selectpicker" onchange="loadItems(this.value);" name="tiaomu_type" id="select" data-live-search="true" title="请选择评论对象分类">
						<option value="toutiao">今日头条</option>
						<option value="faxian">发现秘密</option>
						<option value="quchu">有去处</option>
						<option value="commodity">商品</option>
						<option value="fuww">服务</option>
					</select>
				</p>
				<p>
					<span>&emsp;&emsp;评论对象&emsp; </span><select class="selectpicker" name="tiaomu_id" id="items" data-live-search="true" title="请选择或输入评论人昵称"></select>
				</p>
				<p>
					<span>&emsp;&emsp;&emsp;评论人&emsp;</span> <select class="selectpicker" name="pingluner_id" id="pingluner_id" data-live-search="true" title="请选择或输入评论人昵称"></select>
				</p>
				<p style="margin:0">
					<textarea rows="" cols="" class="comment-text" name="content" placeholder="请输入评论内容:">${pinglun.content}</textarea>
				</p>
			</div>
	
				<input type="submit" value="添加" class="comment-submit" /> <input
				type="button" value="取消" style="width: 95px; height: 40px;  font-size: 16px; cursor: pointer; color: #fff; margin-right: 25px"/>
			</div>
		</form>
	
	<script type="text/javascript">
		$(function(){
			loadSelectList();	
			dataEcho();
		});
		function loadItems(value){
			$.ajax({
			url : "/mServer/CommonServlet",
			type : "post",
			dataType : "json",
			async:false,
			data : {
				type:'loadItems',
				tableName:value
			},
			success : function(data) {
				var result = data.data;
				var html = "";
				$.each(result, function(i) {
					html += "<option value=" + result[i].id + ">"
					+ result[i].title
					+ "</option>";
				});
				$jquery1_9_1('#items').html(html);
				$jquery1_9_1('#items').selectpicker({
					  size: 4,
				});
				$jquery1_9_1('#items').selectpicker('refresh');
			},
			error : function(data) {
				alert("查询评论失败" + data);
			}
		});
		}
		//获取用户列表
		function loadSelectList() {
			$.ajax({
				url : "/mServer/CommonServlet",
				type : "post",
				dataType : "json",
				async:false,
				data : {
					type:'getUsers'
				},
				success : function(data) {
					var result = data.data.result;
					console.log(result);
					$.each(result, function(i) {
						$jquery1_9_1('#pingluner_id').append("<option value=" + result[i].admin_xinxi_id + ">"
												+ result[i].name
												+ "</option>");
					});
					$jquery1_9_1('#pingluner_id').selectpicker({
						  size: 4,
					});
					$jquery1_9_1('#pingluner_id').selectpicker('refresh');
				},
				error : function(data) {
					alert("查询作者失败" + data);
				}
			});
		}
		
		function dataEcho(){
			var pingluner_id = "${pinglun.pingluner_id}";
			var tiaomu_type = "${pinglun.tiaomu_type}";
			var tiaomu_id = "${pinglun.tiaomu_id}";
			//选中评论对象分类
			$jquery1_9_1('#select').selectpicker({});
			$jquery1_9_1("#select").val(tiaomu_type);
			$jquery1_9_1("#select").selectpicker('render');
			loadItems(tiaomu_type);
			//选中评论人
			$jquery1_9_1("#pingluner_id").val(pingluner_id);
			$jquery1_9_1("#pingluner_id").selectpicker('render');
			//选中评论对象
			$jquery1_9_1("#items").val(tiaomu_id);
			$jquery1_9_1("#items").selectpicker('render');
		}
	</script>
</body>
</html>
