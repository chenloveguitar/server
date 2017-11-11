
$(function() {
	//全部1,头条2,日记3,图片4,秘密5,去处6,逛街7,
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/ShuoshuoServlet?type=search",args:{Tag:1}});
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
				container.empty();
				container.append(lis);
			}
		});
	}
},"pagination");

function getLi(data,Tag) {
	return  "<li>"+
				"<p class=\"position-show-title column-content\">"+
					"<i class=\"position-circle\"></i> <img class=\"position-square\"src=\"" + data["pictures"][0]["picture_url"] + "\" /> " +
					"<span class=\"position-title\" id=\"position-title-1\"> " +
					"<span>" + data["content"] + "</span>"+
					"<span class=\"position-share\">阅读量:" + data["yuedu_count"] + "分享:" + data["share_count"] + " 时间:" + data["time"] + "</span>"+
					"</span>"+
				"</p>"+
				"<p class=\"position-author column-author\">"+
					"<img class=\"icon-author\" src=\""+data["releaser_touxiang"]+"\">" +
					"<span class=\"position-title\" id=\"position-title-2\"> " +
						"<span>" + data["name"] + "</span>" +
						"<span class=\"position-share\">" + data["qianming"] + "</span>"+
					"</span>"+
				"</p>"+
				"<p class=\"position-public column-status\">"+
					"<span class=\"position-title position-p\" id=\"position-title-3\">"+
						"<span>" + data["tuijian_message"] + "</span>"+
					"</span>"+
				"</p>"+
				"<p class=\"edit-exit column-operate\">"+
					"<a class=\"icon-edit icon-webpage\" href='tiaozhuan.jsp?updete_id=" + data["id"] + "'></a>"+
					"<a class=\"icon-edit icon-del\" href=tiaozhuan.jsp?del_id=" + data["id"] + " \"></a>"+
				"</p>"+
			"</li>";
}