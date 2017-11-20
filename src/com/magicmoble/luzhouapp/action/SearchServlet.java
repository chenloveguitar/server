package com.magicmoble.luzhouapp.action;

import java.io.IOException;
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
			
			String value = request.getParameter("value");
			value = StringUtils.isNotBlank(value) ? value : "";
	
			Map<String, String> tableParams = new HashMap<String, String>();
			tableParams.put("commodity", "id,title,content");
			tableParams.put("faxian", "id,title,content");
			tableParams.put("fuwu", "id,title,content");
			tableParams.put("quchu", "id,title,content");
			tableParams.put("toutiao", "id,title,content");
			Map<String, String> params = new HashMap<String, String>();
			params.put("searchValue", "(title like '%"+value+"%' or content like '%"+value+"%')" );
			
			List<Map<String, String>> list = CommonBusiness.findUnionAllDataQuery(tableParams, params);
			
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
