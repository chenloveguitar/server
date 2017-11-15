
$(function() {
	//全部1,详情页广告2,轮播广告3
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/Handle_guanggao?Tag=1&type=search",args:{Tag:1}});
	$("#page-2").pagination($("#clear-fix-2"),{url:"/mServer/Handle_guanggao?Tag=2&type=search",args:{Tag:2}});
	$("#page-3").pagination($("#clear-fix-3"),{url:"/mServer/Handle_guanggao?Tag=3&type=search",args:{Tag:3}});
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
				console.log(data)
				container.empty();
				container.append(lis);
			}
		});
	}
},"pagination");

function getLi(data,Tag) {
	return '<li>'+
			    '<p class="position-show-title column-content">'+
				    '<i class="position-circle "></i>'+
				    '<span class="position-title">'+
				        '<span class="advert-manage column-image">'+
				            '<img src="'+data.picture+'" alt="" />'+
				        '</span>'+
				        '<span class="advert-position column-position">'+data.url+'</span>'+
				    '</span>'+
				'</p>'+
				'<p class="position-author column-author">'+
				    '<span class="position-title advert-time">'+data.time+'</span>'+
				'</p>'+
				'<p class="position-author column-status">'+
				    '<span class="position-title advert-time">'+
				        data.shangjia_message+
				    '</span>'+
				'</p>'+
				'<p class="edit-exit column-operate">'+
				    '<a class="icon-edit icon-webpage" href="/mServer/page/advert-add.jsp?type=edit&id='+data.id+'"></a>'+
				    '<a class="icon-edit icon-del" href="/mServer/GuanggaoServlet?type=delete&id='+data.id+'"></a>'
				'</p>'+
			'</li>';
}