package com.tq.requisition.application;

import com.tq.requisition.domain.IRepository.IRepositoryContext;
import com.tq.requisition.infrastructure.utils.Formater;
import com.tq.requisition.infrastructure.utils.PageFormater;
import com.tq.requisition.infrastructure.utils.Serialization;

/**
 * Ӧ�ò㸸�࣬�ṩ�ִ�������
 * @author jjh
 * @version 1.0
 * @time 2015-12-24 17:32
 *
 */
public abstract class BaseApplication {
	private IRepositoryContext context;

	public BaseApplication(IRepositoryContext context) {
		super();
		this.context = context;
	}
	
	/**
	 * ��ȡͳһ������
	 * @return IRepositoryContext
	 * 		�ִ�������
	 */
	protected IRepositoryContext context(){
		return context;
	}

	/**
	 * ��ʽ��
	 * @param msg
	 * 		��Ϣ
	 * @param data
	 * 		����
	 * @param type
	 * 		�����������
	 * @return
	 */
	private Formater formater(String msg,Object data,Formater.OperationResult type) {
		return Formater.obtain(msg,data,type);
	}
	
	protected String toJson(String msg,Object data,Formater.OperationResult type) {
		return toJson(formater(msg, data, type));
	}
	
	/**
	 * ���л�������װ
	 * @param obj
	 * 		�����л��Ķ���
	 * @return
	 * 		���л����json����
	 */
	protected String toJson(Object obj) {
		if(obj == null)
		{
			throw new NullPointerException("�����л��Ķ���Ϊnull");
		}
		return Serialization.toJson(obj);
	}
		
	/**
	 * ���ط�ҳģ��json����
	 * @param data
	 * 		װ�������
	 * @param totalCount
	 * 		������
	 * @param msg
	 * 		��Ϣ
	 * @param type
	 * 		�����������
	 * @return String
	 * 		json{PageFormater}
	 */
	protected String toJsonByPage(Object data,int totalCount,String msg,Formater.OperationResult type)
	{
		PageFormater pageData = PageFormater.obtain(data, totalCount);
		return toJson(msg, pageData, type);
	}

	protected String toJsonByPage(PageFormater page,String msg,Formater.OperationResult type) {
		return toJson(msg,page,type);
	}
}
