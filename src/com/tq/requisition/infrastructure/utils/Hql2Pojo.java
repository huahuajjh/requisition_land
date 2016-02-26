package com.tq.requisition.infrastructure.utils;

import java.lang.reflect.InvocationTargetException;
import java.util.Map;

import org.springframework.beans.BeanUtils;


/**
 * hql��ԃ�Y���cpojo��ӳ�䣬��Щ��ԃ����Ҫ����ȫ���ֶΣ���Щ��ԃ��Ҫ�ϲ�ԃ
 * 	�˕r��ԃ�Y���������خ���ӳ��õČ��w��Ոʹ�ô��ӳ����Ҫ��pojo�
 * 
 * @author jjh
 * @time 2015-12-25 0:35
 */
public final class Hql2Pojo {
	public static Object toPojo(Map<String, Object> objs,Class<?> target)throws IllegalAccessException, InvocationTargetException, InstantiationException {
		if(null == objs)
		{
			return null;
		}
		//���������Ŀ��pojo��Class��������
		Object _target = target.newInstance();
		if(_target != null)
		{
			for (Map.Entry<String, Object> entry: objs.entrySet()) {
				BeanUtils.copyProperties(_target,entry.getKey(),entry.getValue().getClass());
			}
		}
		return _target;
	}
}
