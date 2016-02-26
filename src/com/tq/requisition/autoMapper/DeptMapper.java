package com.tq.requisition.autoMapper;

import java.util.ArrayList;
import java.util.List;

import com.tq.requisition.domain.model.department.Department;
import com.tq.requisition.presentation.dto.sysMgt.DeptDto;

/**
 * Department�ۺϸ���DeotDtoת����,���಻�ܱ��̳�
 * @author jjh
 * @time 2015-12-24 17:11
 */
public class DeptMapper {
	public static Department toModel(DeptDto dto)
	{
		Department dept = new Department();
		dept.setDel(false);
		dept.setDeptName(dto.getName());
		dept.setId(dto.getId());
		dept.setOrgId(dto.getOrgId());
		return dept;
	}
	
	public static DeptDto toDto(Department model)
	{
		return new DeptDto(model.getDeptName(), model.getId(), model.getOrgId());
	}
	
	public static List<Department> toModelList(List<DeptDto> dtoList) {
		if(dtoList == null)
		{
			throw new NullPointerException("��ת����dto����Ϊnull");
		}
		List<Department> deptList = new ArrayList<Department>();
		for (DeptDto deptDto : dtoList) {
			deptList.add(toModel(deptDto));
		}
		return deptList;
	}
	
	public static List<DeptDto> toDtolList(List<Department> deptList) {
		if(deptList == null)
		{
			throw new NullPointerException("��ת����dept����Ϊnull");
		}
		List<DeptDto> dtoList = new ArrayList<DeptDto>();
		for (Department department : deptList) {
			dtoList.add(toDto(department));
		}
		return dtoList;
	}
	
}
