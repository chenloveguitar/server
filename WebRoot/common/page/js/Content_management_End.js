
$(function() {
	//全部1
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/Handle_end_neirong?Tag=1",args:{Tag:1}});
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
	return '<li>' + '<p class="position-show-title">'
			+ '<i class="position-circle"></i> '
			+ '<img class="position-square" src="/mServer/FileDownLoadServlet?itemId='+data.id+'"/>'
			+ '<span class="position-title">'
			+ '<span>'
			+ data.title
			+ '</span>'
			+ '<span class="position-share">阅读量:'
			+ data.yuedu_count
			+ ' 分享:'
			+ data.share_count
			+ ' 收藏:'
			+ data.shoucang_count
			+ '</span>'
			+ '</span>'
			+ '</p>'
			+ '<p class="position-author">'
			+ '<img class="icon-author" src="'
			+ data.releaser_touxiang
			+ '" />'
			+ '<span class="position-title">'
			+ '<span>'
			+ data.releaser_name
			+ '</span>'
			+ '<span class="position-share">'
			+ data.time
			+ '</span>'
			+ '</span>'
			+ '</p>'
			+ '<p class="position-public">'
			+ '<span class="position-title position-p"> '
			+ '<span>'
			+ data.shenhe
			+ '</span>'
			+ '<span class="position-share">'
			+ data.tuijian_Tag
			+ '</span>'
			+ '</span> '
			+ '<span class="position-title position-p"> '
			+ '<span>点赞红包</span>'
			+ '<span class="position-share">剩余'
			+ data.dianzan_hongbao
			+ '元</span>'
			+ '</span> '
			+ '<span class="position-title position-p"> '
			+ '<span>分享红包</span>'
			+ '<span class="position-share">剩余'
			+ data.share_hongbao
			+ '元</span>'
			+ '</span> '
			+ '<span class="position-title position-p"> '
			+ '<span>'
			+ data.tuijian_message
			+ '</span>'
			+ '<span class="position-share">剩余'
			+ data.days
			+ '天</span>'
			+ '</span>'
			+ '</p>'
			+ '<p class="edit-exit">'
			+ '<a class="icon-publish" href="/mServer/Handle_end_neirong?tableName='+data.table_name+'&republish='
			+ data.id
			+ '&Tag='+Tag+'"></a>'
			+ '<a class="icon-edit icon-del" href="/mServer/Handle_end_neirong?tableName='+data.table_name+'&del_id='
			+ data.id + '&Tag='+Tag+'"></a>' + '</p>' + '</li>';
}