
$(function() {
	//1全部  2推荐 3普通用户 4名人  5团体企业 6编辑组
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/Handle_user?Tag=1&type=search",args:{Tag:1}});
	$("#page-2").pagination($("#clear-fix-2"),{url:"/mServer/Handle_user?Tag=2&type=search",args:{Tag:2}});
	$("#page-3").pagination($("#clear-fix-3"),{url:"/mServer/Handle_user?Tag=3&type=search",args:{Tag:3}});
	$("#page-4").pagination($("#clear-fix-4"),{url:"/mServer/Handle_user?Tag=4&type=search",args:{Tag:4}});
	$("#page-5").pagination($("#clear-fix-5"),{url:"/mServer/Handle_user?Tag=5&type=search",args:{Tag:5}});
	$("#page-6").pagination($("#clear-fix-6"),{url:"/mServer/Handle_user?Tag=6&type=search",args:{Tag:6}});
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
				var lis = "";
				for ( var index in data) {
					lis += getLi(data[index],params.args.Tag);
				}
				console.log(data)
				container.empty();
				container.append(lis);
			}
		});
	}
},"pagination");

function getLi(data,Tag) {
	return '<li>'+
			    '<p class="position-show-title">'+
			    '<i class="position-circle"></i>'+
			    '<img class="position-square" src="'+data.touxiang_picture+'" />'+
			    '<span class="position-title">'+
			        '<span>'+data.name+'</span>'+
			        '<span class="position-share">粉丝:'+data.fensi+' 关注:'+data.guanzhu+' 时间:'+data.time+'</span>'+
			    '</span>'+
			'</p>'+
			'<p class="position-author">'+
			    '<span class="position-title">'+
			        '<span>'+data.qianming+'</span>'+
			    '</span>'+	
			'</p>'+
			'<p class="position-public">'+
			    '<span class="position-title position-p">'+
			        '<span>加V说明</span>'+
			        '<span class="position-share">'+data.renzheng_Tag+'</span>'+
			    '</span>'+
			    '<span class="position-title position-p">'+
			        '<span>余额</span>'+
			        '<span class="position-share">剩余'+data.qianbao+'元</span>'+
			    '</span>'+
			'</p>'+
			'<p class="edit-exit">'+
			    '<a class="icon-edit icon-webpage" href="/mServer/page/user-add.jsp?id='+data.id+'"></a>'+
			    '<a class="icon-edit icon-del" href="/mServer/Handle_user?type=delete&del_id='+data.id+'"></a>'+
			'</p>'+
		'</li>';
}