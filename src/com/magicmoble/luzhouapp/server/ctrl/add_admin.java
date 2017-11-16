package com.magicmoble.luzhouapp.server.ctrl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.server.Admin;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

@WebServlet("/add_admin")
public class add_admin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		String id = paramMap.get("id");
		boolean flag = false;
		if(StringUtils.isNotBlank(type)){
			if(type.equals("edit")){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String time = sdf.format(new Date());
				Map<String, String> params = new HashMap<String,String>();
				params.put("admin_user", paramMap.get("admin_user"));
				params.put("password", paramMap.get("password"));
				params.put("admin_leixing", paramMap.get("admin_leixing"));
				params.put("name", paramMap.get("name"));
				params.put("phone", paramMap.get("phone"));
				params.put("admin_Tag", paramMap.get("admin_Tag"));
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					Server_Function.updateDataByTableAndId(Admin.class.getSimpleName().toLowerCase(),id,params);
				//添加
				}else{
					params.put("register_time", time);
					Server_Function.insertDataByTable(Admin.class.getSimpleName().toLowerCase(), params);
					id=params.get("id");
				}
				DataObject dataObject = new DataObject();
				dataObject.setdata(id);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
			}else if(type.equals("delete")){
				Server_Function.deleteDataByTbaleAndId(Admin.class.getSimpleName().toLowerCase(), id, null);
				//重定向
//				response.sendRedirect("/mServer/page/Administrator_management.jsp");
			}else if(type.equals("search")){
				List<Admin> list = new ArrayList<Admin>();
				
				String tag = request.getParameter("Tag");
				String admin_Tag = request.getParameter("admin_Tag");
				String register_time = request.getParameter("register_time");
				String name = request.getParameter("name");
				Map<String, String> params = new HashMap<String,String>();
				if(StringUtils.isNotBlank(register_time)){
					params.put("register_time", " like,'%"+register_time+"%'");
				}
				if(StringUtils.isNotBlank(name)){
					params.put("name", " like,'%"+name+"%'");
				}
				if(StringUtils.isNotBlank(admin_Tag)){
					params.put("admin_Tag", " =,'"+admin_Tag+"'");
				}
				switch(tag){
					case "1"://全部
						params.put("admin_leixing", "in,(1,2,3)");
						list = CommonBusiness.getPageDataByTable(Admin.class.getSimpleName().toLowerCase(),params,Admin.class);
						break;
					case "2"://超级管理员
						params.put("admin_leixing", " =,1");
						list = CommonBusiness.getPageDataByTable(Admin.class.getSimpleName().toLowerCase(),params,Admin.class);
						break;
					case "3"://编辑
						params.put("admin_leixing", " =,2");
						list = CommonBusiness.getPageDataByTable(Admin.class.getSimpleName().toLowerCase(),params,Admin.class);
						break;
					case "4"://财务
						params.put("admin_leixing", " =,3");
						list = CommonBusiness.getPageDataByTable(Admin.class.getSimpleName().toLowerCase(),params,Admin.class);
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
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String zhanghao = request.getParameter("zhanghao");
		String select = request.getParameter("select");
		String user_name = request.getParameter("user_name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");

		Server_Function.add_admin(zhanghao, user_name, password, phone, select);

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}
}
