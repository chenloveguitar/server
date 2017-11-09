package com.magicmoble.luzhouapp.server.ctrl;

import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

import net.sf.json.JSONArray;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.server.Shuoshuo;
import com.magicmoble.luzhouapp.model.server.Shuoshuo_xiangqing;
import com.magicmoble.luzhouapp.model.server.Toutiao;

@WebServlet(name = "Handle_end_neirong", urlPatterns = { "/Handle_end_neirong" })
public class Handle_end_neirong extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String guangjianzi_search = req.getParameter("guangjianzi_search");
		String change_paixu = req.getParameter("change_paixu");
		String republish = req.getParameter("republish");
		String _flag = req.getParameter("Tag");
		String currentPage = req.getParameter("currentPage");
		String pageSize = req.getParameter("pageSize");
		Server_Function.CURRENT_PAGE = Integer.valueOf(currentPage == null ? "1":currentPage);
		Server_Func.CURRENT_PAGE = Integer.valueOf(currentPage == null ? "1":currentPage);
		int flag = 0;
		if(StringUtils.isNotBlank(_flag)){
			flag = Integer.valueOf(_flag);
		}
		String del_id = req.getParameter("del_id");
		if ("" != guangjianzi_search && guangjianzi_search != null) {

			List<Toutiao> list = Server_Function.end_search(guangjianzi_search, flag);
			int totalSize = Server_Function.TOTAL_SIZE;
			int totalPage = Server_Function.TOTAL_PAGE;
			Map<String, Object> page = new HashMap<String,Object>();
			page.put("results", list);
			page.put("totalSize", totalSize);
			page.put("totalPage", totalPage);
			DataObject dataObject = new DataObject();
			dataObject.setdata(page);
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
			String responseText = JackJsonUtils.toJson(dataObject);
			ResponseUtils.renderJson(resp, responseText);
			return;
		}
		if ("" != change_paixu && change_paixu != null) {
			List<Toutiao> list = Server_Function.end_paixu(change_paixu, flag);
			int totalSize = Server_Function.TOTAL_SIZE;
			int totalPage = Server_Function.TOTAL_PAGE;
			Map<String, Object> page = new HashMap<String,Object>();
			page.put("results", list);
			page.put("totalSize", totalSize);
			page.put("totalPage", totalPage);
			DataObject dataObject = new DataObject();
			dataObject.setdata(page);
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
			String responseText = JackJsonUtils.toJson(dataObject);
			ResponseUtils.renderJson(resp, responseText);
			return;
		}
		if ("" != republish && republish != null) {
			
			req.getRequestDispatcher("/page/Shuoshuo_management.jsp").forward(req, resp);
		}
		if ("" != del_id && del_id != null) {
			boolean isDelete = Server_Func.deleteShuoshuo(del_id);
			List<Shuoshuo_xiangqing> list = Server_Func.limitShuoshuo_ser(1, 15);
			req.setAttribute("list", list); //
			req.getRequestDispatcher("/page/Shuoshuo_management.jsp").forward(req, resp);
		}
		
//		头条1,日记2,图片3,秘密4,去处5,逛街6,全部7
		if(StringUtils.isBlank(guangjianzi_search) || 
				StringUtils.isBlank(change_paixu)){
			List<Toutiao> list = null;
			switch(_flag){
				case "1":
					list = Server_Func.all_end();
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
			ResponseUtils.renderJson(resp, responseText);
		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

}
