package com.magicmoble.luzhouapp.business;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;

import com.magicmoble.luzhouapp.entity.Shuoshuo;
import com.magicmoble.luzhouapp.model.Admin_xinxi;
import com.magicmoble.luzhouapp.model.FileManagement;
import com.magicmoble.luzhouapp.model.Renzheng;
import com.magicmoble.luzhouapp.model.Tuijian_list;
import com.magicmoble.luzhouapp.server.server_function.Server_Func;
import com.magicmoble.luzhouapp.server.server_function.Server_Function;
import com.mysql.jdbc.Statement;

public class CommonBusiness {

	public static Integer PAGE_SIZE = 5;//每页显示条数
	public static Integer TOTAL_SIZE = 0;//总条数
	public static Integer CURRENT_PAGE = 0;//当前页
	public static Integer TOTAL_PAGE = 0;//总页数
	
	public static Integer getTotalSize(String sql){
		StringBuilder countSql = new StringBuilder(" select count(results.id) from (");
		countSql.append(sql);
		countSql.append(") as results ");
		DBHelper db1 = new DBHelper(countSql.toString());
		try {
			ResultSet resultSet = db1.pst.executeQuery();
			if(resultSet.next()){
				return resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public static String getLimitSql(String sql){
		String limitSql = "SELECT results.* FROM (" + sql +") as results limit "+(CURRENT_PAGE - 1) * PAGE_SIZE+" ," +PAGE_SIZE;
		return limitSql;
	}
	
	public static List<Map<String, String>> findUnionAllDataQuery(Map<String, String> TableNames,Map<String, String> params) {
		StringBuilder sql = new StringBuilder();
//		sql.append(" select * from(");
		Set<String> keySet = TableNames.keySet();
		List<String> keyList = new ArrayList<>(keySet);
		for (int i = 0; i < keyList.size(); i++) {
			sql.append(" select ");
			sql.append(TableNames.get(keyList.get(i)) + ",'" + keyList.get(i) + "' as " + "table_name") ;  
			sql.append(" from ");
			sql.append(keyList.get(i));
			sql.append(" where 1=1 ");
			Set<String> keys = params.keySet();
			for (Iterator<String> iterator = keys.iterator(); iterator.hasNext();) {
				String key =  iterator.next();
				if(!key.equals("orderBy") && !key.equals("searchValue")){
					String value = params.get(key);
					if(value.contains(",")){
						String[] symbol = value.split(",");
						sql.append(" and " + key + " " + symbol[0] + " " + " " + symbol[1]);
					}
				}
				if(key.equals("searchValue")){
					String value = params.get(key);
						sql.append(" and " + value);
				}
			}
			if(i < keyList.size() - 1){
				sql.append(" union all ");
			}
		}
//		sql.append(" )");
		TOTAL_SIZE = getTotalSize(sql.toString());
		if(params.containsKey("orderBy")){
			String[] values = params.get("orderBy").split(",");
			sql.append(" order by " + values[0] + " " + values[1]);
		}
		String limitSql = getLimitSql(sql.toString());
		DBHelper db = null;
		ResultSet ret = null;
		List<Map<String, String>> lists = new ArrayList<Map<String,String>>();
		try {
			db = new DBHelper(limitSql);
			ret = db.pst.executeQuery();
			while(ret.next()){
				ResultSetMetaData metaData = ret.getMetaData();
				Map<String, String> data = new HashMap<String,String>();
				int count = metaData.getColumnCount();
				for (int i = 1; i <= count; i++) {
					String key = metaData.getColumnLabel(i);
					String value = ret.getString(i);
					if(key.equals("pingluner_id")){
						Admin_xinxi admin = Admin_xinxi_Business.getAdmin_xinxiInfoById(value);
						String pingluner_name = admin.getName();
						String pingluner_touxiang = admin.getTouxiang_picture();
						data.put("pingluner_name", pingluner_name);
						data.put("pingluner_touxiang", pingluner_touxiang);
					}
					data.put(key, value);
				}
				lists.add(data);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return lists;
	}
	
	/**
	 * 注意:该方法需要在进行只支持and条件拼接,
	 * 对于like查询或等值查询时需要传入'%value%' 或 'value',
	 * 考虑到不确定会是等值还是like查询,所以程序中在查询字符串数据的时候需要自己拼接''
	 * 如果有排序需要添加orderBy字段,并将改字段的值设置为 field 排序方式,如:create_time desc
	 * @param table_name
	 * @param params
	 * @param c
	 * @return
	 */
	public static <T>List<T> getPageDataByTable(String table_name,Map<String, String> params,Class<T> c){
		String sql = "select * from " + table_name + " where 1=1 ";
		Set<String> keys = params.keySet();
		Iterator<String> iterator = keys.iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			if(!key.equals("orderBy")){
				if(params.get(key).contains(",")){
					String[] values = params.get(key).split(",");
					String symbol = values[0];
					String value = values[1];
					if(symbol.trim().equals("in")){
						value = params.get(key).replace("in", "");
						value = value.replace("in", "").substring(1, value.length());
					}
					sql += " and " + key + " " + " " + symbol + " " + value;
				}
			}
		}
		
		TOTAL_SIZE = getTotalSize(sql);
		if(params.containsKey("orderBy")){
			String[] values = params.get("orderBy").split(",");
			sql += " order by " + values[0] + " " + values[1];
		}
		sql = getLimitSql(sql);
		
		DBHelper db = null;
		ResultSet ret = null;
		List<T> lists = new ArrayList<T>();
		try {
			db = new DBHelper(sql);
			ret = db.pst.executeQuery();
			while(ret.next()){
				T t = c.newInstance();
				ResultSetMetaData metaData = ret.getMetaData();
				int count = metaData.getColumnCount();
				for (int i = 1; i <= count; i++) {
					String columnLabel = metaData.getColumnLabel(i);
					
					PropertyDescriptor property = new PropertyDescriptor(columnLabel,t.getClass());
		            Method method = property.getWriteMethod();
		            Class<?> type = method.getParameterTypes()[0];
		            if(type.getName().equals("java.util.List")){
		            	List<String> list = new ArrayList<String>();
		            	String value = ret.getString(i);
		            	if(StringUtils.isNotBlank(value)){
		            		String[] split = value.split(",");
		            		for (int j = 0; j < split.length; j++) {
		            			list.add(split[j]);
							}
		            	}
		            	method.invoke(t, list);
		            }else if(type.getName().equals("java.lang.String")){
		            	String value = ret.getString(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("java.sql.Timestamp")){
		            	Timestamp value = ret.getTimestamp(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("int")){
		            	int value = ret.getInt(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("java.lang.Integer")){
		            	int value = ret.getInt(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("float")){
		            	float value = ret.getFloat(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("double")){
		            	double value = ret.getDouble(i);
		            	method.invoke(t, value);
		            }
				}
				lists.add(t);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return lists;
	}
	
	public static List<Map<String, String>> getPageMapDataByTable(String table_name,Map<String, String> params,String...selectFields){
		String selectField = "*";
		if(selectFields != null && selectFields.length > 0){
			selectField = selectFields[0];
		}
		String sql = "select "+selectField+" from " + table_name + " where 1=1 ";
		Set<String> keys = params.keySet();
		Iterator<String> iterator = keys.iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			if(!key.equals("orderBy")){
				if(params.get(key).contains(",")){
					String[] values = params.get(key).split(",");
					String symbol = values[0];
					String value = values[1];
					sql += " and " + key + " " + " " + symbol + " " + value;
				}
				if(params.get(key).equals("searchValue")){
					String value = params.get("searchValue");
					sql += " and " + value;
				}
			}
		}
		
		TOTAL_SIZE = getTotalSize(sql);
		if(params.containsKey("orderBy")){
			String[] values = params.get("orderBy").split(",");
			sql += " order by " + values[0] + " " + values[1];
		}
		sql = getLimitSql(sql);
		
		DBHelper db = null;
		ResultSet ret = null;
		List<Map<String, String>> lists = new ArrayList<Map<String, String>>();
		try {
			db = new DBHelper(sql);
			ret = db.pst.executeQuery();
			while(ret.next()){
				Map<String, String> data = new HashMap<String,String>();
				ResultSetMetaData metaData = ret.getMetaData();
				int count = metaData.getColumnCount();
				for (int i = 1; i <= count; i++) {
					String columnLabel = metaData.getColumnLabel(i);
					String value = ret.getString(i);
					data.put(columnLabel, value);
				}
				if(table_name.equals(Admin_xinxi.class.getSimpleName().toLowerCase())){
					int fensi = GuanzhuBusiness.getZhuye_Friend_id(data.get("id"), 0).size();
					int guanzhu = GuanzhuBusiness.getZhuye_My_id(data.get("id"), 0).size();
					Renzheng renzheng = Server_Function.findDataByTableAndId(Renzheng.class.getSimpleName().toLowerCase(), data.get("id"), Renzheng.class);
					String  renzheng_Tag = renzheng.getRenzheng_Tag();
					String renzheng_message = "";
					if(StringUtils.isNotBlank(renzheng_Tag)){
						if (renzheng_Tag.equals("1")) {
							renzheng_Tag = "未认证";
						} else if (renzheng_Tag.equals("2")) {
							renzheng_Tag = "认证中";
						} else if (renzheng_Tag.equals("3")) {
							renzheng_Tag = "已认证";
						}
					}
					data.put("fensi", String.valueOf(fensi));
					data.put("guanzhu", String.valueOf(guanzhu));
					data.put("renzheng_Tag", String.valueOf(renzheng_message));
				}
				lists.add(data);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return lists;
	}
	
	public static void main(String[] args) {
		Map<String, String> params = new HashMap<>();
		Map<String, String> tableParams = new HashMap<>();
		tableParams.put("commodity", "id,title");
		tableParams.put("faxian", "id,title");
		tableParams.put("fuwu", "id,title");
		tableParams.put("quchu", "id,title");
		tableParams.put("toutiao", "id,title");
		params.put("title", "like,'%%'");
		CommonBusiness.CURRENT_PAGE = 1;
//		params.put("tiaomu_id", "2");
//		params.put("tuijian_user", "3C41163EAF3FED61BFB009766D58864D");
//		List<Tuijian_list> list = getDataByTable("tuijian_list", params, Tuijian_list.class);
//		params.put("content", "like,'%点滴滴%'");
//		params.put("orderBy", "time,desc");
		List<Map<String, String>> list = findUnionAllDataQuery(tableParams, params);
		
		System.out.println(list);
	}
	
	public static <T>List<T> getDataByTable(String table_name,Map<String, String> params,Class<T> c){
		String sql = "select * from " + table_name + " where 1=1 ";
		Set<String> keys = params.keySet();
		Iterator<String> iterator = keys.iterator();
		while (iterator.hasNext()) {
			String key = iterator.next();
			sql += " and " + key + " = " + "'"+params.get(key)+"'";
		}
		DBHelper db = null;
		ResultSet ret = null;
		List<T> lists = new ArrayList<T>();
		try {
			db = new DBHelper(sql);
			ret = db.pst.executeQuery();
			while(ret.next()){
				T t = c.newInstance();
				ResultSetMetaData metaData = ret.getMetaData();
				int count = metaData.getColumnCount();
				for (int i = 1; i <= count; i++) {
					String columnLabel = metaData.getColumnLabel(i);
					
					PropertyDescriptor property = new PropertyDescriptor(columnLabel,t.getClass());
		            Method method = property.getWriteMethod();
		            Class<?> type = method.getParameterTypes()[0];
		            if(type.getName().equals("java.util.List")){
		            	List<String> list = new ArrayList<String>();
		            	String value = ret.getString(i);
		            	if(StringUtils.isNotBlank(value)){
		            		String[] split = value.split(",");
		            		for (int j = 0; j < split.length; j++) {
		            			list.add(split[j]);
							}
		            	}
		            	method.invoke(t, list);
		            }else if(type.getName().equals("java.lang.String")){
		            	String value = ret.getString(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("java.sql.Timestamp")){
		            	Timestamp value = ret.getTimestamp(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("int")){
		            	int value = ret.getInt(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("java.lang.Integer")){
		            	int value = ret.getInt(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("float")){
		            	float value = ret.getFloat(i);
		            	method.invoke(t, value);
		            }else if(type.getName().equals("double")){
		            	double value = ret.getDouble(i);
		            	method.invoke(t, value);
		            }
				}
				lists.add(t);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			db.close();
		}
		return lists;
	}
	
	public List<Admin_xinxi> getUsers(){
		List<Admin_xinxi> lists = new ArrayList<Admin_xinxi>();
		String sql = "select * from admin_xinxi";
		DBHelper db = new DBHelper(sql);
		try {
			ResultSet resultSet = db.pst.executeQuery();
			while (resultSet.next()) {
				String admin_xinxi_id = resultSet.getString(1);
				String touxiang_picture = resultSet.getString(2);
				String name = resultSet.getString(3);
				String weichat = resultSet.getString(4);
				String sex = resultSet.getString(5);
				String qianming = resultSet.getString(6); 
				String shouhuo_address = resultSet.getString(7); 
				String shouhuo_name = resultSet.getString(8); 
				String phone = resultSet.getString(9); 
				Timestamp time = resultSet.getTimestamp(10); 
				double qianbao = resultSet.getDouble(11);
				Admin_xinxi admin_xinxi = new Admin_xinxi(admin_xinxi_id, touxiang_picture, name, weichat, sex, qianming, shouhuo_address, shouhuo_name, phone, time, qianbao);
				lists.add(admin_xinxi);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}

	public int createNewFolder(Map<String,String> paramMap) {
		String folderName = paramMap.get("folderName");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(new Date());
		String sql = "INSERT INTO file_management (file_name,create_time,parent_id,is_folder) VALUES('"+folderName+"','"+time+"',NULL,1)";
		DBHelper db = new DBHelper(sql);
		try {
			Connection connection = db.conn;
			PreparedStatement prepareStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			int update = prepareStatement.executeUpdate();
			 ResultSet rs = prepareStatement.getGeneratedKeys();
			 if(update > 0 && rs.next()){
				return rs.getInt(1);
			 }
			return -1;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<Integer> createImages(List<FileManagement> fileManagements){
		List<Integer> ids = new ArrayList<Integer>();
		StringBuilder sql = new StringBuilder("INSERT INTO file_management (file_name,create_time,parent_id,is_folder,absolute_path,item_id,type) VALUES");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = sdf.format(new Date());
		for (int i = 0; i < fileManagements.size(); i++) {
			sql.append("('"+
						fileManagements.get(i).getFileName()+
						"','"+
						time+
						"','"+
						fileManagements.get(i).getParentId()+
						"','"+
						fileManagements.get(i).getIsFolder()+
						"','"+
						fileManagements.get(i).getAbsolutePath()+
						"','"+
						fileManagements.get(i).getItemId()+
						"','"+
						fileManagements.get(i).getType()+
					"')");
			if(i < fileManagements.size() -1){
				sql.append(",");
			}
		}
		DBHelper db = new DBHelper(sql.toString());
		try {
			Connection connection = db.conn;
			PreparedStatement prepareStatement = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			int update = prepareStatement.executeUpdate();
			 ResultSet rs = prepareStatement.getGeneratedKeys();
			 if(update > 0){
				 while(rs.next()){
					 ids.add(rs.getInt(1)); 
				 }
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ids;
	}
	
	public List<FileManagement> getFolders() {
		List<FileManagement> lists = new ArrayList<FileManagement>();
		String sql = "SELECT * FROM file_management where is_folder = 1";
		DBHelper db = new DBHelper(sql);
		try {
			ResultSet resultSet = db.pst.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String fileName = resultSet.getString(2);
				String createTime = resultSet.getString(3);
				int parentId = resultSet.getInt(4);
				int isFolder = resultSet.getInt(5);
				String absolutePath = resultSet.getString(6);
				String itemId = resultSet.getString(7);
				FileManagement fileManagement = new FileManagement(id, fileName, createTime, parentId, isFolder,absolutePath,itemId);
				lists.add(fileManagement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public boolean deleteFolder(String[] ids){
		String sql = " DELETE FROM file_management where 1=1 and id in(";
		for (int i = 0; i < ids.length; i++) {
			if(i < ids.length - 1){
				sql += ids[i] + ",";
			}else{
				sql += ids[i];
			}
		}
		sql += ")";
		DBHelper db = new DBHelper(sql);
		try {
			int update = db.pst.executeUpdate();
			return update > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false ;
	}
	
	public boolean renameFolder(Integer id, String folderName) {
		String sql = " UPDATE file_management SET file_name = '"+folderName+"' WHERE id = " + id;
		DBHelper db = new DBHelper(sql);
		try {
			int update = db.pst.executeUpdate();
			return update > 0 ? true : false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false ;
	}
	
//	public static void main(String[] args) {
//		CommonBusiness business = new CommonBusiness();
//		List<FileManagement> fileManagements = new ArrayList<FileManagement>();
//		String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
//		Integer isFolder = 0;
//		Integer parentId = 31;
//		for (int i = 0; i < 50; i++) {
//			String fileName = "filename"+i;
//			String uuid = UUID.randomUUID().toString() + ".jpeg";
//			String absolutePath = "G://upload//"+uuid;
//			String itemId = "";
//			FileManagement file = new FileManagement(fileName, createTime, parentId, isFolder,absolutePath,itemId);
//			fileManagements.add(file);
//		}
//		List<Integer> list = business.createImages(fileManagements);
//		System.out.println(list);
//	}

	public List<FileManagement> getImages(Integer pid) {
		List<FileManagement> lists = new ArrayList<FileManagement>();
		String sql = "";
		if(pid == null){
			sql = "SELECT * FROM file_management where is_folder != 1";
			
		}else{
			sql = "SELECT * FROM file_management where is_folder != 1 and parent_id = " + pid;
		}
		DBHelper db = new DBHelper(sql);
		try {
			ResultSet resultSet = db.pst.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String fileName = resultSet.getString(2);
				String createTime = resultSet.getString(3);
				int parentId = resultSet.getInt(4);
				int isFolder = resultSet.getInt(5);
				String absolutePath = resultSet.getString(6);
				String itemId = resultSet.getString(7);
				FileManagement fileManagement = new FileManagement(id, fileName, createTime, parentId, isFolder,absolutePath,itemId);
				lists.add(fileManagement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public List<FileManagement> searchFiles(Map<String, String> searchMap) {
		List<FileManagement> lists = new ArrayList<FileManagement>();
		
		String sql = "SELECT * FROM file_management where 1=1";
		
		if(StringUtils.isNotBlank(searchMap.get("searchPath"))){
			String searchPath = searchMap.get("searchPath");
			if(searchPath.equals("folder")){//文件夹
				sql += " and is_folder = 1";
			}else if(searchPath.equals("images")){//文件
				sql += " and is_folder = 0";
			}
		}
		
		if(StringUtils.isNotBlank(searchMap.get("createDate"))){
			sql += " and DATE_FORMAT(create_time,'%Y-%m-%d') = '"+searchMap.get("createDate")+"'";
		}
		
		if(StringUtils.isNotBlank(searchMap.get("fileName"))){
			sql += " and file_name like '%"+searchMap.get("fileName")+"%'";
		}
		
		if(StringUtils.isNotBlank(searchMap.get("sort"))){
			sql += " order by create_time " + searchMap.get("sort");
		}
		DBHelper db = new DBHelper(sql);
		try {
			ResultSet resultSet = db.pst.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String fileName = resultSet.getString(2);
				String createTime = resultSet.getString(3);
				int parentId = resultSet.getInt(4);
				int isFolder = resultSet.getInt(5);
				String absolutePath = resultSet.getString(6);
				String itemId = resultSet.getString(7);
				FileManagement fileManagement = new FileManagement(id, fileName, createTime, parentId, isFolder,absolutePath,itemId);
				lists.add(fileManagement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}

	public List<FileManagement> getListByIds(String[] ids) {
		List<FileManagement> lists = new ArrayList<FileManagement>();
		StringBuilder sql = new StringBuilder("SELECT * FROM file_management where 1=1 ");
		if(ids != null && ids.length > 0){
			sql.append(" and id in(");
			for (int i = 0; i < ids.length; i++) {
				if(i < ids.length - 1){
					sql.append(ids[i]+",");
				}else{
					sql.append(ids[i]);
				}
			}
			sql.append(")");
		}
		DBHelper db = new DBHelper(sql.toString());
		try {
			ResultSet resultSet = db.pst.executeQuery();
			while (resultSet.next()) {
				int id = resultSet.getInt(1);
				String fileName = resultSet.getString(2);
				String createTime = resultSet.getString(3);
				int parentId = resultSet.getInt(4);
				int isFolder = resultSet.getInt(5);
				String absolutePath = resultSet.getString(6);
				String itemId = resultSet.getString(7);
				FileManagement fileManagement = new FileManagement(id, fileName, createTime, parentId, isFolder,absolutePath,itemId);
				lists.add(fileManagement);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public List<String> getAbsolutePathsByItemId(String itemId){
		List<String> lists = new ArrayList<String>();
		String sql = "";
		if(StringUtils.isNotBlank(itemId)){
			sql = "SELECT absolute_path FROM file_management where item_id = '" + itemId+"'";
		}
		DBHelper db = new DBHelper(sql);
		try {
			ResultSet resultSet = db.pst.executeQuery();
			while (resultSet.next()) {
				String absolutePath = resultSet.getString(1);
				lists.add(absolutePath);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
}
