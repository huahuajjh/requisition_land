package com.tq.requisition.infrastructure.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.tq.requisition.infrastructure.log.LoggerFactory;

/**
 * ��ȡproperties�����ļ�
 * @author jjh
 * @time 2015-01-09 21:54
 *
 */
public final class ConfigFileUtil {
	private static Properties p;
	
	static{		
		p = new Properties();
		InputStream is = null;
		try {
			is = ConfigFileUtil.class.getResourceAsStream("/admin.properties");
			p.load(is);
		} catch (IOException e) {
			LoggerFactory.logger().error(ConfigFileUtil.class.getName(), "readByKey(String key)", e.getMessage());
		}
		finally{
			try {
				is.close();
			} catch (IOException e) {
				LoggerFactory.logger().error(ConfigFileUtil.class.getName(), "readByKey(String key)", e.getMessage());
			}
		}
	}
	
	/**
	 * ��ȡָ��key��valueֵ
	 * @param key
	 * 		ָ����keyֵ
	 * @return String
	 * 		valueֵ
	 */
	public static String readByKey(String key) {
		return p.getProperty(key);
	}
	
	/**
	 * �����ֵ��
	 * @param key 		
	 * @param value
	 */
	public static void setValue(String key,String value) {
	}
	
}
