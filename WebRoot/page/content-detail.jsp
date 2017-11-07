<%@page import="com.magicmoble.luzhouapp.model.Hongbao"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="com.magicmoble.luzhouapp.model.Dashang"%>
<%@page import="com.magicmoble.luzhouapp.model.Dashang_list"%>
<%@page import="com.magicmoble.luzhouapp.model.Faxian"%>
<%@page import="com.magicmoble.luzhouapp.model.Quchu"%>
<%@page import="com.magicmoble.luzhouapp.model.Commodity"%>
<%@page import="com.magicmoble.luzhouapp.model.Fuwu"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.magicmoble.luzhouapp.model.Pinglun"%>
<%@page import="com.magicmoble.luzhouapp.action.click.Pinglun_listInq"%>
<%@page import="com.magicmoble.luzhouapp.model.Pinglun_list"%>
<%@page import="com.magicmoble.luzhouapp.business.FunctionBusiness"%>
<%@page import="javax.servlet.jsp.tagext.FunctionInfo"%>
<%@page import="com.magicmoble.luzhouapp.model.server.Toutiao"%>
<%@page import="com.magicmoble.luzhouapp.business.DashangBusiness"%>
<%@page
	import="com.magicmoble.luzhouapp.server.server_function.Server_Function"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<style type="text/css">
	.manage-list {
	    overflow: auto;
  	 	margin: 30px;
    	border: 1px dashed #ECECEC;
    	height: 430px;
	}
	.manage-list ul li{
		margin: 15px 5px;
	}
	.manage-list .images{
		border: 1px solid #B3B3B3;
	}
	
	.picture-show{
		border:0;
		margin:0;
		height:420px;
	}
	.select{
		background: url("../common/image/images/button_marquee_selected.png") !important;
	}
	
	.manage-delete{
		color: #C7C7C7;
	    font-size: large;
	    font-weight: bold;
	    cursor: pointer;
	    position: absolute;
	    top:0px;
	    right: 5px;
	}
	.jHtmlArea .ToolBar .h1,.h2,.h3,.h3,.h4,.h5,.h6{
		margin:0px;
	}
</style>
<%
	String chaxun_id = request.getParameter("chaxun_id");
	String _Tag = request.getParameter("Tag");
	int Tag = Integer.parseInt(_Tag);
	Toutiao list = Server_Function.chaxun(chaxun_id, Tag);
	Map<String,Object> data = list.getData();
	String table_name = (String)data.get("table_name");
	String id = (String)data.get("id");
	String shenhe = (String)data.get("shenhe");
	String time = data.get("time") != null?data.get("time").toString():"";
	String title = (String)data.get("title");
	String releaser_id = (String)data.get("releaser_id");
	String muban_Tag = (String)data.get("muban_Tag");
	String described = (String)data.get("described");
	String content = (String)data.get("content");
	String share_count = String.valueOf(data.get("share_count"));
	Toutiao toutiao = new Toutiao();
	Faxian faxian = new Faxian();
	Quchu quchu = new Quchu();
	Commodity commodity = new Commodity();
	Fuwu fuwu = new Fuwu();
	//获取并计算打赏量
	List<Dashang_list> dashang_lists = null;
	//通过表名获取相关业务数据
	//获取红包点赞红包总金额和数量
	List<Hongbao> dzHongbaos = null;
	//获取分享红包总金额和数量
	List<Hongbao> fxHongbaos = null;
	
	double dzhongbao_price = 0.0d;//点赞红包总金额
	double dzhongbao_count = 0;//点赞红包总个数
	double fxhongbao_price = 0.0d;//分享红包总金额
	double fxhongbao_count = 0;//分享红包总个数
	if(table_name.equals("toutiao")){
		Server_Function.findDataByTableAndId(table_name,id,toutiao);
		dashang_lists = DashangBusiness.getDashangListByToumuId(toutiao.getId());
		dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(toutiao.getId(), "1");
		fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(toutiao.getId(), "2");
	}else if(table_name.equals("faxian")){
		Server_Function.findDataByTableAndId(table_name,id,faxian);
		dashang_lists = DashangBusiness.getDashangListByToumuId(faxian.getId());
		dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(faxian.getId(), "1");
		fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(faxian.getId(), "2");
	}else if(table_name.equals("quchu")){
		Server_Function.findDataByTableAndId(table_name,id,quchu);
		dashang_lists = DashangBusiness.getDashangListByToumuId(quchu.getId());
		dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(quchu.getId(), "1");
		fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(quchu.getId(), "2");
	}else if(table_name.equals("commodity")){
		Server_Function.findDataByTableAndId(table_name,id,commodity);
		dashang_lists = DashangBusiness.getDashangListByToumuId(commodity.getId());
		dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(commodity.getId(), "1");
		fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(commodity.getId(), "2");
	}else if(table_name.equals("fuwu")){
		Server_Function.findDataByTableAndId(table_name,id,fuwu);
		dashang_lists = DashangBusiness.getDashangListByToumuId(fuwu.getId());
		dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(fuwu.getId(), "1");
		fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(fuwu.getId(), "2");
	}
	
	double dashang_count = 0.0d;
	//计算打赏总数
	for(Dashang_list dashang_list: dashang_lists){
		if(StringUtils.isNotBlank(dashang_list.getPrice())){
			double price = Double.valueOf(dashang_list.getPrice());
			dashang_count += price;
		}else{
			dashang_count += 0.0d;
		}
	}
	//计算点赞红包总金额 总数
	for(Hongbao hongbao: dzHongbaos){
			double price = hongbao.getPrice();
			dzhongbao_price += price;
			double count = hongbao.getCount();
			dzhongbao_count += count;
	}
	//计算分享红包总金额 总数
	for(Hongbao hongbao: fxHongbaos){
			double price = hongbao.getPrice();
			fxhongbao_price += price;
			double count = hongbao.getCount();
			fxhongbao_count += count;
	}
	//剩余红包=点赞红包+分享红包(后台没有记录红包的总金额与数量,每次领红包的时候只是做了递减操作)
	//计算收藏量
	int shoucang_count = 0; 
	List<Pinglun> list2 = FunctionBusiness.getPinglun("1", list.getId(), 0);
	request.setAttribute("list", list);
	request.setAttribute("list2", list2);
	request.setAttribute("toutiao", toutiao);
	request.setAttribute("faxian", faxian);
	request.setAttribute("quchu", quchu);
	request.setAttribute("commodity", commodity);
	request.setAttribute("fuwu", fuwu);
	request.setAttribute("table_name", table_name);//表名
	request.setAttribute("shenhe", shenhe);//审核状态
	request.setAttribute("time", time);//发布时间
	request.setAttribute("title", title);//标题
	request.setAttribute("releaser_id", releaser_id);//文章作者
	request.setAttribute("id", id);//id
	request.setAttribute("dashang_count", dashang_count);//打赏量
	request.setAttribute("dzhongbao_price", dzhongbao_price);//点赞红包总金额
	request.setAttribute("dzhongbao_count", dzhongbao_count);//点赞红包总个数
	request.setAttribute("fxhongbao_price", fxhongbao_price);//分享红包总金额
	request.setAttribute("fxhongbao_count", fxhongbao_count);//分享红包总个数
	request.setAttribute("muban_Tag", muban_Tag);
	request.setAttribute("share_count", share_count);
	request.setAttribute("described", described);
	request.setAttribute("content", content);
	request.setAttribute("shoucang_count", shoucang_count);
%>
<script type="text/javascript">
// 	console.log("${toutiao}");
// 	console.log("${faxian}");
// 	console.log("${quchu}");
// 	console.log("${commodity}");
// 	console.log("${fuwu}");
// 	console.log("${list}");
// 	console.log("${list2}");
	console.log("${table_name}");
	console.log("${id}");
	console.log("${muban_Tag}");
</script>
</head>
<body>
	<div class="content">
		<!--基本内容-->
		<div class="basic-content">
			<div class="basic-content-title">
				<p>基本内容</p>
			</div>
			<div class="basic-content-cont" style="padding-bottom: 50px;">
				<select class="basic-first" id="select">
					<option value="今日头条" <c:if test="${table_name eq 'toutiao' && toutiao.fenlei_Tag == 2}">selected="selected"</c:if>>今日头条</option>
					<option value="酒城日记"<c:if test="${table_name eq 'toutiao' && toutiao.fenlei_Tag == 1}">selected="selected"</c:if>>酒城日记</option>
					<option value="发现秘密" <c:if test="${table_name eq 'faxian' }">selected="selected"</c:if>>发现秘密</option>
					<option value="有去处" <c:if test="${table_name eq 'quchu' }">selected="selected"</c:if>>有去处</option>
					<option value="商品" <c:if test="${table_name eq 'commodity' }">selected="selected"</c:if>>商品</option>
					<option value="服务" <c:if test="${table_name eq 'fuwu' }">selected="selected"</c:if>>服务</option>
				</select>
				<select class="basic-second" id="status">
					<option value="状态">状态</option>
					<option value="待审核" <c:if test="${shenhe eq '正在审核中...' }">selected="selected"</c:if>>待审核</option>
					<option value="已发布" <c:if test="${shenhe eq '已发布' }">selected="selected"</c:if>>已发布</option>
					<option value="已下架" <c:if test="${shenhe eq '已下架' }">selected="selected"</c:if>>已下架</option>
				</select>
				<input type="text" placeholder="发布日期" class="basic-input date-input" value="2017-10-26" id="publish_date">
				<p class="content-title">
					标题 <input type="text" placeholder="请输入标题" class="content-input" value="${title}"
						maxlength="20" id="title" />
				</p>
				<p class="content-title">
						作者<span style="margin-left:25px;"><select class="selectpicker" data-live-search="true" title="请选择或输入作者昵称"></select></span>
				</p>
				<div>
					<div class="service" style="display: ${table_name eq 'fuwu' ? 'display' : 'none'};">
						<p class="content-title">
							价格 <input type="text" placeholder="请输入价格" class="content-input"
								id="price_fuwu" value="${fuwu.price}"/>
						</p>
						<p class="content-title">
							电话 <input type="text" placeholder="请输入电话" class="content-input"
								id="phone_fuwu" value="${fuwu.phone}"/>
						</p>
					</div>
					<div class="gowhere" style="display: ${table_name eq 'quchu' ? 'display' : 'none'};">
						<p class="content-title">
							店铺名 <input type="text" placeholder="请输入店铺名称"
								class="content-input"  id="dianpu_id" value="${quchu.dianpu_name}"/>
						</p>
						<p class="content-title">
							地址 <input type="text" placeholder="请输入地址" class="content-input"
								id="address" value="${quchu.dianpu_address	}"/>
						</p>
						<p class="content-title">
							电话 <input type="text" placeholder="请输入电话" class="content-input"
								id="phone" value="${quchu.phone}"/>
						</p>
					</div>
					<div class="goods" style="display: ${table_name eq 'commodity' ? 'display' : 'none'};">
						<p class="content-title">
							价格 <input type="text" placeholder="请输入价格" class="content-input"
								id="price_commodity" value="${commodity.price}"/>
						</p>
						<p class="content-title">
							数量 <input type="text" placeholder="请输入数量" class="content-input"
								id="shuliang"  value="${commodity.unit}"/>
						</p>
						<p class="content-title">
							运费 <input type="text" placeholder="请输入运费" class="content-input"
								id="freight" value="${commodity.freight}"/>
						</p>
						<p class="content-title">
							电话 <input type="text" placeholder="请输入电话" class="content-input"
								id="phone_commodity" value="${commodity.phone}"/>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!--数据-->
		<div class="basic-data clearfix">
			<div class="basic-data-title">
				<p>数据</p>
			</div>
			<div class="basic-data-cont">
				<div>
					<span>阅读量</span><input type="text" placeholder="0" id="yuedu_count" />
					<span>点赞量</span><input type="text" placeholder="0" id="dianzan_count" />
				</div>
				<ul class="clearfix">
					<li class="basic-data-one"><span>收藏量</span> <span>${shoucang_count}</span></li>
					<li class="basic-data-two"><span>分享量</span> <span>${share_count}</span></li>
				</ul>
			</div>
		</div>
		<!--推荐-->
		<div class="recommend">
			<div class="recommend-title">
				<p>推荐</p>
			</div>
			<div class="recommend-cont clearfix">
				<p class="p2 remain-time">
					<span>总推荐时间</span>
					<span class="ll">1</span>天
					<span class="iconfont icon-icon-test ll"></span>
				</p>
				<p class="recommend-data " style="margin-top: 40px;">
					<span>推荐日期 </span>
					<input type="text" value="" class="icon date_picker" />
					<span class="to">至</span>
					<input type="text" placeholder="请选择日期" class="choose icon date_picker" />
					<span class="recommend-people">推荐人</span>
					<span><select class="selectpicker" data-live-search="true" title="请选择推荐人"></select></span>
				<div class="redPacket">
					<p class="overplus">
						<span>剩余红包</span>
						<span class="money">${dzhongbao_price + fxhongbao_price }</span>
						<span class="price">元</span>
						<span class="money">${dzhongbao_count + fxhongbao_count }</span>
						<span class="price">个</span>
					</p>
					<p class="recommend-data sum">
						<span>点赞红包金额</span>
						<input type="text" placeholder="0.00" value="${dzhongbao_price}" class="price-input" />
						<span class="price">元</span>个数
						<input type="text" placeholder="0" value="${dzhongbao_count}" class="price-input" />
						<span class="price">个</span>
					</p>
					<p class="recommend-data sum">
						<span>分享红包金额</span> 
						<input type="text" placeholder="0.00" value="${fxhongbao_price}" class="price-input" />
						<span class="price">元</span>个数 
						<input type="text" placeholder="0" value="${fxhongbao_count}" class="price-input" />
						<span class="price">个</span>
					</p>
					<p class="reward">
						<span>打赏量</span>
						<input type="text" placeholder="0.00" value="${dashang_count}" class="reward-input" />
						<span class="price">元</span>
					</p>
				</div>
			</div>
		</div>
		<!--样式-->
		<div class="pattem">
			<div class="pattem-title">
				<p>样式</p>
			</div>
			<div class="pattem-cont">
				<div class="form-select" id="picture" >
					<label><input type="radio" name="se" <c:if test="${muban_Tag eq '2'}">checked="checked"</c:if> value="2" />多缩略图</label>
					<label><input type="radio" name="se" <c:if test="${muban_Tag eq '1'}">checked="checked"</c:if> value="1" />单缩略图</label>
					<label><input type="radio" name="se" <c:if test="${muban_Tag eq '3'}">checked="checked"</c:if> value="3" />大图</label>
				</div>
			</div>
		</div>
		<!--正文编辑-->
		<div class="text-edit">
			<div class="text-edit-title">
				<p>正文编辑</p>
			</div>
			<div class="text-edit-cont">
				<ul style="height: 120px;" class="clearfix clone-ul" id="clone0">
					<li class="add add-two image-show"><a href="###"></a>
						<p>添加图片</p>
						<p id="imageCount"></p>
					</li>
					<li class="text"><textarea id="textarea" name="text0" rows="" cols=""
							class="textarea">${described}</textarea></li>
				</ul>
<!-- 				<div class="add-another"> -->

<!-- 					<span style="position: relative;" class="span-two"><i -->
<!-- 						style="position: absolute;left: -29px;" href="##" class="span-one"></i>添加一组</span> -->

<!-- 				</div> -->

				<!--文本编辑器-->
				<div class="nav">
					<textarea id="txtDefaultHtmlArea" cols="50" rows="15"
						style="width:100%;height: 500px;">${content}</textarea>
				</div>
				<!--<textarea name="" rows="" cols="" class="textarea-two">这里是图文编辑器，听说有插件可以自动生成</textarea>-->
			</div>
		</div>
		<div class="text-edit">
				<div class="content-detail-title">
					<p>评论</p>
				</div>
				<div class="content-detail-user">
					<ul>
						<c:forEach var="list" items="${list2 }">
							<li>
								<div class="content-detail-header clearfix">
									<p class="icon-head">
										<img src="../common/image/icon-6.png" />
									</p>
									<p>
										<span class="content-detail-userName">${list.pingluner_name }</span>
										<span class="content-detail-rate"> ${list.time } <span
											class="content-detail-sign">${list.pingluner_qianming }</span>
										</span>
									</p>

								</div>

								<p class="write-comment">${list.content }</p>

							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		<!--保存-->
		<div class="save">
			<button type="button" class="save-s save-clicked">保存</button>
			<!--<a href="##" class="save-s save-clicked">保存</a>-->
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
	<input type="file" id="img-img" data-url='' data-flag='b'
		style="display: none;" />
	<script type="text/javascript">
		var $jq = jQuery.noConflict(true);
		var deleteds = [];
		//文本编辑器
		var aa = '';
		var x = $('#clone0').clone();
		$(function() {
			//加载用户列表
			getUserList();	
			initUploadPanel();
			eventBinding();
			initWidget();
			//数据回显
			dataEcho();
			$(".save-clicked").on("click", function() {
				var selectedNum = $("#clear-fix .select").parents("li").length;
				var uploadNum = document.getElementById("file").files.length;
				if(selectedNum && uploadNum){
					$.ajax({
						url : "/mServer/Upload_file2",
						type : "POST",
						data : {
							"select-val" : $("#select").val(),
							"price_fuwu" : $("#price_fuwu").val(),
							"phone_fuwu" : $("#phone_fuwu").val(),
							"phone_commodity" : $("#phone_commodity").val(),
							"dianpu_id" : $("#dianpu_id").val(),
							"address" : $("#address").val(),
							"phone" : $("#phone").val(),
							"price_commodity" : $("#price_commodity").val(),
							"shuliang" : $("#shuliang").val(),
							"freight" : $("#freight").val(),
							"title" : $("#title").val(),
							"releaser_name" : $("#releaser_name").val(),
							"yuedu_count" : $("#yuedu_count").val(),
							"dianzan_count" : $("#dianzan_count").val(),
							"releaser_id" : $("#releaser_id").val(),
							"muban_Tag" : $("input[type='radio']:checked").val(),
	//	 					"picture" : arr,
							"content1" : $("#textarea").val(),
							"content2" : $("#txtDefaultHtmlArea").val()
							},
							dataType : "json",
							success : function(data) {
								if(data.code === "0000"){
									var id = data.data;
									var success = imageRelAndUpload(id);
									if(success){
										alert("发布成功");
									}
	//	 							window.location.href = "page/Content_management_Release.jsp";
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
		});
	
	//数据回显
	function dataEcho(){
		var table_name = "${table_name}";
		//声明初始值
		var yuedu_count = 0;
		var dianzan_count = 0;
		//根据业务数据选择赋值
		switch(table_name){
			case "toutiao":
				yuedu_count = "${toutiao.yuedu_count}";
				dianzan_count = "${toutiao.dianzan_count}";
				break;
			case "faxian":
				yuedu_count = "${faxian.yuedu_count}";
				dianzan_count = "${faxian.dianzan_count}";
				break;
			case "quchu":
				yuedu_count = "${quchu.yuedu}";
				dianzan_count = "${quchu.dianzan_count}";
				break;
			case "commodity":
				yuedu_count = "${commodity.yuedu}";
				dianzan_count = "${commodity.dianzan_count}";
				break;
			case "fuwu":
				yuedu_count = "${fuwu.yuedu}";
				dianzan_count = "${fuwu.dianzan_count}";
				break;
		}
		
		//将所有值显示到页面上
		$("#yuedu_count").val(yuedu_count);
		$("#dianzan_count").val(dianzan_count);
		
	}
	//图片关联和上传
	function imageRelAndUpload(itemId){
		var success = false;
		//从图库中选择的
		var data_ids = "";
		var pid = null;
		//获取关联的图片集合
		$.each($("#clear-fix .select").parents("li"),function(){
			data_ids += $(this).attr("data-id") + ",";
		});
		//获取需要上传的图片集合
		if(data_ids){
			//文件关联
			$.ajax({
				url:'${pageContext.request.contextPath}/CommonServlet',
				type:'post',
				dataType:'json',
				async:false,
				data:{
					type:'imageDataRel',
					itemId:itemId,
					id:data_ids
				},
				success:function(data){
					if(data.code == "0000" ){//&& success
// 						alert("文件关联成功！");
					success = true;
					}
				},
				error:function(data){
						alert("文件关联失败！");
				}
			});
		}
		var sum = document.getElementById("file").files.length;
		//文件上传
		if(sum > 0){
			$.ajaxFileUpload({
	            url: '${pageContext.request.contextPath}/FileUploadServlet?parentId='+pid+"&deleteds="+deleteds+"&itemId="+itemId, //用于文件上传的服务器端请求地址
	            secureuri: false, //是否需要安全协议，一般设置为false
	            fileElementId: 'file', //文件上传域的ID
	            async:false,
	            dataType: 'json', //返回值类型 一般设置为json
	            success: function (data, status){
	            	var results = data.data;
	            	if(data.code === "0000"){
	            		success = success && true;
// 						alert("文件上传成功！");
	            	}else{
	            		alert("文件上传失败!");
	            	}
	            },error: function (data, status, e){
	           		alert("文件上传失败!");
	            }
	        });
		}
		
		if(data_ids && sum == 0){
			alert("请上传或从图库中选择图片！");
			return false;
		}
		return success;
	}
	//获取用户列表
	function getUserList() {
		$jq.ajax({
			url : "${pageContext.request.contextPath}/CommonServlet",
			type : "post",
			dataType : "json",
			data : {
				type:'getUsers'
			},
			success : function(data) {
				var result = data.data.result;
				var releaser_id = "${releaser_id}";
				$jq.each(result, function(i) {
					if(releaser_id === result[i].admin_xinxi_id){
						$jq('.selectpicker').append("<option selected='selected' value=" + result[i].admin_xinxi_id + ">"
												+ result[i].name
												+ "</option>");
					}else{
						$jq('.selectpicker').append("<option value=" + result[i].admin_xinxi_id + ">"
											+ result[i].name
											+ "</option>");
					}
				});
				$jq('.selectpicker').selectpicker({
					  size: 4,
					  
				});
				$jq('.selectpicker').selectpicker('refresh');
			},
			error : function(data) {
				alert("查询作者失败" + data);
			}
		});
	}
	
	function getUploadImagesHtml(url,name){
		return '<li id="pic">'+
			'<div class="images" style="cursor: pointer;">'+
				'<a href="javascript:void(0);">'+
				'<img src="'+url+'"/>'+
				'<span class="manage-delete" onclick="javascript:deleteImage(this)" name='+name+'>X</span>'+
				'</a>'+
			'</div>'+
		'</li>';
	}
	
	function deleteImage(obj){
		var deleted = $(obj).attr("name");
		deleteds.push(deleted);
		$(obj).parent().parent().parent().remove();
		var count = $("#manage-list-ul").find("li").length;
		if(count == 0){
			$("#img-show").show();	
			$("#choose").show();
		}
	}
	//添加图片
	function addImages(obj){
	    var sum = obj.files.length;
	    if(sum > 0){
	    	for(var i=0;i<sum;i++){
	   	        var url = window.URL.createObjectURL(obj.files[i]);
	   	        var name = obj.files[i].name;
	   	        var li = $(getUploadImagesHtml(url,name));
	   		    $(li).appendTo($("#manage-list-ul"));
   	    	}
	 	}
    }
	
	function confirmSelected(){
		var depotImageCount = $("#clear-fix .select").length;
		var uploadImageCount = $("#manage-list-ul li").length;
		if(depotImageCount == 0 && uploadImageCount == 0){
			alert("请上传或选择图片后点击确认!");
			return;
		}
		//这里只做将选择的图片显示在编辑框中,不做后台请求.在提交的时候 在做后台请求
		closePanel();
		//设置数字显示
		$(".add.add-two.image-show #imageCount").html("已添加"+((depotImageCount || 0) + (uploadImageCount || 0))+"张图片");
	}
	
	function cancelSelected(){
		closePanel();
	}
	
	function closePanel(){
		//图片上传/选择弹出框
		$(".picture-all").hide();
		//页面遮罩
		$("#all").hide();
	}
	//上传图片
	function uploadFile(){
		$("#clear-fix").hide();
		$("#preview").show();
		$("#manage-list-ul").show();	
	}
	
	//从仓库选择
	function selectToDepot(){
		$("#clear-fix").show();
		$("#preview").hide();
		$("#manage-list-ul").hide();	
	}
	
	function initUploadPanel(){
		$("#preview").append(getUploadHtml());
// 		$("#clear-fix").append(getImagesHtml());
		getImages();
	}
	
	function getImages(){
		$.ajax({
			url:'${pageContext.request.contextPath}/CommonServlet',
			type:'post',
			dataType:'json',
			data:{
				type:'getImages'
			},
			success:function(data){
				var imagesHtml = getImagesHtml();
				if(data.code === "0000"){
					var results = data.data;
					if(results.length > 0){
						for(var i in results){
							$("#clear-fix").append(getImagesHtml(results[i].id,results[i].absolutePath));
						}
					}else{
						alert("图片库中无图片显示!");
					}
				}else{
					alert("获取图片库图片失败!");
				}
			},
			error:function(data){
				alert("获取图片库图片失败!");
			}
		});
	}
	
	function getUploadHtml(){
		return 	'<div id="img_li" style="position: absolute;left: 0;top:0;display:none;"></div>'+
				'<img src="../common/image/pic.png" class="img-show" id="img-show" />'+
				'<a href="#" id="choose">点击选择图片'+
					'<input type="file" name="file" id="file" multiple="multiple" style="opacity: 0;cursor:pointer;"/>'+
				'</a>';
	}
	
	function getImagesHtml(id,absolutePath){
		return '<li id="pic" data-id="'+id+'">'+
			'<div class="images" style="cursor: pointer;" onclick=selectImage("'+id+'",this)>'+
				'<a href="javascript:void(0);">'+
				'<img src="${pageContext.request.contextPath}/FileDownLoadServlet?absolutePath=' + absolutePath + '"/>'+
				'<span class="manage-choose" style="top:0px;right:0px;"></span>'+
				'</a>'+
			'</div>'+
		'</li>';
	}
	
	function selectImage(id,obj){
		$(obj).find("span").toggleClass("select");
	}
	
	//元素事件绑定
	function eventBinding(){
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
		
		//点击上传图片时显示弹出框和添加
		$("#choose input").change(function() {
			addImages(this);
			$("#manage-list-ul").show();
		});
		//下拉框切换
		$("#select").change(function() {
			var value = $(this).val();
			if (value == "今日头条" || value == "酒城日记" || value == "发现秘密") {
				$(".gowhere").hide();
				$(".goods").hide();
				$(".service").hide();
			}
			if (value == "有去处") {
				$(".gowhere").show().siblings().hide();
			}
			if (value == "商品") {
				$(".goods").show().siblings().hide();
			}
			if (value == "服务") {
				$(".service").show().siblings().hide();
			}
		});
		//图库选择样式变化
		$(".pic-choose").click(function() {
			$(this).addClass('picture-send').siblings().removeClass('picture-send');
		});
		
		$('#choose').click(function() {
			$(this).hide();
			$('#img-show').hide();
		})
		$("#cancel").click(function() {
			$("#img_li img").remove();
			$('#img-show').show();
			$('#choose').show();
		});
		
		$(".iconfont.icon-icon-test.ll").click(function(){
			var oldDate = new Date($(".choose.icon.date_picker").val());
			var newDate = oldDate.addDay(1);
			$(".choose.icon.date_picker").val(newDate.format("yyyy-MM-dd"));
			var beginDate = new Date($(".icon.date_picker").val());
			var endDate = new Date($(".choose.icon.date_picker").val());
			//日期相减
			var dateCount = beginDate.subtractDay(endDate);
			$(".p2.remain-time span.ll:first").html(dateCount + 1);
		});
	}
	
	
	
	//初始化控件
	function initWidget(){
		$("#txtDefaultHtmlArea").htmlarea("${content}");
		//选择日期
		var time = "${time}"?new Date(time).format("yyyy-MM-dd"):"";
		$("#publish_date").val(time);
		$('#publish_date').date_input();
		//日期选择
		$(".date_picker").val(new Date().format("yyyy-MM-dd"));
		$('.date_picker').date_input();
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
	 
	Date.prototype.addDay = function(addDay){
		var time = this.getTime();
		var date = new Date(time + addDay * 24 * 60 * 60 * 1000)
		return date;
	}
	
	Date.prototype.subtractDay = function(date){
		var beginDateTime = this.getTime();
		var endDateTime = date.getTime();
		var diff = endDateTime - beginDateTime;
		var result = diff / (24 * 60 * 60 * 1000);
		return result;
	}
	</script>
</body>
</html>
