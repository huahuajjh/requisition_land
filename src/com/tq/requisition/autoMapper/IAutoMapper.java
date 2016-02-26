package com.tq.requisition.autoMapper;

/**
 * dto��ʵ��ת���ӿ�
 * @author jjh
 * @time 2015-12-23 18:11
 */
public interface IAutoMapper<Model,Dto> {
	Model toModel(Dto dto);
	Dto toDto(Model model);
}
