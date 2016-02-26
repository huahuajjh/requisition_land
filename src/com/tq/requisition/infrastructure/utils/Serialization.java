package com.tq.requisition.infrastructure.utils;


import java.lang.reflect.Type;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.tq.requisition.domain.model.share.Gender;
import com.tq.requisition.domain.model.share.TicketState;
import com.tq.requisition.domain.model.share.UseType;


/**
 * �����ṩ���л��ͷ����л�����
 * @author JJh
 * @time 2015-06-05 12:05
 * @lastmodify 2015-06-05 12:05
 * @version 1.0
 */
public final class Serialization {
	private static GsonBuilder builder = new GsonBuilder();
	private static Gson gson;
	
	static {
		builder.registerTypeAdapter(UseType.class, new UseTypeSerializer());
		builder.registerTypeAdapter(TicketState.class, new TicketStateSerializer());
		builder.registerTypeAdapter(Gender.class, new GenderSerializer());
		builder.setDateFormat("yyyy/MM/dd");
		gson = builder.create();
	}
	
	/**
	 * ��javabean���л���json�ַ���
	 * @param obj - �����л���java���󣬸ö������javabean�淶
	 * @return String - json�ַ��� 
	 */
	public static String toJson(Object obj) {
		return gson.toJson(obj);
	}
	
	/**
	 * ��json�ַ������л���java����
	 * @param jsonString - json�ַ���
	 * @return T - ���Ͳ���,���л�֮���Ŀ�����Ͳ���
	 */
	public static <T> T toObject(String jsonString,Class<T> clazz) {
		return gson.fromJson(jsonString, clazz);		
	}
	
	/**
	 * ��json���������ַ���ת��Ϊjava���϶���
	 * @param jsonString - json�����ַ���
	 * @param clazz - java���϶����Class
	 * @return T - �������Ͳ��� 
	 */
	public static <T> List<T> toList(String jsonString,T clazz) {
		Type type = new TypeToken<List<T>>(){}.getType();
		return gson.fromJson(jsonString, type);
	}
	
}
