package com.magicmoble.luzhouapp.server.ctrl;

import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;

import net.sf.json.JSONArray;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.business.CommonBusiness;
import com.magicmoble.luzhouapp.business.Dingdan_Business;
import com.magicmoble.luzhouapp.business.FunctionBusiness;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.model.Admin_xinxi;
import com.magicmoble.luzhouapp.model.Login;
import com.magicmoble.luzhouapp.model.Order;
import com.magicmoble.luzhouapp.model.Tuijian_user;
import com.magicmoble.luzhouapp.model.server.Dingdan;
import com.magicmoble.luzhouapp.model.server.Pay_list;
import com.magicmoble.luzhouapp.model.server.Shuoshuo;
import com.magicmoble.luzhouapp.model.server.Shuoshuo_xiangqing;

public class Handle_order extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
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
				Map<String, String> adminParams = new HashMap<String,String>();
				Map<String, String> loginParams = new HashMap<String,String>();
				adminParams.put("message", paramMap.get("message"));
				adminParams.put("pay_type", paramMap.get("pay_type"));
				adminParams.put("time", paramMap.get("time"));
				adminParams.put("transaction_id", paramMap.get("transaction_id"));
				adminParams.put("orderBy", paramMap.get("orderBy"));
				loginParams.put("phone", paramMap.get("zhanghao"));
				loginParams.put("password", paramMap.get("password"));
				//编辑
				if(StringUtils.isNotBlank(paramMap.get("id"))){
					id = paramMap.get("id");
					boolean updatedAdmin = Server_Function.updateDataByTableAndId(Admin_xinxi.class.getSimpleName().toLowerCase(),paramMap.get("id"),adminParams);
					boolean updatedLogin = Server_Function.updateDataByTableAndId(Login.class.getSimpleName().toLowerCase(), paramMap.get("id"), loginParams);
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
				String orderType = request.getParameter("order_type");
				String tag = request.getParameter("Tag");//被选中的页面
				String searchValue = request.getParameter("searchValue");//关键字
//				String transaction_id = request.getParameter("transaction_id");//分类
				String pay_type = request.getParameter("pay_type");//标签类型
				String pay_status = request.getParameter("pay_status");//标签类型
				String time = request.getParameter("time");//分类
				String orderBy = request.getParameter("orderBy");//排序方式
				Map<String, String> params = new HashMap<String,String>();
				if(StringUtils.isNotBlank(pay_status)){
					if(pay_status.equals("success")){
						params.put("message", "=,'success'");
					}else if(pay_status.equals("no_pay")){
						params.put("message", "is not null, ");
					}else if(pay_status.equals("pay_error")){
						params.put("message", "is null, ");
					}
				}
				if(StringUtils.isNotBlank(time)){
					params.put("time", "like,'%"+paramMap.get("time")+"%'");
				}
				if(StringUtils.isNotBlank(searchValue)){
					params.put("searchValue", "(transaction_id LIKE '%"+searchValue+"%' OR title LIKE '%"+searchValue+"%')");
				}
				if(StringUtils.isNotBlank(orderBy)){
					params.put("orderBy", paramMap.get("orderBy"));
				}
				if(StringUtils.isNotBlank(pay_type)){
					params.put("pay_type",  "=,'"+paramMap.get("pay_type")+"'");
				}
				
				switch(orderType){
					case "djd"://待接单
						params.put("seller_zhuangtai",  "=,'2'");
						params.put("buyer_zhuangtai",  "=,'2'");
						break;
					case "jxz"://进行中
						params.put("seller_zhuangtai",  "=,'3'");
						params.put("buyer_zhuangtai",  "=,'3'");
						break;
					case "ywc"://已完成
						params.put("seller_zhuangtai",  "=,'5'");
						params.put("buyer_zhuangtai",  "=,'5'");
						break;
					case "yqx"://已取消
						params.put("seller_zhuangtai",  "=,'7'");
						params.put("buyer_zhuangtai",  "=,'7'");
						break;
					case "yzy"://有争议
						params.put("seller_zhuangtai",  "=,'6'");
						params.put("buyer_zhuangtai",  "=,'6'");
						break;
				}
				
				String selectFields = "l.guangjie_fenlei_Tag,l.buyer_zhuangtai,l.seller_zhuangtai,l.tiaomu_id, "
						+ "(select NAME FROM admin_xinxi where id=l.seller_id) as seller_name, "
						+ "(select NAME FROM admin_xinxi where id=l.buyer_id) as buyer_name, "
						+ "(select touxiang_picture FROM admin_xinxi WHERE id=l.seller_id) as seller_picture,"
						+ "(select touxiang_picture FROM admin_xinxi WHERE id=l.buyer_id) as buyer_picture,"
						+ "l.shuliang,l.total_price,l.id,"
						+ "( SELECT picture FROM commodity WHERE guangjie_fenlei_Tag = l.guangjie_fenlei_Tag AND id = l.tiaomu_id ) AS picture,"
						+ "(select title from commodity where guangjie_fenlei_Tag = l.guangjie_fenlei_Tag AND id = l.tiaomu_id) as title,"
						+ "l.transaction_id,l.time,r.message,r.pay_type";
				params.put("join", "l.transaction_id = r.transaction_id");
				switch(tag){
					case "1"://全部
						params.put("guangjie_fenlei_Tag",  "in('1','2')");
						list = Server_Func.findLinkedQueryData(Dingdan.class.getSimpleName().toLowerCase(), selectFields, Pay_list.class.getSimpleName().toLowerCase(), params);
						break;
					case "2"://商品
						params.put("guangjie_fenlei_Tag",  "in('1')");
						list = Server_Func.findLinkedQueryData(Dingdan.class.getSimpleName().toLowerCase(), selectFields, Pay_list.class.getSimpleName().toLowerCase(), params);
						break;
					case "3"://服务
						params.put("guangjie_fenlei_Tag",  "in('2')");
						list = Server_Func.findLinkedQueryData(Dingdan.class.getSimpleName().toLowerCase(), selectFields, Pay_list.class.getSimpleName().toLowerCase(), params);
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
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String del_id = req.getParameter("del_id");
		if ("" != del_id && del_id != null) {
			boolean isDelete = Server_Func.deleteShuoshuo(del_id);

			List<Shuoshuo_xiangqing> list = Server_Func.limitShuoshuo_ser(1, 15);
			req.setAttribute("list", list); //
			// response.sendRedirect("/mServer/page/Shuoshuo_management.jsp");
			req.getRequestDispatcher("/page/order-detail.jsp").forward(req, resp);

		}
		String order_id = req.getParameter("order_id");
		String _guangjie_fenlei_Tag = req.getParameter("guangjie_fenlei_Tag");
		int guangjie_fenlei_Tag = Integer.parseInt(_guangjie_fenlei_Tag);
		if ("" != order_id && order_id != null) {
			Order order = Dingdan_Business.order_click(order_id, "1", guangjie_fenlei_Tag);

			req.setAttribute("list", order); //
			// response.sendRedirect("/mServer/page/Shuoshuo_management.jsp");
			req.getRequestDispatcher("/page/order-detail.jsp").forward(req, resp);

		}

	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

}
