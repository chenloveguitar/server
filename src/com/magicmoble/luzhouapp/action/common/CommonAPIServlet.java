package com.magicmoble.luzhouapp.action.common;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.status.StatusObject;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.Commodity;
import com.magicmoble.luzhouapp.model.Faxian;
import com.magicmoble.luzhouapp.model.Fuwu;
import com.magicmoble.luzhouapp.model.Quchu;
import com.magicmoble.luzhouapp.model.server.Toutiao;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

/**
 * Servlet implementation class CommonAPIServlet
 */
@WebServlet(name = "commonService", urlPatterns = { "/commonService" })
public class CommonAPIServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> params = new HashMap<String,String>();
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			String value = request.getParameter(name);
			params.put(name, value);
		}
		
		
		//必填字段
		String apiName = params.get("apiName");
		if(StringUtils.isBlank(apiName)){
			sendErrorMassage("参数不足,缺少apiName",response);
		}else{
			switch(apiName){
				case "share":
					String shareType = params.get("shareType");
					String tiaomu_id = params.get("tiaomu_id");
					boolean updated = false;
					if(StringUtils.isBlank(shareType)){
						sendErrorMassage("参数不足,缺少分享类型:shareType,shareType分为[头条/推荐:toutiao],[发现秘密:faxian],[有去处/店铺:quchu],[商品/物品:commodity],[服务:fuwu]",response);
					}else if(StringUtils.isBlank(tiaomu_id)){
						sendErrorMassage("参数不足,缺少被分享条目id:tiaomu_id",response);
					}else{
						Map<String, String> data = null;
						int shareCount = 0;
						switch(shareType){
							case "toutiao":
								Toutiao toutiao = Server_Function.findDataByTableAndId(shareType, tiaomu_id, Toutiao.class);
								data =  new HashMap<String,String>();
								shareCount = toutiao.getShare_count();
								data.put("share_count", String.valueOf(++shareCount));
								updated = Server_Function.updateDataByTableAndId(shareType, tiaomu_id,data);
								if(updated){
									sendSuccessMassage("分享成功",response);
								}else{
									sendErrorMassage("分享失败",response);
								}
							break;
							case "faxian":
								Faxian faxian = Server_Function.findDataByTableAndId(shareType, tiaomu_id, Faxian.class);
								data =  new HashMap<String,String>();
								shareCount = faxian.getShare_count();
								data.put("share_count", String.valueOf(++shareCount));
								updated = Server_Function.updateDataByTableAndId(shareType, tiaomu_id,data);
								if(updated){
									sendSuccessMassage("分享成功",response);
								}else{
									sendErrorMassage("分享失败",response);
								}
							break;
							case "quchu":
								Quchu quchu = Server_Function.findDataByTableAndId(shareType, tiaomu_id, Quchu.class);
								data =  new HashMap<String,String>();
								shareCount = quchu.getShare_count();
								data.put("share_count", String.valueOf(++shareCount));
								updated = Server_Function.updateDataByTableAndId(shareType, tiaomu_id,data);
								if(updated){
									sendSuccessMassage("分享成功",response);
								}else{
									sendErrorMassage("分享失败",response);
								}
							break;
							case "commodity":
								Commodity commodity = Server_Function.findDataByTableAndId(shareType, tiaomu_id, Commodity.class);
								data =  new HashMap<String,String>();
								shareCount = commodity.getShare_count();
								data.put("share_count", String.valueOf(++shareCount));
								updated = Server_Function.updateDataByTableAndId(shareType, tiaomu_id,data);
								if(updated){
									sendSuccessMassage("分享成功",response);
								}else{
									sendErrorMassage("分享失败",response);
								}
							break;
							case "fuwu":
								Fuwu fuwu = Server_Function.findDataByTableAndId(shareType, tiaomu_id, Fuwu.class);
								data =  new HashMap<String,String>();
								shareCount = fuwu.getShare_count();
								data.put("share_count", String.valueOf(++shareCount));
								updated = Server_Function.updateDataByTableAndId(shareType, tiaomu_id,data);
								if(updated){
									sendSuccessMassage("分享成功",response);
								}else{
									sendErrorMassage("分享失败",response);
								}
							break;
						}
					}
				break;
			}
		}
		
		
	}
	
	private void sendErrorMassage(String massage,HttpServletResponse response){
		sendMassage(massage, StatusHouse.COMMON_STATUS_ERROR, response);
	}
	
	private void sendSuccessMassage(String massage,HttpServletResponse response){
		sendMassage(massage, StatusHouse.COMMON_STATUS_OK, response);
	}
	
	private void sendMassage(String massage,StatusObject status,HttpServletResponse response){
		DataObject dataObject = new DataObject();
		dataObject.setdata(massage);
		dataObject.setStatusObject(status);
		String responseText = JackJsonUtils.toJson(dataObject);
		ResponseUtils.renderJson(response, responseText);
	}
	
	private String initialCapitalize(String string){
		char[] chars=string.toCharArray();
		chars[0]-=32;
        return String.valueOf(chars);
	}

}
