var $jquery1_9_1 = jQuery.noConflict(true);//1.9.1
var $jquery1_7_2 = jQuery.noConflict(true);//1.7.2

console.log($jquery1_9_1.fn.jquery);
console.log($jquery1_7_2.fn.jquery);
var deleteds = [];
	//图片关联和上传
	function imageRelAndUpload(itemId,tableName){
		console.log(tableName);
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
				url:'/mServer/CommonServlet',
				type:'post',
				dataType:'json',
				async:false,
				data:{
					type:'imageDataRel',
					itemId:itemId,
					tableName:tableName,
					id:data_ids
				},
				success:function(data){
					debugger;
					console.log(data);
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
	            url: '/mServer/FileUploadServlet?parentId='+pid+"&deleteds="+deleteds+"&itemId="+itemId+"&tableName="+tableName, //用于文件上传的服务器端请求地址
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
		$.ajax({
			url : "/mServer/CommonServlet",
			type : "post",
			dataType : "json",
			data : {
				type:'getUsers'
			},
			success : function(data) {
				var result = data.data.result;
				console.log(result);
				$.each(result, function(i) {
					$jquery1_9_1('.selectpicker').append("<option value=" + result[i].admin_xinxi_id + ">"
											+ result[i].name
											+ "</option>");
				});
				$jquery1_9_1('.selectpicker').selectpicker({
					  size: 4,
					  
				});
				$jquery1_9_1('.selectpicker').selectpicker('refresh');
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
			url:'/mServer/CommonServlet',
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
						console.log(results);
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
				'<img src="/mServer/FileDownLoadServlet?absolutePath=' + absolutePath + '"/>'+
				'<span class="manage-choose" style="top:0px;right:0px;"></span>'+
				'</a>'+
			'</div>'+
		'</li>';
	}
	
	function selectImage(id,obj){
		$(obj).find("span").toggleClass("select");
	}