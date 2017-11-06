package com.magicmoble.luzhouapp.action.click;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.magicmoble.luzhouapp.business.Dingdan_Business;
import com.magicmoble.luzhouapp.business.FaxianBusiness;
import com.magicmoble.luzhouapp.business.FunctionBusiness;
import com.magicmoble.luzhouapp.business.ToutiaoBusiness;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.core.ListObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.Create_order;
import com.magicmoble.luzhouapp.model.Faxian;
import com.magicmoble.luzhouapp.model.Toutiao;

public class Add_HeimingdanInq extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String yonghu_id = request.getParameter("yonghu_id");
		String my_id = request.getParameter("my_id");
		try {
			String str = FunctionBusiness.add_heimingdan(my_id, yonghu_id);

			DataObject dataObject = new DataObject();
			dataObject.setdata(str);
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
			String responseText = JackJsonUtils.toJson(dataObject);

			ResponseUtils.renderJson(response, responseText);

		}
		// catch (NullPointerException e) {
		// DataObject dataObject = new DataObject();
		// dataObject.setdata("请传入正确参数");
		// dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
		// String responseText = JackJsonUtils.toJson(dataObject);
		//
		// ResponseUtils.renderJson(response, responseText);
		// }
		catch (ArrayIndexOutOfBoundsException e) {
			DataObject dataObject = new DataObject();
			dataObject.setdata("json参数错误");
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
			String responseText = JackJsonUtils.toJson(dataObject);

			ResponseUtils.renderJson(response, responseText);
		}
		// catch (Exception e) {
		// DataObject dataObject = new DataObject();
		// dataObject.setdata("未知错误");
		// dataObject.setStatusObject(StatusHouse.COMMON_STATUS_ERROR);
		// String responseText = JackJsonUtils.toJson(dataObject);
		//
		// ResponseUtils.renderJson(response, responseText);
		// }
	}

}
