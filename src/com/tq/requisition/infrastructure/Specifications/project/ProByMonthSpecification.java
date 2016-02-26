package com.tq.requisition.infrastructure.Specifications.project;

import com.tq.requisition.domain.Specification.Specification;
import com.tq.requisition.domain.Specification.expression.IHqlExpression;
import com.tq.requisition.domain.Specification.expression.OperationType;
import com.tq.requisition.domain.model.project.ProjectItem;
import com.tq.requisition.infrastructure.Specifications.Expression.HqlExpression;
import com.tq.requisition.presentation.dto.project.ProExportCondition;

/**
 * 按照月份查询项目月度信息
 * @author jjh
 * @time 2016-01-15 22:02
 *
 */
public class ProByMonthSpecification extends Specification<ProjectItem>{
	private ProExportCondition condition;
	
	public ProByMonthSpecification(Class<ProjectItem> _t,ProExportCondition condition) {
		super(_t);
		this.condition = condition;
	}

	@Override
	public IHqlExpression getHqlExpression() {
		IHqlExpression expression = new HqlExpression();
		expression.setHql("from ProjectItem where date between ? and ?");
		expression.setParameters(condition.getStartDate(),condition.getEndDate());
		expression.setType(OperationType.HQL);
		return expression;
	}

}
