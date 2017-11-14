package com.magicmoble.luzhouapp.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.mysql.jdbc.Driver;

/**
 * 将指定数据库表生成对应实体类
 * 
 * @author CHD
 * @version 1.0.0
 *
 */
public class TableToEntityUtils {
	public static final String URL = "jdbc:mysql://localhost:3306/sjlz?characterEncoding=utf-8";
	public static final String USER = "root";
	public static final String PASSWORD = "admin123456";

	private static final Pattern linePattern = Pattern.compile("_(\\w)");
	public static final String TABLE_NAME = "renzheng";
	public static final String PACKAGE_PATH = "com.magicmoble.luzhouapp.model.server";
	public static final String COLUMN_NAME = "COLUMN_NAME";
	public static final String TYPE_NAME = "TYPE_NAME";
	// 加载数据库类型转换为对应java类型的配置文件
	private static final Properties p = new Properties();
	static {
		InputStream inputStream = TableToEntityUtils.class.getResourceAsStream("jdbc-java-type.properties");
		try {
			p.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		TableToEntityUtils entity = new TableToEntityUtils();
		Connection connection = entity.getConnection();
		Map<String, String> data  = new HashMap<String, String>();
		try {
			DatabaseMetaData dbmd = connection.getMetaData();
			ResultSet columns = dbmd.getColumns(null, null, TABLE_NAME, null);
			while (columns.next()) {
				String columnName = columns.getString(COLUMN_NAME);
				String typeName = columns.getString(TYPE_NAME);
				data.put(columnName, typeName);
			}
			
			String path = "C:\\Users\\jumili\\Desktop";
			String fileName = entity.initialCapitalize(TABLE_NAME);
			File file = entity.createJavaFile(fileName, path);
			entity.generateFileContent(file, data);
			// ResultSet tables = dbmd.getTables(null, null, "tuijian_list" ,
			// new String[]{"TABLE"});
			// while(tables.next()){
			// ResultSetMetaData metaData = tables.getMetaData();
			// int count = metaData.getColumnCount();
			// for (int i = 1; i < count; i++) {
			// System.out.print(metaData.getColumnLabel(i) +"\t");
			// System.out.println(tables.getObject(i) +"\t");
			// }
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 生成文件内容
	public void generateFileContent(File file,Map<String, String> data) {
		try {
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file)));
			StringBuilder sb = new StringBuilder();
			try {
				sb.append("package " + PACKAGE_PATH + ";\n");
				sb.append("import java.io.Serializable;\n\n");
				sb.append("public class " + initialCapitalize(TABLE_NAME) + " implements Serializable{\n\n");
				sb.append("\tprivate static final long serialVersionUID = 1L;\n\n");
				Set<String> keys = data.keySet();
				Iterator<String> iterator = keys.iterator();
				while (iterator.hasNext()) {
					String key =  iterator.next();
					sb.append("\tprivate " + p.getProperty(data.get(key)) + " " + key + ";\n\n");
				}
				iterator = keys.iterator();
				while (iterator.hasNext()) {
					String key =  iterator.next();
					sb.append("\tpublic void set"+initialCapitalize(key) + "("+p.getProperty(data.get(key)) + " " + key +"){\n");
					sb.append("\t\tthis."+key + " = " + key +";\n");
					sb.append("\t}\n\n");
					sb.append("\tpublic "+p.getProperty(data.get(key))+" get"+initialCapitalize(key) + "(){\n");
					sb.append("\t\treturn this."+ key + ";\n");
					sb.append("\t}\n\n");
				}
				
				sb.append("}\n");
				
				bw.write(sb.toString());
				bw.flush();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public String camelCase(String string){
		string = string.toLowerCase();  
        Matcher matcher = linePattern.matcher(string);  
        StringBuffer sb = new StringBuffer();  
        while(matcher.find()){  
            matcher.appendReplacement(sb, matcher.group(1).toUpperCase());  
        }  
        matcher.appendTail(sb);  
        return sb.toString();  
	}
	
	public String initialCapitalize(String string) {
		char[] chars = string.toCharArray();
		chars[0] -= 32;
		return String.valueOf(chars);
	}

	// 创建java文件
	public File createJavaFile(String fileName, String path) {
		File parent = new File(path);
		if (!parent.exists()) {
			parent.mkdirs();
		}
		File javaFile = new File(parent, fileName + ".java");
		if (!javaFile.exists()) {
			try {
				javaFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return javaFile;
	}

	// 获取数据库连接对象
	public Connection getConnection() {
		Connection connection = null;
		try {
			DriverManager.registerDriver(new Driver());// 注册驱动
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
