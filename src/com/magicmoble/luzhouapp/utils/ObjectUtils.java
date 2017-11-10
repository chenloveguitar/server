package com.magicmoble.luzhouapp.utils;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import com.magicmoble.luzhouapp.entity.Shuoshuo;

public class ObjectUtils {

	/**
	 * 对象转map
	 * 
	 * @param obj
	 * @return
	 */
	public static <T extends Serializable> Map<String, String> entityToMap(T t) {
		if (t == null) {
			throw new NullPointerException("obj is null");
		}
		Class<? extends Serializable> clz = t.getClass();
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(clz,
					clz.getSuperclass());
			PropertyDescriptor[] propertyDescriptors = beanInfo
					.getPropertyDescriptors();
			Map<String, String> entityMap = new HashMap<String, String>();
			for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
				String name = propertyDescriptor.getName();
				Method readMethod = propertyDescriptor.getReadMethod();
				String value = "";
				Object result = readMethod.invoke(t, null);
				if( result != null){
					value = result.toString();
					entityMap.put(name, value);
				};
			}
			return entityMap;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * map转对象
	 * 
	 * 加泛型只是为了做类型校验,
	 * 在返回值类型为Object的时候可以强制转换为任何对象,
	 * 但是当前方法返回的应该是参数中声明的类型,
	 * 所以为了避免出错加入泛型做编译时期的验证
	 * 
	 * @param entityClass 任意实体类class类型
	 * @param map 任意map集合
	 * @return 传入的entityClass参数的对象
	 */
	public static <T> T mapToEntity(Class<T> entityClass,
			Map<String, Object> map) {
		if (entityClass == null) {
			throw new NullPointerException("entityClass is null");
		}
		if (map == null) {
			throw new NullPointerException("map is null");
		}
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(entityClass);
			try {
				T t = entityClass.newInstance();
				PropertyDescriptor[] propertyDescriptors = beanInfo
						.getPropertyDescriptors();
				for (int i = 0; i < propertyDescriptors.length; i++) {
					PropertyDescriptor descriptor = propertyDescriptors[i];
					String propertyName = descriptor.getName();
					if (map.containsKey(propertyName)) {
						Object value = map.get(propertyName);
						if (StringUtils.isNotEmpty(value)) {
							try {
								Object[] args = new Object[1];
								Method method = descriptor.getWriteMethod();
								Class<?> type = method.getParameterTypes()[0];
								if (type.getName().equals(
										String.class.getName())) {
									args[0] = String.valueOf(value);
									method.invoke(t, args);
								} else if (type.getName().equals(
										Integer.class.getName())) {
									args[0] = Integer.valueOf(value.toString());
									method.invoke(t, args);
								} else if (type.getName().equals(
										Long.class.getName())) {
									args[0] = Long.valueOf(value.toString());
									method.invoke(t, args);
								} else if (type.getName().equals(
										Double.class.getName())) {
									args[0] = Double.valueOf(value.toString());
									method.invoke(t, args);
								} else if (type.getName().equals(
										Float.class.getName())) {
									args[0] = Float.valueOf(value.toString());
									method.invoke(t, args);
								}
							} catch (IllegalArgumentException e) {
								e.printStackTrace();
							} catch (InvocationTargetException e) {
								e.printStackTrace();
							}
						} else {
							Object[] args = new Object[1];
							Method method = descriptor.getWriteMethod();
							Class<?> type = method.getParameterTypes()[0];
							if (type.getName().equals(String.class.getName())) {
								args[0] = "";
								try {
									method.invoke(t, args);
								} catch (IllegalArgumentException e) {
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									e.printStackTrace();
								}
							}
						}
					}
				}
				return t;
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static <T> T getAutomaticSettingBean(Class<T> entityClass) {

		if (entityClass == null) {
			throw new NullPointerException("entityClass is null");
		}
		try {
			BeanInfo beanInfo = Introspector.getBeanInfo(entityClass,
					entityClass.getSuperclass());
			try {
				T t = entityClass.newInstance();
				PropertyDescriptor[] propertyDescriptors = beanInfo
						.getPropertyDescriptors();
				for (int i = 0; i < propertyDescriptors.length; i++) {
					PropertyDescriptor descriptor = propertyDescriptors[i];
					try {
						Object[] args = new Object[1];
						Method method = descriptor.getWriteMethod();
						Class<?> type = method.getParameterTypes()[0];
						if (type.getName().equals(String.class.getName())) {
							args[0] = String.valueOf("str");
							method.invoke(t, args);
						} else if (type.getName().equals(
								Integer.class.getName())) {
							args[0] = Integer.valueOf("1");
							method.invoke(t, args);
						} else if (type.getName().equals(Long.class.getName())) {
							args[0] = Long.valueOf("12");
							method.invoke(t, args);
						} else if (type.getName()
								.equals(Double.class.getName())) {
							args[0] = Double.valueOf("1.1");
							method.invoke(t, args);
						} else if (type.getName().equals(Float.class.getName())) {
							args[0] = Float.valueOf("1.11");
							method.invoke(t, args);
						}
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (InvocationTargetException e) {
						e.printStackTrace();
					}
				}
				return t;
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		} catch (IntrospectionException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void main(String[] args) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tuijian_Tag", "123");
		map.put("dianzan_count", "21");
		map.put("yuedu", "1");
		map.put("content", "12321321323");
		Shuoshuo mapToEntity = mapToEntity(Shuoshuo.class, map);
		Object object = new  Object();
		Map<String, String> entityToMap = entityToMap(mapToEntity);
		System.out.println(entityToMap);
	}
}
