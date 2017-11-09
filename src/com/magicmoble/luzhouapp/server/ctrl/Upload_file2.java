package com.magicmoble.luzhouapp.server.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.business.CommonBusiness;
import com.magicmoble.luzhouapp.business.FunctionBusiness;
import com.magicmoble.luzhouapp.json.core.DataObject;
import com.magicmoble.luzhouapp.json.responseUtils.ResponseUtils;
import com.magicmoble.luzhouapp.json.status.StatusHouse;
import com.magicmoble.luzhouapp.json.utils.JackJsonUtils;
import com.magicmoble.luzhouapp.json.utils.UploadPicture;
import com.magicmoble.luzhouapp.model.Hongbao;
import com.magicmoble.luzhouapp.model.Tuijian_list;
import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;
import com.mysql.jdbc.Blob;

import ognl.ArrayPropertyAccessor;
/**
 * 信息新增
 * @author jumili
 *
 */
public class Upload_file2 extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String str = "";
	int muban_Tag;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String select_val = request.getParameter("select-val");
		String title = request.getParameter("title");
		String publish_date = request.getParameter("publish_date");
		String user_name = request.getParameter("releaser_name");
		String _yuedu_count = request.getParameter("yuedu_count");
		String _dianzan_count = request.getParameter("dianzan_count");
		String _muban_Tag = request.getParameter("muban_Tag");
		int yuedu_count = 0;
		int dianzan_count = 0;
		int muban_Tag = 0;
		//阅读量
		if(StringUtils.isNotBlank(_yuedu_count)){
			yuedu_count = Integer.parseInt(_yuedu_count);
		}
		//点赞量
		if(StringUtils.isNotBlank(_dianzan_count)){
			dianzan_count = Integer.parseInt(_dianzan_count);
		}
		//模板
		if(StringUtils.isNotBlank(_muban_Tag)){
			muban_Tag = Integer.parseInt(_muban_Tag);
		}
		String releaser_id = request.getParameter("releaser_id");
		String price_fuwu = request.getParameter("price_fuwu");
		String price_commodity = request.getParameter("price_commodity");
		String dianpu_name = request.getParameter("dianpu_name");
		String shuliang = request.getParameter("shuliang");
		String freight = request.getParameter("freight");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String id = request.getParameter("id");
		String content = request.getParameter("content");
		String described = request.getParameter("described");
		
		String tuijian_user = request.getParameter("tuijian_user");
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String dzhongbao_price = request.getParameter("dzhongbao_price");
		String dzhongbao_count = request.getParameter("dzhongbao_count");
		String fxhongbao_price = request.getParameter("fxhongbao_price");
		String fxhongbao_count = request.getParameter("fxhongbao_count");
		String dashang_count = request.getParameter("dashang_count");


		// 图片
		String picture_str = "";
		if (select_val.equals("今日头条")) {
			if(StringUtils.isNotBlank(id)){
				Map<String, String> data = new HashMap<String,String>();
				data.put("picture", picture_str);
				data.put("title", title);
				data.put("name", user_name);
				data.put("content", content);
				data.put("muban_Tag", String.valueOf(muban_Tag));
				data.put("releaser_id", releaser_id);
				data.put("yuedu_count", String.valueOf(yuedu_count));
				data.put("dianzan_count", String.valueOf(dianzan_count));
				data.put("described", described);
				data.put("publish_date", publish_date);
				Server_Function.updateDataByTableAndId("toutiao", id, data);
			}else{
				id = Server_Function.add_toutiao(picture_str, title, user_name, content, muban_Tag, releaser_id, yuedu_count,dianzan_count,described,publish_date);
			}
		} else if (select_val.equals("酒城日记")) {
			 if(StringUtils.isNotBlank(id)){
					Map<String, String> data = new HashMap<String,String>();
					data.put("picture", picture_str);
					data.put("title", title);
					data.put("name", user_name);
					data.put("content", content);
					data.put("muban_Tag", String.valueOf(muban_Tag));
					data.put("releaser_id", releaser_id);
					data.put("yuedu_count", String.valueOf(yuedu_count));
					data.put("dianzan_count", String.valueOf(dianzan_count));
					data.put("described", described);
					data.put("publish_date", publish_date);
					Server_Function.updateDataByTableAndId("toutiao", id, data);
				}else{
					id = Server_Function.add_riji(picture_str, title, user_name, content, muban_Tag, releaser_id,described,publish_date);
				}
		} else if (select_val.equals("发现秘密")) {
			 if(StringUtils.isNotBlank(id)){
					Map<String, String> data = new HashMap<String,String>();
					data.put("picture", picture_str);
					data.put("title", title);
					data.put("name", user_name);
					data.put("content", content);
					data.put("muban_Tag", String.valueOf(muban_Tag));
					data.put("releaser_id", releaser_id);
					data.put("yuedu_count", String.valueOf(yuedu_count));
					data.put("dianzan_count", String.valueOf(dianzan_count));
					data.put("described", described);
					data.put("publish_date", publish_date);
					Server_Function.updateDataByTableAndId("faxian", id, data);
				}else{
					id = Server_Function.add_faxian(releaser_id, picture_str, title, user_name, content,muban_Tag,described,publish_date);
				}
		} else if (select_val.equals("有去处")) {
			 if(StringUtils.isNotBlank(id)){
					Map<String, String> data = new HashMap<String,String>();
					data.put("picture", picture_str);
					data.put("title", title);
					data.put("address", address);
					data.put("phone", phone);
					data.put("dianpu_name", dianpu_name);
					data.put("content", content);
					data.put("muban_Tag", String.valueOf(muban_Tag));
					data.put("releaser_id", releaser_id);
					data.put("yuedu", String.valueOf(yuedu_count));
					data.put("dianzhan_count", String.valueOf(dianzan_count));
					data.put("described", described);
					data.put("publish_date", publish_date);
					Server_Function.updateDataByTableAndId("quchu", id, data);
				}else{
					id = Server_Function.add_quchu(releaser_id, title, address, phone, picture_str, content,muban_Tag,described,publish_date);
				}
		} else if (select_val.equals("商品")) {
			 if(StringUtils.isNotBlank(id)){
					Map<String, String> data = new HashMap<String,String>();
					data.put("picture", picture_str);
					data.put("title", title);
					data.put("shuliang", shuliang);
					data.put("phone", phone);
					data.put("price", price_commodity);
					data.put("freight", freight);
					data.put("content", content);
					data.put("muban_Tag", String.valueOf(muban_Tag));
					data.put("releaser_id", releaser_id);
					data.put("yuedu", String.valueOf(yuedu_count));
					data.put("dianzan_count", String.valueOf(dianzan_count));
					data.put("described", described);
					data.put("publish_date", publish_date);
					Server_Function.updateDataByTableAndId("commodity", id, data);
				}else{
					id =  Server_Function.add_commodity(title, price_commodity, shuliang, freight, phone, picture_str, content,releaser_id,muban_Tag,described,publish_date);
				}
		} else if (select_val.equals("服务")) {
			 if(StringUtils.isNotBlank(id)){
					Map<String, String> data = new HashMap<String,String>();
					data.put("picture", picture_str);
					data.put("title", title);
					data.put("shuliang", shuliang);
					data.put("phone", phone);
					data.put("price", price_fuwu);
					data.put("freight", freight);
					data.put("content", content);
					data.put("muban_Tag", String.valueOf(muban_Tag));
					data.put("releaser_id", releaser_id);
					data.put("yuedu", String.valueOf(yuedu_count));
					data.put("dianzan_count", String.valueOf(dianzan_count));
					data.put("described", described);
					data.put("publish_date", publish_date);
					Server_Function.updateDataByTableAndId("fuwu", id, data);
				}else{
					id =  Server_Function.add_fuwu(releaser_id, title, price_fuwu, phone, picture_str, content,muban_Tag,described,publish_date);
				}
		}
		//
		//更新红包数量金额
		//查询是否有红包
		Map<String, String> paramsWhere = new HashMap<String,String>();
		paramsWhere.put("tiaomu_id", id);
		paramsWhere.put("hongbao_Tag", "1");
		List<Hongbao> dzHongbao = CommonBusiness.getDataByTable("hongbao", paramsWhere, Hongbao.class);
		if(dzHongbao.size() == 0){
			Map<String, String> params = new HashMap<String,String>();
			params.put("hongbao_Tag", "1");
			params.put("tiaomu_id", id);
			params.put("hongbao_price", dzhongbao_price);
			params.put("hongbao_count", dzhongbao_count);
			Server_Function.insterDataByTable("hongbao",params);
		}else{
			List<Hongbao> dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(id, "1");
			List<Hongbao> dzhongbaoupdate = new ArrayList<Hongbao>();
			for (Hongbao hongbao : dzHongbaos) {
				hongbao.setCount(Double.valueOf(dzhongbao_count));
				hongbao.setPrice(Double.valueOf(dzhongbao_price));
				dzhongbaoupdate.add(hongbao);
			}
			FunctionBusiness.updateHongbao(dzHongbaos);
		}
		paramsWhere.put("hongbao_Tag", "2");
		List<Hongbao> fxHongbao = CommonBusiness.getDataByTable("hongbao", paramsWhere, Hongbao.class);
		if(fxHongbao.size() == 0){
			Map<String, String> params = new HashMap<String,String>();
			params.put("hongbao_Tag", "2");
			params.put("tiaomu_id", id);
			params.put("hongbao_price", fxhongbao_price);
			params.put("hongbao_count", fxhongbao_count);
			Server_Function.insterDataByTable("hongbao",params);
		}else{
			//获取分享红包总金额和数量
			List<Hongbao> fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(id, "2");
			List<Hongbao> fxhongbaoupdate = new ArrayList<Hongbao>();
			for (Hongbao hongbao : fxHongbaos) {
				hongbao.setCount(Double.valueOf(fxhongbao_count));
				hongbao.setPrice(Double.valueOf(fxhongbao_price));
				fxhongbaoupdate.add(hongbao);
			}
			FunctionBusiness.updateHongbao(fxHongbaos);
		}
		//设置推荐
		Map<String, String> params = new HashMap<String,String>();
		params.put("tuijian_user", tuijian_user);
		params.put("tiaomu_id", id);
		List<Tuijian_list> tuijian_list = CommonBusiness.getDataByTable("tuijian_list", params,Tuijian_list.class);
		params.put("start_time", start_time);
		params.put("end_time", end_time);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		params.put("now_time", sdf.format(new Date()));
		//已有推荐人，直接修改
		if(tuijian_list.size() > 0){
			for (Tuijian_list list : tuijian_list) {
				Server_Function.updateDataByTableAndId("tuijian_list", list.getId(), params);
			}
		//没有推荐人从新添加一个关联
		}else{
			params.put("tiaomu_id", id);
			Server_Function.insterDataByTable("tuijian_list",params);
		}
		if(StringUtils.isNotBlank(id)){
			DataObject dataObject = new DataObject();
			dataObject.setdata(id);
			dataObject.setStatusObject(StatusHouse.COMMON_STATUS_OK);
			String responseText = JackJsonUtils.toJson(dataObject);
			ResponseUtils.renderJson(response, responseText);
		}
	}

	private boolean updateHongbao(String dzhongbao_count,String dzhongbao_price,String fxhongbao_count,String fxhongbao_price,String id){
		//获取点赞红包总金额和数量
		List<Hongbao> dzHongbaos = FunctionBusiness.getHongbaoByTiaomuId(id, "1");
		List<Hongbao> dzhongbaoupdate = new ArrayList<Hongbao>();
		for (Hongbao hongbao : dzHongbaos) {
			hongbao.setCount(Integer.valueOf(dzhongbao_count));
			hongbao.setPrice(Integer.valueOf(dzhongbao_price));
			dzhongbaoupdate.add(hongbao);
		}
		boolean updateHongbao1 = FunctionBusiness.updateHongbao(dzHongbaos);
		//获取分享红包总金额和数量
		List<Hongbao> fxHongbaos = FunctionBusiness.getHongbaoByTiaomuId(id, "2");
		List<Hongbao> fxhongbaoupdate = new ArrayList<Hongbao>();
		for (Hongbao hongbao : fxHongbaos) {
			hongbao.setCount(Integer.valueOf(fxhongbao_count));
			hongbao.setPrice(Integer.valueOf(fxhongbao_price));
			fxhongbaoupdate.add(hongbao);
		}
		boolean updateHongbao2 = FunctionBusiness.updateHongbao(dzHongbaos);
		return updateHongbao1 && updateHongbao2;
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);

	}
}
