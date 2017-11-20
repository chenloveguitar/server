package com.magicmoble.luzhouapp.action;

import java.io.IOException;
import java.util.ArrayList;
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
import com.magicmoble.luzhouapp.json.core.ListObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.Commodity;
import com.magicmoble.luzhouapp.model.Faxian;
import com.magicmoble.luzhouapp.model.Quchu;
import com.magicmoble.luzhouapp.model.Toutiao;
import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
    }
    
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			String currentPage = request.getParameter("currentPage");
			String pageSize = request.getParameter("pageSize");
			
			CommonBusiness.CURRENT_PAGE = StringUtils.isNotBlank(currentPage)?Integer.valueOf(currentPage):1;
			CommonBusiness.PAGE_SIZE = StringUtils.isNotBlank(pageSize)?Integer.valueOf(pageSize):Integer.MAX_VALUE;
			
			String searchValue = request.getParameter("searchValue");
			String searchType = request.getParameter("searchType");
			if(StringUtils.isBlank(searchType)){
				DataObject dataObject = new DataObject();
				dataObject.setdata("缺少查询类型参数:serchType,1为头条，2为发现,3为去处,4为商品!");
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
				String responseText = JackJsonUtils.toJson(dataObject);
				ResponseUtils.renderJson(response, responseText);
				return;
			}
			List<Map<String, String>> list = new ArrayList<Map<String,String>>();
			Map<String, String> params = new HashMap<String,String>();
			searchValue = StringUtils.isNotBlank(searchValue) ? searchValue : "";
			params.put("searchValue", "( title like '%"+searchValue+"%' or content like '%"+searchValue+"%' )");
			switch(searchType){
				case "1":
					list = CommonBusiness.getPageMapDataByTable(Toutiao.class.getSimpleName().toLowerCase(), params,"id,title,picture,(select name from admin_xinxi where id = releaser_id) name,DATE_FORMAT(time,'%Y-%m-%d %h:%i:%s') time");
					break;
				case "2":
					list = CommonBusiness.getPageMapDataByTable(Faxian.class.getSimpleName().toLowerCase(), params,"id,title,picture,(select name from admin_xinxi where id = releaser_id) name,DATE_FORMAT(time,'%Y-%m-%d %h:%i:%s') time");
					break;
				case "3":
					list = CommonBusiness.getPageMapDataByTable(Quchu.class.getSimpleName().toLowerCase(), params,"id,title,picture,(select name from admin_xinxi where id = releaser_id) name,DATE_FORMAT(time,'%Y-%m-%d %h:%i:%s') time");
					break;
				case "4":
					list = CommonBusiness.getPageMapDataByTable(Commodity.class.getSimpleName().toLowerCase(), params,"id,title,picture,(select name from admin_xinxi where id = releaser_id) name,DATE_FORMAT(time,'%Y-%m-%d %h:%i:%s') time");
					break;
			}
			ListObject listObject = new ListObject();
			listObject.setResult(list);
			DataObject dataObject = new DataObject();
			dataObject.setdata(listObject);
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
			String responseText = JackJsonUtils.toJson(dataObject);
			ResponseUtils.renderJson(response, responseText);
		}catch(Exception e){
			DataObject dataObject = new DataObject();
			dataObject.setdata("服务器内部错误!");
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
			String responseText = JackJsonUtils.toJson(dataObject);
			ResponseUtils.renderJson(response, responseText);
			e.printStackTrace();
		}
	}

}
