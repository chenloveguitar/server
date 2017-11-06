package com.magicmoble.luzhouapp.action.zhuye;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.magicmoble.luzhouapp.business.Admin_xinxi_Business;
import com.magicmoble.luzhouapp.business.GuanzhuBusiness;
import com.magicmoble.luzhouapp.business.LoginBusiness;
import com.magicmoble.luzhouapp.business.ZhuyeBusiness;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.core.ListObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.Admin_xinxi;
import com.magicmoble.luzhouapp.model.Faxian_Shouye;
import com.magicmoble.luzhouapp.model.Guangjie_Shouye;
import com.magicmoble.luzhouapp.model.Guanzhu;
import com.magicmoble.luzhouapp.model.Zhuye_Model;

public class Zhuye_getGuangjieInq extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String yonghu_id = request.getParameter("yonghu_id");
		String my_id = request.getParameter("my_id");
		String _page = request.getParameter("page");
		int page = 0;
		try {
			if (_page != null) {
				page = Integer.parseInt(_page);
			}
			if (my_id == null) {
				DataObject dataObject = new DataObject();
				dataObject.setdata("参数错误");
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
				String responseText = JackJsonUtils.toJson(dataObject);

				ResponseUtils.renderJson(response, responseText);
			} else {

				List<Guangjie_Shouye> model = ZhuyeBusiness.getZhuye_Guangjie(my_id, yonghu_id, page);

				ListObject listObject = new ListObject();

				listObject.setResult(model);

				DataObject dataObject = new DataObject();
				dataObject.setdata(listObject);
				dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
				String responseText = JackJsonUtils.toJson(dataObject);

				ResponseUtils.renderJson(response, responseText);
			}

		} catch (NullPointerException e) {
			DataObject dataObject = new DataObject();
			dataObject.setdata("请传入正确参数");
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
			String responseText = JackJsonUtils.toJson(dataObject);

			ResponseUtils.renderJson(response, responseText);
		} catch (ArrayIndexOutOfBoundsException e) {
			DataObject dataObject = new DataObject();
			dataObject.setdata("传入参数错误");
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
			String responseText = JackJsonUtils.toJson(dataObject);

			ResponseUtils.renderJson(response, responseText);
		} catch (Exception e) {
			DataObject dataObject = new DataObject();
			dataObject.setdata("未知错误");
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
			String responseText = JackJsonUtils.toJson(dataObject);

			ResponseUtils.renderJson(response, responseText);
		}
	}
}
