
$(function() {
	//全部1,详情页广告2,轮播广告3
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/Handle_guanggao?Tag=1&type=search",args:{Tag:1}});
//	$("#page-2").pagination($("#clear-fix-2"),{url:"/mServer/Handle_guanggao?Tag=2&type=search",args:{Tag:2}});
//	$("#page-3").pagination($("#clear-fix-3"),{url:"/mServer/Handle_guanggao?Tag=3&type=search",args:{Tag:3}});
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
	var shangjia_Tag = data.shangjia_Tag;
	var shangjia_message = "";
	if(shangjia_Tag == "1"){
		shangjia_message = "已上架";
	}else if(shangjia_Tag == "2"){
		shangjia_message = "已下架";
	}
	return '<li>'+
			    '<p class="position-show-title column-content">'+
				    '<i class="position-circle "></i>'+
				    '<span class="position-title">'+
				        '<span class="advert-manage column-image">'+
				            '<img src="'+data.picture+'" alt="" />'+
				        '</span>'+
				        '<span class="advert-position column-position">'+data.url+'</span>'+
				        '<span class="position-share">点击量:'+data.dianji_count+'发布日期:'+new Date(data.time).format("yyyy-MM-dd")+'</span>'+
				    '</span>'+
				'</p>'+
				'<p class="position-author column-author">'+
				    '<span class="position-title advert-time">'+data.guanggao_name+'</span>'+
				'</p>'+
				'<p class="position-author column-status">'+
				    '<span class="position-title advert-time">'+
				        shangjia_message+
				    '</span>'+
				'</p>'+
				'<p class="edit-exit column-operate">'+
				    '<a class="icon-edit icon-webpage" href="/mServer/page/advert-add.jsp?type=edit&id='+data.id+'"></a>'+
				    '<a class="icon-edit icon-del" href="/mServer/GuanggaoServlet?type=delete&id='+data.id+'"></a>'
				'</p>'+
			'</li>';
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