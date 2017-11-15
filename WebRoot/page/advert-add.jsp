<%@page import="com.magicmoble.luzhouapp.model.server.Advertisement"%>
<%@page import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>广告添加</title>
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
		.ad-link{
			margin-bottom:10px;
		}
		.ad-clone > li{
			height:185px !important;
		}
		.ad-clone .add > a {
    		margin-top: 70px;
		}
		.ad-clone .add{
    		position: relative
		}
		.bootstrap-select:not([class*="col-"]):not([class*="form-control"]):not(.input-group-btn) {
    		width: 100%;
		}
		.ad-name{
			border:0 !important;
		}
		.ad-name > span:nth-child(1) {
    		border-right: 0;
		}
		.no-border {
		}
		.no-border > div {
			width:78% !important;
			height:100%;
		}
	</style>
<%
	String id = request.getParameter("id");
	Advertisement advertisement = Server_Function.findDataByTableAndId(Advertisement.class.getSimpleName().toLowerCase(),id,Advertisement.class);
	request.setAttribute("advertisement", advertisement);
%>
</head>
<body>
	<div class="user-add">
		<div class="banner-add">
			<p class="ad-title">添加轮播广告</p>
			<div class="ad-content">
				<ul class="clearfix ad-clone banner_length" id="lunbo0">
					<li class="add add-two ">
						<a href="javaScript:;"></a>
						<p>添加图片</p> <input type="file" name="file" id="file" value="" onchange="addImages(this);" /></li>
					<li class="ad-detail">
						<p class="ad-link">
							<input type="text" name="guanggao_name" id="guanggao_name" value="${advertisement.guanggao_name}"> <span>广告名称</span>
						</p>
						<p class="ad-name">
							<span> 
								<select class="selectpicker" onchange="loadItems(this.value);" name="fenlei_Tag" id="select" data-live-search="true" title="请选择广告分类">
									<option value="toutiao">今日头条</option>
									<option value="faxian">发现秘密</option>
									<option value="quchu">有去处</option>
									<option value="commodity">商品</option>
									<option value="fuww">服务</option>
								</select>
							</span> 
							<span> 
								<select class="selectpicker" id="shangjia_Tag">
									<option value="1">上架</option>
									<option value="2">不上架</option>
								</select>
							</span>

						</p>
						<p class="ad-link no-border" >
							<select class="selectpicker" id="items" data-live-search="true" title="请选择对象">
							</select>
							<span>对象选择</span>
						</p>
						<p class="ad-link">
							<input type="text" name="url" id="url" value="" /> <span>广告链接</span>
						</p>
					</li>
				</ul>
<!-- 				<div class="add-another" id="lunbo-add"> -->
<!-- 					<span class="span-two"> <i class="span-one"></i> 添加一组 -->
<!-- 					</span> -->
<!-- 				</div> -->
			</div>
		</div>
		<div class="ad-add-save ">
			<input type="submit" name="" id="banner" value="保存" class="ad-save" />
			<input type="submit" name="" id="" value="取消" class="ad-cancel" />
		</div>
<!-- 		<div class="banner-add detail-add"> -->
<!-- 			<p class="ad-title">添加详情广告</p> -->
<!-- 			<div class="ad-content"> -->
<!-- 				<ul class="clearfix ad-clone detail_length" id="detail0"> -->
<!-- 					<li class="add add-two "><a href="javaScriipt:;"></a> -->
<!-- 						<p>添加图片</p> <input type="file" name="" id="" value="" -->
<!-- 						onchange="upload(this)" /></li> -->
<!-- 					<li class="ad-detail"> -->
<!-- 						<p class="ad-name"> -->
<!-- 							<input type="text" name="" id="" value="" /> <span>图片名称</span> -->
<!-- 						</p> -->
<!-- 						<p class="ad-link"> -->
<!-- 							<input type="text" name="" id="" value="" /> <span>广告链接</span> -->
<!-- 						</p> -->
<!-- 					</li> -->
<!-- 				</ul> -->
<!-- 				<div class="add-another" id="detail-add"> -->
<!-- 					<span class="span-two"> <i class="span-one"></i> 添加一组 -->
<!-- 					</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="ad-add-save"> -->
<!-- 			<input type="submit" name="" id="xiangqing" value="保存" -->
<!-- 				class="ad-save" /> <input type="submit" name="" id="" value="取消" -->
<!-- 				class="ad-cancel" /> -->
<!-- 		</div> -->
	</div>
	<script type="text/javascript">
		$(function() {
			dataEcho();
			//保存取消操作
			$(".ad-add-save input").click(function() {
				$(this).addClass("ad-save").siblings().removeClass("ad-save");
				$(".ad-cancel").click(function() {
					window.location.reload();
				})
			})
	
		});
		//添加头像图片
		function addImages(obj){
			$(".add.add-two img").remove();
			var url = window.URL.createObjectURL(obj.files[0]);
	       	var name = obj.files[0].name;
			$("<img></img>").attr("src",url).attr("id","guanggao_picture").attr("style","width:100%;height:100%;position: absolute;top:0;left:0;").insertBefore($("#file"));
	    }
		
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
						  size: 10,
					});
					$jquery1_9_1('#items').selectpicker('refresh');
				},
				error : function(data) {
					alert("查询评论失败" + data);
				}
			});
		}
		$("#banner").click(function() {
			var fileNum = document.getElementById("file").files.length;
			var imageNum = $("#guanggao_picture").length;
			if(fileNum == 0 && imageNum == 0){
				alert("请选择广告图片！");
				return;
			}
			var fenlei_Tag = $("#select").val();
			var guangjie_fenlei_Tag = "";
			switch(fenlei_Tag){
				case "toutiao":
					fenlei_Tag = 1;
					break;
				case "faxian":
					fenlei_Tag = 2;
					break;
				case "quchu":
					fenlei_Tag = 3;
					break;
				case "commodity":
					fenlei_Tag = 4;
					guangjie_fenlei_Tag = 1;
					break;
				case "fuwu":
					fenlei_Tag = 4;
					guangjie_fenlei_Tag = 2;
					break;
			}
			
			$.ajax({
				url : "/mServer/Handle_guanggao?type=edit",
				type : "POST",
				data : {
					"id":"${advertisement.id}",
					"guanggao_id":$("#items").val(),
					"guanggao_name":$("#guanggao_name").val(),
					"fenlei_Tag":fenlei_Tag,
					"guangjie_fenlei_Tag":guangjie_fenlei_Tag,
					"shangjia_Tag":$("#shangjia_Tag").val(),
					"url":$("#url").val(),
				},
				dataType : "json",
				success : function(data) {
					if(data.code == "0000"){
						var itemId = data.data;
						if(fileNum > 0){
							$.ajaxFileUpload({
					            url: '/mServer/FileUploadServlet?parentId=null&deleteds=&itemId='+itemId+'&tableName=advertisement', //用于文件上传的服务器端请求地址
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
						window.location.href = "Advertisement_management.jsp";
					}
				},
				error : function(data) {
					console.log(data);
				}
			});
		});
		
		function dataEcho(){
			var fenlei_Tag = "${advertisement.fenlei_Tag}"
			var guanggao_id = "${advertisement.guanggao_id}";
			var guangjie_fenlei_Tag = "${advertisement.guangjie_fenlei_Tag}";
			switch(fenlei_Tag){
				case "1":
					fenlei_Tag = "toutiao";
					break;
				case "2":
					fenlei_Tag = "faxian";
					break;
				case "3":
					fenlei_Tag = "quchu";
					break;
				case "4":
					if(guangjie_fenlei_Tag == "1"){
						fenlei_Tag = "commodity";
					}else if(guangjie_fenlei_Tag == "2"){
						fenlei_Tag = "fuwu";
					}
					break;
			}
			$jquery1_9_1('#select').selectpicker({});
			$jquery1_9_1("#select").val(fenlei_Tag);
			$jquery1_9_1("#select").selectpicker('render');
			loadItems(fenlei_Tag);
			//选中评论对象
			$jquery1_9_1("#items").val(guanggao_id);
			$jquery1_9_1("#items").selectpicker('render');
			
			$jquery1_9_1("#shangjia_Tag").val("${advertisement.shangjia_Tag}");
			
			$("#url").val("${advertisement.url}");
			$("#guanggao_name").val("${advertisement.guanggao_name}");
			var url = "${advertisement.picture}";
			var urls = url.split(",");
			console.log(urls);
			url  = urls[urls.length-2];
			$(".add.add-two img").remove();
			$("<img></img>").attr("src",url).attr("id","guanggao_picture").attr("style","width:100%;height:100%;position: absolute;top:0;left:0;").insertBefore($("#file"));
		}
	</script>
</body>
</html>
