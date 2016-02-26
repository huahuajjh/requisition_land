package com.tq.requisition.infrastructure.Specifications.project;

import java.util.Date;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.project.ProjectItem;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;

/**
 * 按照月份查询项目月度信息
 * @author jjh
 * @time 2016-01-15 22:02
 *
 */
public class ProByMonthSpecification extends Specification<ProjectItem>{
	private Date date;
	
	public ProByMonthSpecification(Class<ProjectItem> _t,Date date) {
		super(_t);
		this.date = date;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		expression.setHql("from ProjectItem where date=?");
		expression.setParameters(date);
		expression.setType(OperationType.HQL);
		return expression;
	}

}
