<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page
	import="com.magicmoble.luzhouapp.model.server.Shuoshuo_xiangqing"%>
<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Func"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>


<%
	List<Shuoshuo_xiangqing> list = (List<Shuoshuo_xiangqing>) request.getAttribute("list");
	request.setAttribute("list", list);
%>
<meta charset="UTF-8">
<title></title>
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
</head>
<script>
</script>
<body>
	<div class="content">
		<!--基本内容-->
		<div class="basic-content">
			<div class="basic-content-title">
				<p>基本内容</p>
			</div>
			<div class="basic-content-cont">
				<br><br>
				<!--推荐-->
				<p class="content-title">
					是否推荐
					<select name="is-tuijian" class="input-text" style="margin-left:  10px" id="change_recommend">
						<option value="">是否推荐</option>
						<option value="1">已推荐</option>
						<option value="2">未推荐</option>
					</select>
				</p>
<!-- 					<p class="content-title"> -->
<!-- 						内容图片  -->
<!-- 						<input type="file" name="filepath" multiple="multiple" width="20px" height="100px" id="filepath" /> -->
<!-- 					</p> -->
				<ul style="width:20%;" class="content-title clearfix clone-ul" id="clone0">
					<li class="add add-two image-show " style="height:120px;">
						<a style="position: relative;top:20px;" href="###"></a>
						<p style="position: relative;top:20px;">添加图片</p>
						<p style="    position: relative; top: 20px;" id="imageCount" ></p>				
					</li>
				</ul>
				<p class="content-title">
					发布者 <select class="selectpicker" id="releaser_id" data-live-search="true" title="请选择或输入作者昵称"></select>
				</p>
				<p class="content-title">内容:</p>
				<textarea class="content-input" id="content" name="shuoshuo-content" style=" width: 700px; height: 200px; margin-left: 13%;resize:none "></textarea>
			</div>
		</div>
		<!--数据-->
		<div class="basic-data clearfix">
			<div class="basic-data-title">
				<p>数据</p>
			</div>
			<div class="basic-data-cont">
				<div>
					<span>阅读量</span>
					<input type="text" name="yuedu" id="yuedu" value="${list.get(0).yuedu}" /> 
					<span>点赞量</span>
					<input type="text" name="dianzan_count" id="dianzan_count" value="${list.get(0).dianzan_count}" />
				</div>
				<ul class="clearfix" style="width:500px;float:left;">
					<li class="basic-data-one" style="width:210px;"><span>收藏量</span> 
						<span>${list.get(0).shoucang_count}</span>
					</li>
					<li class="basic-data-two" style="width:210px;">
						<span>分享量</span> <span>${list.get(0).share_count}</span>
					</li>
				</ul>
			</div>
		</div>
		<!--保存-->
		<div class="save">
			<button type="submit" class="save-clicked" id="submit" style="height:35px;width: 95px ;background: #00C8E8; color:#ffffff">保存</button>
			<a href="##" class="content-cancel">取消</a>
		</div>
	</div>
	<div id="all"></div>
	<!--上传图片-->
	<div id="picture-all" class="picture-all"
		style="display: none;z-index: 20;position: fixed;top: 8%;left: 12%;background: #FFFFFF;">
		<div class="picture-header">
			<a href="javascript:uploadFile();" class="pic-choose picture-send">上传图片</a> 
			<a href="javascript:selectToDepot();" class="pic-choose">从图库选择</a> <a href="javascript:cancelSelected();" class="pic-exit">x</a>
		</div>
		<div id="image_content">
			<div class="manage-list" style="height:500px;overflow: auto;">
				<ul class="clearfix manage-image" style="display: none;" id="clear-fix">
	
				</ul>
				<ul class="clearfix manage-image" id="manage-list-ul">
	
				</ul>
				<div class="picture-show" id="preview" style="position: relative;">
				</div>
			</div>
		</div>
		<hr/>
		<span class="submit-all"> 
			<a href="javascript:confirmSelected();" class="submit submit-yes" id="submit">确定</a> 
			<a href="javascript:cancelSelected();" class="submit" id="cancel">取消</a>
		</span>
	</div>
	<script type="text/javascript">
		//文本编辑器
		$(function() {
			getUserList();
			initUploadPanel();
			$(".save-clicked").on("click", function() {
				var selectedNum = $("#clear-fix .select").parents("li").length;
				var uploadNum = document.getElementById("file").files.length;
				if(selectedNum && uploadNum){
					$.ajax({
						url : "/mServer/ShuoshuoServlet?type=edit",
						type : "POST",
						data : {
							"tuijian_Tag" : $("#change_recommend").val()?$("#change_recommend").val():0,
							"releaser_id" : $("#releaser_id").val(),
							"content" : $("#content").val(),
							"dianzan_count" : $("#dianzan_count").val()?$("#dianzan_count").val():0,
							"yuedu" : $("#yuedu").val()?$("#yuedu").val():0,
							},
							dataType : "json",
							success : function(data) {
								console.log(data);
								if(data.code === "0000"){
									var id = data.data;
									var success = imageRelAndUpload(id,"shuoshuo");
									if(success){
										alert("发布成功");
									}
		 							window.location.href = "Shuoshuo_management.jsp";
								}else{
									alert("发布失败");
								}
							},
							error : function() {
								alert("发布失败");
							}
						});
				}else{
					alert("请上传或从图库中选择图片！");
				}
			});
			//点击上传图片时显示弹出框和添加
			$("#choose input").change(function() {
				addImages(this);
				$("#manage-list-ul").show();
			});
			$jquery1_7_2("#txtDefaultHtmlArea").htmlarea();
			//单多略图切换
			$jquery1_7_2('.date_picker').date_input();
	
			$('#select_yn').click(function() {
				$('#delete_select').remove();
	
			})
			var pic = $('#picture input');
			var picc = $('.display-li');
	
			var width = picc.eq(0).outerWidth();
			$('#1').click(function() {
				picc.siblings().show();
				picc.eq(0).css("width", width + "px");
				$('#number').html("3:2");
			})
			$('#123').click(function() {
				picc.eq(0).show().siblings().hide();
				picc.eq(0).css("width", width + "px");
				$('#number').html("3:2");
			})
			$('#3').click(function() {
				picc.eq(0).show().siblings().hide();
	
				picc.eq(0).css("width", width * 1.5 + "px");
				picc.eq(0).eq(0).css("width", width * 1.5 + "px");
				$('#number').html("2:1");
			})
			//推荐日历点击显示
			$('#icon-rili').click(function() {
				$('#demo').show();
				$('#all').show();
	
			});
			$('#exit').click(function() {
				$('#demo').hide();
				$('#all').hide();
	
			});
	
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth() + 1;
			var date = now.getDate();
	
			var data = [
				{
					date : '2017/7/6',
					value : '荐'
				},
				{
					date : '2017/7/7',
					value : '荐'
				},
				{
					date : '2017/7/8',
					value : '荐'
				},
				{
					date : '2017/7/9',
					value : '荐'
				},
				{
					date : '2017/7/13',
					value : '荐'
				},
				{
					date : '2017/7/14',
					value : '荐'
				},
				{
					date : '2017/7/15',
					value : '荐'
				},
				{
					date : '2017/7/16',
					value : '荐'
				},
			];
	
			// inline
// 			var $ca = $('#one').calendar({
// 				// view: 'month',
// 				width : 260,
// 				height : 340,
// 				// startWeek: 0,
// 				// selectedRang: [new Date(), null],
// 				data : data,
// 				monthArray : [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ],
// 				date : new Date(2017, 6, 1),
// 				onSelected : function(view, date, data) {
// 					console.log('view:' + view)
// 					console.log('date:' + date)
// 					console.log('data:' + (data || '无'));
// 				},
// 				viewChange : function(view, y, m) {
// 					console.log(view, y, m)
	
// 				}
// 			});
	
			$(".dot").html("荐");
			$('.dot').parent().css('color', '#00C8E8');
		})
	
		var x = $('#clone').clone();
		//添加一组
		$(function() {
	
			$('.add-another').click(function() {
				x.clone(true).insertBefore($(this));
				console.log($('.image-show'))
			})
	
			//保存取消
			$(".save a").click(function() {
				$(this).addClass("save-clicked").siblings().removeClass("save-clicked");
			})
			$(".content-cancel").click(function() {
				window.location.reload();
			})
	
		})
		//上传图片
		function upload(obj, w, h, name) {
			var sum = obj.files.length;
			console.log(sum);
			str = "";
			if (sum <= 3) {
				for (var i = 0; i < sum; i++) {
					var url = window.URL.createObjectURL(obj.files[i]);
					var name = obj.files[i].name;
					//str+="<li style='width:"+w+"px;height:"+h+"px;float:left;margin-right:15px;background:url(\""+url+"\")no-repeat center center;background-size:cover;'></li>"  
					str += "<img id='jq' width='100%' height='100%' src=\"" + url + "\">"
	
				}
				$("#img_li").append(str);
			} else {
				alert("最多选择3张图片！！！")
				document.getElementById("img-show").style.display = "block";
				document.getElementById("choose").style.display = "block";
				document.getElementById("choose").style.left = "0px";
				document.getElementById("choose").style.top = "0px";
			}
	
		}
	
		$(function() {
// 			//图库选择样式变化
// 			var flag = true;
			$(".pic-choose").click(function() {
				$(this).addClass('picture-send').siblings().removeClass('picture-send');
			})
// 			//确定取消样式变化
			$('.submit-all a').click(function() {
				$(this).addClass('submit-yes').siblings().removeClass('submit-yes');
			})
			$('#choose').click(function() {
				$(this).hide();
				$('#img-show').hide();
			})
			$(".pic-exit").click(function() {
				$('.picture-all').hide();
				$('#all').hide();
			})
			$("#cancel").click(function() {
				$('#preview li').remove();
				$('#img-show').show();
				$('#choose').show();
	
			});
			//添加图片元素事件绑定
			$('.add.add-two.image-show').click(function() {
				var count = $("#manage-list-ul li").length;
				if(count == 0){
					$("#choose").show();
					$('#img-show').show();
				}else{
					$("#choose").hide();
					$('#img-show').hide();
				}
				$("#img_li img").remove();
				$('#all').show();
				$('#picture-all').show();
				$(".save-clicked").click(function() {
					var a = $("#txtDefaultHtmlArea").val();
					console.log("txt:" + a);
				})
				//保存取消
				$(".save a").click(function() {
					$(this).addClass("save-clicked").siblings().removeClass("save-clicked");
				});
				
				
				$(".content-cancel").click(function() {
					window.location.reload();
				});
			
				$('#choose1').click(function() {
					$('#choose1').hide();
					$('#img-show1').hide();
					$('#upp-load').show();
				})
			
				$('#submit1').click(function() {
					$('#picture-all1').hide();
					$('#all').hide();
					$('#upp-load').hide();
				})
			});
	
// 			//重新上传图片
// 			var flag1 = true;
// 			$(".display-li").click(function() {
// 				a = $(this);
// 				str = '';
// 				$("#img_li img").remove();
// 				$('#img-show').show();
// 				$('#choose').show();
// 				$('#all').show();
// 				$('.picture-all').show();
// 				flag1 = true;
// 			})
	
// 			setInterval(function() {
// 				$('.add').click(function() {
// 					b = $(this);
	
// 					str = '';
// 					$("#img_li img").remove();
// 					$('#img-show').show();
// 					$('#choose').show();
// 					$('#all').show();
// 					$('.picture-all').show();
// 					flag1 = false;
// 				})
// 			}, 100)
	
// 			$('#submit').click(function() {
// 				if (flag1) {
// 					console.log(str);
// 					$('.picture-all').hide();
// 					$('#all').hide();
// 					a.children().remove();
// 					a.append(str);
// 				} else if (flag1 == false) {
// 					$('.picture-all').hide();
// 					$('#all').hide();
// 					b.children().remove();
// 					b.append(str);
// 				}
// 			});
	
// 			$("#choose input").change(function() {
// 				upload(this);
// 				console.log(1231321);
// 			})
		})
		
	</script>
</body>
</html>
