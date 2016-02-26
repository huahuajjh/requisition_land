package com.tq.requisition.infrastructure.Specifications.hpt;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.model.housePuraseTicket.HousePuraseTicket;
import com.tq.requisition.presentation.dto.hpt.HPTFuzzyQueryModel;

/**
 * ��ѯ��Լ�����ݲ�ѯmodel���ط�ҳ��������
 * @author jjh
 * @time 2015-01-02 23:07
 */
public class HPTProvideFuzzySpecification extends Specification<HousePuraseTicket>{
	private HPTFuzzyQueryModel queryModel;
		
	public HPTProvideFuzzySpecification(Class<HousePuraseTicket> _t,HPTFuzzyQueryModel queryModel) {
		super(_t);
		this.queryModel = queryModel;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		// TODO Auto-generated method stub
		return super.getHqlExpression();
	}	

}
