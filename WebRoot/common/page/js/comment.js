
$(function() {
	//全部1,头条2,日记3,图片4,秘密5,去处6,逛街7,
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/PinglunServlet?Tag=1&type=search",args:{Tag:1}});
	$("#page-2").pagination($("#clear-fix-2"),{url:"/mServer/PinglunServlet?Tag=2&type=search",args:{Tag:2}});
	$("#page-3").pagination($("#clear-fix-3"),{url:"/mServer/PinglunServlet?Tag=3&type=search",args:{Tag:3}});
	$("#page-4").pagination($("#clear-fix-4"),{url:"/mServer/PinglunServlet?Tag=4&type=search",args:{Tag:4}});
	$("#page-5").pagination($("#clear-fix-5"),{url:"/mServer/PinglunServlet?Tag=5&type=search",args:{Tag:5}});
	$("#page-6").pagination($("#clear-fix-6"),{url:"/mServer/PinglunServlet?Tag=6&type=search",args:{Tag:6}});
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
	
	var lianmu = "";
	var table_name = data["table_name"];
	switch(table_name){
	case "toutiao":
		lianmu = "头条";
		break;
	case "faxian":
		lianmu = "发现";
		break;
	case "quchu":
		lianmu = "去处";
		break;
	case "commodity":
		lianmu = "商品";
		break;
	case "fuwu":
		lianmu = "服务";
		break;
	}
	str = "";
	str += "<li>"+
				"<p class=\"position-show-title column-content\">"+
//				 <img class=\"position-square\"src=\"#\" /> " +//" + data["pictures"][0]["picture_url"] + 
					"<i class=\"position-circle\"></i>"+
					"<span class=\"position-title\" id=\"position-title-1\"> " +
					"<span>" + data["content"] + "</span>"+
					"<span class=\"position-share\">阅读量:" + /*data["yuedu_count"]*/ 0 + "&nbsp;分享:" + /*data["share_count"]*/ 0 + "&nbsp;点赞:"+data["dianzan_count"]+"&nbsp;收藏:"+ /*data["shoucang_count"]*/ 0 +"&nbsp;时间:" + data["time"] + "</span>"+
					"</span>"+
				"</p>"+
				"<p class=\"position-author column-author\">";
					if(data["pingluner_name"]){
						str += "<img class=\"icon-author\" src=\""+data["pingluner_touxiang"]+"\">";
					}
					str += "<span class=\"position-title\" id=\"position-title-2\"> " +
					"<span>" + data["pingluner_name"] + "</span>" +
//						"<span class=\"position-share\">" + data["qianming"] + "</span>"+
					"</span>"+
				"</p>"+
				"<p class=\"position-public column-status\">"+
					"<span class=\"position-title position-p\" id=\"position-title-3\">"+
						"<span>" + lianmu + "</span>"+
					"</span>"+
				"</p>"+
				"<p class=\"edit-exit column-operate\">"+
					"<a class=\"icon-edit icon-webpage\" href='comment-add.jsp?updete_id=" + data["id"] + "'></a>"+
					"<a class=\"icon-edit icon-del\" href=/mServer/PinglunServlet?type=delete&id=" + data["id"] + " \"></a>"+
				"</p>"+
			"</li>";
		return str;
}