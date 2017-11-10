package com.magicmoble.luzhouapp.server.ctrl;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.business.CommonBusiness;
import com.magicmoble.luzhouapp.entity.Shuoshuo;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;	
import com.magicmoble.luzhouapp.utils.ObjectUtils;

@WebServlet("/ShuoshuoServlet")
public class ShuoshuoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		Map<String,String> paramMap = new HashMap<String,String>();
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()){
			String name = names.nextElement();
			String value = request.getParameter(name);
			paramMap.put(name, value);
		}
		String id = null;
		boolean flag = false;
		if(StringUtils.isNotBlank(type)){
			if(type.equals("edit")){
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					List<Shuoshuo> shuoshuos = CommonBusiness.getDataByTable(Shuoshuo.class.getSimpleName().toLowerCase(), paramMap, Shuoshuo.class);
					if(shuoshuos.size() > 0 ){
						Shuoshuo shuoshuo = shuoshuos.get(0);
						int tuijian_Tag = StringUtils.isNotBlank(paramMap.get("tuijian_Tag")) ? Integer.valueOf(paramMap.get("tuijian_Tag")) : 0;
						int yuedu = StringUtils.isNotBlank(paramMap.get("yuedu")) ? Integer.valueOf(paramMap.get("yuedu")) : 0;
						int dianzan_count = StringUtils.isNotBlank(paramMap.get("dianzan_count")) ? Integer.valueOf(paramMap.get("dianzan_count")) : 0;
						shuoshuo.setTuijian_Tag(tuijian_Tag);
						shuoshuo.setContent(paramMap.get("content"));
						shuoshuo.setYuedu(yuedu);
						shuoshuo.setDianzan_count(dianzan_count);
						Map<String, String> data = ObjectUtils.entityToMap(shuoshuo);
						flag = Server_Function.updateDataByTableAndId(Shuoshuo.class.getSimpleName().toLowerCase(),paramMap.get("id"), data);
					}
				//新增
				}else{
					Shuoshuo shuoshuo = new Shuoshuo();
					int tuijian_Tag = StringUtils.isNotBlank(paramMap.get("tuijian_Tag")) ? Integer.valueOf(paramMap.get("tuijian_Tag")) : 0;
					int yuedu = StringUtils.isNotBlank(paramMap.get("yuedu")) ? Integer.valueOf(paramMap.get("yuedu")) : 0;
					int dianzan_count = StringUtils.isNotBlank(paramMap.get("dianzan_count")) ? Integer.valueOf(paramMap.get("dianzan_count")) : 0;
					shuoshuo.setTuijian_Tag(tuijian_Tag);
					shuoshuo.setContent(paramMap.get("content"));
					shuoshuo.setYuedu(yuedu);
					shuoshuo.setReleaser_id(paramMap.get("releaser_id"));
					shuoshuo.setDianzan_count(dianzan_count);
					shuoshuo.setTime(new Timestamp(new Date().getTime()));
					shuoshuo.setNow_time(new Timestamp(new Date().getTime()));
					Map<String, String> data = ObjectUtils.entityToMap(shuoshuo);
					int inserted = Server_Function.insterDataByTable(Shuoshuo.class.getSimpleName().toLowerCase(), data);
					if(inserted > 0){
						flag = true;
					}
					id = data.get("id");
				}
			}else if(type.equals("delete")){
				if(StringUtils.isNotBlank(paramMap.get("id"))){
				List<Shuoshuo> shuoshuos = CommonBusiness.getDataByTable(Shuoshuo.class.getSimpleName().toLowerCase(), paramMap, Shuoshuo.class);
					if(shuoshuos.size() > 0 ){
						flag = Server_Function.deleteDataByTbaleAndId(Shuoshuo.class.getSimpleName().toLowerCase(), paramMap.get("id"), null);
					}
				}
			}
			if(flag){
				DataObject dataObject = new DataObject();
				dataObject.setMsg("操作成功");
				dataObject.setdata(id);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
			}else{
				DataObject dataObject = new DataObject();
				dataObject.setMsg("操作失败");
				dataObject.setdata(null);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
			}
		}else{
			DataObject dataObject = new DataObject();
			dataObject.setMsg("操作失败,缺少字段:type");
			dataObject.setdata(null);
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
			String responseText = JackJsonUtils.toJson(dataObject);
			ResponseUtils.renderJson(response, responseText);
		}
	}
}
