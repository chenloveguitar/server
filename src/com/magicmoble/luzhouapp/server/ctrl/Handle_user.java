package com.magicmoble.luzhouapp.server.ctrl;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.business.CommonBusiness;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.Admin_xinxi;
import com.magicmoble.luzhouapp.model.Login;
import com.magicmoble.luzhouapp.model.Pinglun;
import com.magicmoble.luzhouapp.model.Tuijian_user;
import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

public class Handle_user extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		String Tag = request.getParameter("Tag");
		String currentPage = request.getParameter("currentPage");
		String pageSize = request.getParameter("pageSize");
		CommonBusiness.CURRENT_PAGE = Integer.valueOf(currentPage == null ? "1":currentPage);
		Map<String,String> paramMap = new HashMap<String,String>();
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()){
			String name = names.nextElement();
			String value = request.getParameter(name);
			paramMap.put(name, value);
		}
		
		String id = paramMap.get("del_id");
		boolean flag = false;
		if(StringUtils.isNotBlank(type)){
			if(type.equals("edit")){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time = sdf.format(new Date());
				Map<String, String> adminParams = new HashMap<String,String>();
				Map<String, String> loginParams = new HashMap<String,String>();
				adminParams.put("yonghu_Tag", paramMap.get("yonghu_Tag"));
				adminParams.put("name", paramMap.get("user_name"));
				adminParams.put("sex", paramMap.get("sex"));
				adminParams.put("qianming", paramMap.get("qianming"));
				adminParams.put("phone", paramMap.get("zhanghao"));
				loginParams.put("phone", paramMap.get("zhanghao"));
				loginParams.put("password", paramMap.get("password"));
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					boolean updatedAdmin = Server_Function.updateDataByTableAndId(Admin_xinxi.class.getSimpleName().toLowerCase(),id,adminParams);
					boolean updatedLogin = Server_Function.updateDataByTableAndId(Login.class.getSimpleName().toLowerCase(), id, loginParams);
					if(updatedAdmin && updatedLogin){
						flag = true;
					}
				//添加
				}else{
					String uuid = UUID.randomUUID().toString();
					id = uuid;
					adminParams.put("id", id);
					loginParams.put("id", id);
					adminParams.put("time", time);
					int insertedAdmin = Server_Function.insertDataByTable(Admin_xinxi.class.getSimpleName().toLowerCase(), adminParams);
					int insertedLogin = Server_Function.insertDataByTable(Login.class.getSimpleName().toLowerCase(), loginParams);
					if(insertedAdmin > 0 && insertedLogin > 0){
						flag = true;
					}
					//重定向
				}
				DataObject dataObject = new DataObject();
				dataObject.setdata(id);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
			}else if(type.equals("delete")){
				Server_Function.deleteDataByTbaleAndId(Admin_xinxi.class.getSimpleName().toLowerCase(), id, null);
				//重定向
				response.sendRedirect("/mServer/page/User_management.jsp");
			}else if(type.equals("search")){
				List<Map<String, String>> list = new ArrayList<Map<String, String>>();
				String tag = request.getParameter("Tag");//被选中的页面
				String name = request.getParameter("name");//关键字
				String yonghu_Tag = request.getParameter("yonghu_Tag");//标签类型
				String classify = request.getParameter("classify");//分类
				String orderBy = request.getParameter("orderBy");//排序方式
				String sex = request.getParameter("sex");//性别
				Map<String, String> params = new HashMap<String,String>();
				if(StringUtils.isNotBlank(classify)){
					params.put("classify", "=,'"+paramMap.get("classify")+"'");
				}
				if(StringUtils.isNotBlank(name)){
					params.put("name", "like,'%"+paramMap.get("name")+"%'");
				}
				if(StringUtils.isNotBlank(orderBy)){
					params.put("orderBy", paramMap.get("orderBy"));
				}
				if(StringUtils.isNotBlank(sex)){
					params.put("sex",  "=,'"+paramMap.get("sex")+"'");
				}
				
				switch(tag){
					case "1"://全部
						list = CommonBusiness.getPageMapDataByTable(Admin_xinxi.class.getSimpleName().toLowerCase(), params);
						break;
					case "2"://推荐
						params.put("join", "l.id = r.tuijian_user_id");
						String selectFields = "l.touxiang_picture,l.`name`,l.qianbao, l.id, l.time, l.qianming";
					list = Server_Func.findDataToLinkedQuery(Admin_xinxi.class.getSimpleName().toLowerCase(), selectFields, Tuijian_user.class.getSimpleName().toLowerCase(), params);
						break;
					case "3"://普通用户
						params.put("yonghu_Tag", "=,'"+3+"'");
						list = CommonBusiness.getPageMapDataByTable(Admin_xinxi.class.getSimpleName().toLowerCase(), params);
						break;
					case "4"://名人
						params.put("yonghu_Tag", "=,'"+1+"'");
						list = CommonBusiness.getPageMapDataByTable(Admin_xinxi.class.getSimpleName().toLowerCase(), params);
						break;
					case "5"://团体企业
						params.put("yonghu_Tag", "=,'"+5+"'");
						list = CommonBusiness.getPageMapDataByTable(Admin_xinxi.class.getSimpleName().toLowerCase(), params);
						break;
					case "6"://编辑组
						params.put("yonghu_Tag", "=,'"+2+"'");
						list = CommonBusiness.getPageMapDataByTable(Admin_xinxi.class.getSimpleName().toLowerCase(), params);
						break;
				}
				Map<String, Object> page = new HashMap<String,Object>();
				int totalSize = CommonBusiness.TOTAL_SIZE;
				int totalPage = CommonBusiness.TOTAL_PAGE;
				page.put("results", list);
				page.put("totalSize", totalSize);
				page.put("totalPage", totalPage);
				DataObject dataObject = new DataObject();
				dataObject.setdata(page);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
			}
		}
		
//		String blur_rec = req.getParameter("guanjianzi_search");
//		String sex_change = req.getParameter("sex-change");
//		String sort_rec = req.getParameter("sort_rec");
//		String classify = req.getParameter("classify");
//		String del_id = req.getParameter("del_id");
//		String Tag = req.getParameter("Tag");
//		if ("" != sex_change && sex_change != null) {
//			List<User_model> list = Server_Function.sex_change(sex_change,Tag);
//			String responseText = JackJsonUtils.toJson(list);
//			 resp.getWriter().write(responseText);
//		}
//
//		if ("" != del_id && del_id != null) {
//			Server_Function.deleteDataByTbaleAndId(Admin_xinxi.class.getSimpleName().toLowerCase(), del_id, null);
//			resp.sendRedirect("/mServer/page/User_management.jsp");
//
//		}
//		if (blur_rec != null) {
//			List<User_model> list = Server_Function.search_User(blur_rec,Tag);
//			String responseText = JackJsonUtils.toJson(list);
//			ResponseUtils.renderJson(resp, responseText); 
//		}
//		if (sort_rec != null) {
//			List<Shuoshuo> list = Server_Function.sort(sort_rec, 1);
//			String responseText = JackJsonUtils.toJson(list);
//			ResponseUtils.renderJson(resp, responseText);
//		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
