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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.business.CommonBusiness;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.json.utils.UploadPicture;
import com.magicmoble.luzhouapp.model.Commodity;
import com.magicmoble.luzhouapp.model.Faxian;
import com.magicmoble.luzhouapp.model.Fuwu;
import com.magicmoble.luzhouapp.model.Pinglun;
import com.magicmoble.luzhouapp.model.Quchu;
import com.magicmoble.luzhouapp.model.server.Advertisement;
import com.magicmoble.luzhouapp.model.server.Toutiao;
import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

public class Handle_guanggao extends HttpServlet {
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
				params.put("guanggao_id", paramMap.get("guanggao_id"));
				params.put("fenlei_Tag", paramMap.get("fenlei_Tag"));
				params.put("url", paramMap.get("url"));
				params.put("guanggao_name", paramMap.get("guanggao_name"));
				if(StringUtils.isNotBlank(paramMap.get("guangjie_fenlei_Tag"))){
					params.put("guangjie_fenlei_Tag", paramMap.get("guangjie_fenlei_Tag"));
				}
				params.put("shangjia_Tag", paramMap.get("shangjia_Tag"));
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					Server_Function.updateDataByTableAndId(Advertisement.class.getSimpleName().toLowerCase(),id,params);
				//添加
				}else{
					params.put("time", time);
					params.put("muban_Tag", "4");
					Server_Function.insertDataByTable(Advertisement.class.getSimpleName().toLowerCase(), params);
					id=params.get("id");
				}
				DataObject dataObject = new DataObject();
				dataObject.setdata(id);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
			}else if(type.equals("delete")){
				Server_Function.deleteDataByTbaleAndId(Advertisement.class.getSimpleName().toLowerCase(), id, null);
				//重定向
				response.sendRedirect("/mServer/page/comment.jsp");
			}else if(type.equals("search")){
				List<Advertisement> list = new ArrayList<Advertisement>();
				
				String tag = request.getParameter("Tag");
				String shangjia_Tag = request.getParameter("shangjia_Tag");
				String time = request.getParameter("time");
				String guanggao_name = request.getParameter("guanggao_name");
				String orderBy = request.getParameter("orderBy");
				Map<String, String> params = new HashMap<String,String>();
				if(StringUtils.isNotBlank(time)){
					params.put("time", " like,'%"+paramMap.get("time")+"%'");
				}
				if(StringUtils.isNotBlank(guanggao_name)){
					params.put("guanggao_name", " like,'%"+paramMap.get("guanggao_name")+"%'");
				}
				if(StringUtils.isNotBlank(shangjia_Tag)){
					params.put("shangjia_Tag", " =,'"+paramMap.get("shangjia_Tag")+"'");
				}
				if(StringUtils.isNotBlank(orderBy)){
					params.put("orderBy", paramMap.get("orderBy"));
				}
				switch(tag){
					case "1"://发现
						list = CommonBusiness.getPageDataByTable(Advertisement.class.getSimpleName().toLowerCase(),params,Advertisement.class);
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
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] banner = req.getParameterValues("banner");
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for (int i = 0; i < banner.length; i++) {
			Map<String, String> map = new HashMap<String, String>();

			if (i % 4 == 0) {
				map.put("picture", banner[i]);
			} else if (i % 4 == 1) {
				map.put("select1", banner[i]);
			} else if (i % 4 == 2) {
				map.put("select2", banner[i]);
			} else if (i % 4 == 3) {
				map.put("url", banner[i]);
			}

			list.add(map);
		}
		for (

		int j = 0; j < list.size(); j++)

		{
			String[] a = list.get(j).get("picture").split(",");
			String img_base64 = a[1].substring(0, a[1].length() - 1);
			String dataString = new Date().getTime() + "" + (Math.round(Math.random() * 10000)) + ".jpeg";
			String path = req.getRealPath("/upload/textpicture");
			String ServicePath = path + "/" + dataString;
			UploadPicture.GenerateImage(img_base64, ServicePath);
			String url = "http://120.92.169.86/mServer/upload/textpicture/" + dataString;
			Server_Function.add_guanggao(url, list.get(j).get("select1"), list.get(j).get("select2"), url);
		}
		req.getRequestDispatcher("page/Advertisement_management.jsp").forward(req, resp);

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

}
