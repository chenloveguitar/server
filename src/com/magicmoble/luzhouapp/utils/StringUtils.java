package com.magicmoble.luzhouapp.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;

public class StringUtils {
	
	//正整数正则表达式常量
	public static final String POSITIVE_INTEGER_REG_EXP = "^\\+?[1-9][0-9]*$";//匹配正整数
	/**
	 * 用于判断字符串不为null引用并且不为空字符串
	 * @param string
	 * @return
	 */
	public static boolean hasLength(String string) {
		return ((string != null) && (!(string.trim().equals(""))));
	}
	
    /**
     * 判断字符串不为null引用,空字符串,字符串null
     * @param string
     * @return
     */
	public static boolean isNotEmpty(String string) {
		return ((hasLength(string)) && (isNotNull(string)));
	}

	/**
	 * 判断字符串不为null并且不为字符串的null
	 * @param string
	 * @return
	 */
	public static boolean isNotNull(String string) {
		return ((string != null) && (!(string.trim().equals("null"))));
	}
	
	/**
	 * 用于判断obj对象不为null引用,并且obj的toString值不为null引用,空字符串,字符串null
	 * @param obj
	 * @return
	 */
	public static boolean isNotEmpty(Object obj){
		return obj != null && isNotEmpty(obj.toString());
	}
	
	/**
	 * 判断字符串不为null引用,是一个数字,并且为正整数
	 * @param obj
	 * @return
	 */
	public static boolean isPositiveInteger(String string){
		if(hasLength(string)){
			Pattern pattern = Pattern.compile(POSITIVE_INTEGER_REG_EXP);
			Matcher matcher = pattern.matcher(string);
			return matcher.matches();
		}
		return false;
	}
	/**
	 * 判断obj不为null引用,是一个数字,并且为正整数
	 * @param obj
	 * @return
	 */
	public static boolean isPositiveInteger(Object obj){
		if(obj != null){
			return isPositiveInteger(obj.toString());
		}
		return false;
	}
	
	/**
	 * 判断字符串是否为数字大小写字母组成以,分隔并且长度为32位
	 * @param string
	 * @return
	 */
	public static boolean isCommaSeparated(String string){
		Pattern pattern = Pattern.compile("^([0-9a-zA-Z]{32},)*|([0-9a-zA-Z]{32})|(([0-9a-zA-Z]{32},)*([0-9a-zA-Z]{32}))$");
		Matcher matcher = pattern.matcher(string);
		return matcher.matches();
	}

	/**
	 * 将传入的字符串首字母改为大写
	 * 例如:传入userName 得到 UserName
	 * @param word
	 * @return
	 */
	public static String titleCase(String word){
		char[] charArray = word.toCharArray();
		charArray[0] -= 32;
		return String.valueOf(charArray);
	}
	
	public static void main(String[] args) {
//		String str = new String("[{\"name\":\"张三\",'cardType':'身份证','cardId':'510107000000000000'},{'name':'李四','cardType':'身份证','cardId':'510107000000000000'}]");
//		Integer jsonObjectCount = jsonObjectCount(str);
//		System.out.println(jsonObjectCount);
		
		String str = "4028aabf2a456347012a4566afb60001";
		
		boolean commaSeparated = isCommaSeparated(str);
		
		System.out.println(commaSeparated);
	}
}
