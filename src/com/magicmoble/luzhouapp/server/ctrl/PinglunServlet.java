package com.magicmoble.luzhouapp.server.ctrl;

import java.io.IOException;
import java.util.ArrayList;
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
import com.magicmoble.luzhouapp.model.Commodity;
import com.magicmoble.luzhouapp.model.Faxian;
import com.magicmoble.luzhouapp.model.Fuwu;
import com.magicmoble.luzhouapp.model.Pinglun;
import com.magicmoble.luzhouapp.model.Quchu;
import com.magicmoble.luzhouapp.model.server.Toutiao;
import com.magicmoble.luzhouapp.server.server_function.Server_Func;

/**
 * Servlet implementation class PinglunServlet
 */
@WebServlet("/PinglunServlet")
public class PinglunServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		String id = null;
		boolean flag = false;
		if(StringUtils.isNotBlank(type)){
			if(type.equals("edit")){
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					
				//添加
				}else{
					
				}
			}else if(type.equals("delete")){
				//重定向
				response.sendRedirect("");
			}else if(type.equals("search")){
				List<Map<String, String>> list = new ArrayList<Map<String,String>>();
				String tag = request.getParameter("Tag");
				Map<String, String> params = new HashMap<String,String>();
				params.put("content", " like,'%"+paramMap.get("content")+"%'");
				params.put("orderBy", paramMap.get("orderBy"));
				params.put("time", " =,"+paramMap.get("time"));
				switch(tag){
					case "1"://全部
						break;
					case "2"://头条
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),Toutiao.class.getSimpleName().toLowerCase(),params);
						break;
					case "3"://发现
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),Faxian.class.getSimpleName().toLowerCase(),params);
						break;
					case "4"://去处
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),Quchu.class.getSimpleName().toLowerCase(),params);
						break;
					case "5"://商品
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),Commodity.class.getSimpleName().toLowerCase(),params);
						break;
					case "6"://服务
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),Fuwu.class.getSimpleName().toLowerCase(),params);
						break;
				}
				Map<String, Object> page = new HashMap<String,Object>();
				int totalSize = Server_Func.TOTAL_SIZE;
				int totalPage = Server_Func.TOTAL_PAGE;
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
}
