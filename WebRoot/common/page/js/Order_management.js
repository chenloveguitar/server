
$(function() {
	//全部1,商品2,服务3
	$("#page-1").pagination($("#clear-fix-1"),{url:"/mServer/add_admin?Tag=1&type=search",args:{Tag:1}});
	$("#page-2").pagination($("#clear-fix-2"),{url:"/mServer/add_admin?Tag=2&type=search",args:{Tag:2}});
	$("#page-3").pagination($("#clear-fix-3"),{url:"/mServer/add_admin?Tag=3&type=search",args:{Tag:3}});
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
				console.log(data);
				container.empty();
				container.append(lis);
			}
		});
	}
},"pagination");

function getLi(data,Tag) {
	
//	var admin_message = "";
//	var admin_Tag = data.admin_Tag;
//	switch(admin_Tag){
//		case 1:
//			admin_message = "正常";
//			break;
//		case 2:
//			admin_message = "离职";
//			break;
//		case 3:
//			admin_message = "休假";
//			break;
//	}
	
	return   '<li>'+
			    '<p class="position-show-title">'+
				    '<i class="position-circle"></i>'+ 
				    '<img class="position-square" src="'+data.pictures.get(0).picture_url+'" />'+ 
				    '<span class="position-title">'+ 
				        '<span>'+data.title+'</span> '+
				        '<span class="position-share">'+data.transaction_id+'</span>'+
				    '</span>'+
				'</p>'+
				'<p class="position-author position-aut">'+
				    '<img class="icon-author" src="'+data.buyer_touxiang+'" /> '+
				    '<span class="position-title">'+ 
				        '<span>'+data.buyer_name+'</span>'+
				    '</span>'+
				'</p>'+
				'<p class="position-author position-aut">'+
				    '<img class="icon-author" src="'+data.seller_touxiang+'" />'+ 
				    '<span class="position-title">'+ 
				        '<span>'+data.seller_name+'</span>'+
				    '</span>'+
				'</p>'+
				'<p class="position-author position-pub">'+
				    '<span class="position-title position-p">'+ 
				        '<span>数量</span>'+
				        '<span class="position-share">购买数量:'+data.shuliang+'</span>'+
				    '</span>'+ 
				    '<span class="position-title position-p">'+ 
				        '<span>总价</span>'+
				        '<span class="position-share">总价:'+data.total_price+'</span>'+
				    '</span>'+
				'</p>'+
				'<p class="edit-exit">'+
				    '<a class="icon-edit icon-webpage" href="/mServer/page/order-detail.jsp?order_id='+data.transaction_id+'&guangjie_fenlei_Tag='+data.guangjie_fenlei_Tag+'"></a>'+
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