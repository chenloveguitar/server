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
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

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
		Server_Func.CURRENT_PAGE = Integer.valueOf(currentPage == null ? "1":currentPage);
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
				params.put("tiaomu_type", paramMap.get("tiaomu_type"));
				params.put("tiaomu_id", paramMap.get("tiaomu_id"));
				params.put("pingluner_id", paramMap.get("pingluner_id"));
				params.put("content", paramMap.get("content"));
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					Server_Function.updateDataByTableAndId(Pinglun.class.getSimpleName().toLowerCase(),id,params);
					//重定向
					response.sendRedirect("/mServer/page/comment.jsp");
				//添加
				}else{
					params.put("time", time);
					params.put("see_time", time);
					params.put("now_time", time);
					params.put("dianzan_count", "0");
					Server_Function.insterDataByTable(Pinglun.class.getSimpleName().toLowerCase(), params);
					//重定向
					response.sendRedirect("/mServer/page/comment.jsp");
				}
			}else if(type.equals("delete")){
				Server_Function.deleteDataByTbaleAndId(Pinglun.class.getSimpleName().toLowerCase(), id, null);
				//重定向
				response.sendRedirect("/mServer/page/comment.jsp");
			}else if(type.equals("search")){
				List<Map<String, String>> list = new ArrayList<Map<String,String>>();
				String tag = request.getParameter("Tag");
				String time = request.getParameter("time");
				String content = request.getParameter("content");
				String orderBy = request.getParameter("orderBy");
				String tuijian_Tag = request.getParameter("tuijian_Tag");
				Map<String, String> params = new HashMap<String,String>();
				if(StringUtils.isNotBlank(time)){
					params.put("l.time", " like,'%"+paramMap.get("time")+"%'");
				}
				if(StringUtils.isNotBlank(content)){
					params.put("l.content", " like,'%"+paramMap.get("content")+"%'");
				}
				if(StringUtils.isNotBlank(orderBy)){
					params.put("orderBy", paramMap.get("orderBy"));
				}
				if(StringUtils.isNotBlank(tuijian_Tag)){
					params.put("l.tuijian_Tag", " =,l.'"+paramMap.get("tuijian_Tag")+"'");
				}
				
				params.put("join", "l.tiaomu_id = r.id");
				
				String selectFields = "l.id,l.tiaomu_id,l.pingluner_id,l.time,l.dianzan_count,l.now_time,l.content";
				
				switch(tag){
					case "1"://全部
						list = Server_Func.findUnionAllDataToLinkedQuery(
								Pinglun.class.getSimpleName().toLowerCase(),
								selectFields,
								params, 
								Toutiao.class.getSimpleName().toLowerCase(),
								Faxian.class.getSimpleName().toLowerCase(),
								Quchu.class.getSimpleName().toLowerCase(),
								Commodity.class.getSimpleName().toLowerCase(),
								Fuwu.class.getSimpleName().toLowerCase());
						break;
					case "2"://头条
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),selectFields,Toutiao.class.getSimpleName().toLowerCase(),params);
						break;
					case "3"://发现
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),selectFields,Faxian.class.getSimpleName().toLowerCase(),params);
						break;
					case "4"://去处
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),selectFields,Quchu.class.getSimpleName().toLowerCase(),params);
						break;
					case "5"://商品
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),selectFields,Commodity.class.getSimpleName().toLowerCase(),params);
						break;
					case "6"://服务
						list = Server_Func.findDataToLinkedQuery(Pinglun.class.getSimpleName().toLowerCase(),selectFields,Fuwu.class.getSimpleName().toLowerCase(),params);
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
