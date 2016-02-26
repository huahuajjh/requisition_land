package com.tq.requisition.test.application;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.junit.Before;
import org.junit.Test;

import com.tq.requisition.infrastructure.serviceLocator.ServiceLocator;
import com.tq.requisition.infrastructure.utils.Serialization;
import com.tq.requisition.presentation.dto.project.AnnouncementDto;
import com.tq.requisition.presentation.dto.project.ProImportAndExportDto;
import com.tq.requisition.presentation.dto.project.ProTypeDto;
import com.tq.requisition.presentation.serviceContract.proMgt.IProMgtServiceContract;

public class TestProMgtService {
	private IProMgtServiceContract service;
	
	@Before
	public void init() {
		service = ServiceLocator.instance().getService("proMgtServiceContract", IProMgtServiceContract.class);
	}
	
	@Test
	public void getAnnounce() {
		String json = service.getAnnounce(UUID.fromString("dfd35541-0261-4f9e-b48f-6e09caeefc91"));
		System.out.println(json);
	}
	
	@Test
	public void getType() {
		List<ProTypeDto> list = service.getProType();
		for (ProTypeDto proTypeDto : list) {
			System.out.println(proTypeDto);
		}
	}

	@Test
	public void queryByFuzzy() {
//		ProQueryModel q = new ProQueryModel("", ProjectType.KEY.toValue(), -1, UUID.fromString("6909e67a-0398-46c2-ad6b-10978f92a482"),null);
//		PageModel p = new PageModel();
//		p.pageIndex = 1;
//		p.pageSize = 10;
//		String json = service.getProListFuzzy(q, p);
//		System.out.println(json);
	}

	@Test
	public void addAnnounce() {
		service.addAnnouncement(AnnouncementDto.obtain(null, "number", "f:/", new Date(), "name", UUID.fromString("c39e7503-0287-44cb-9d96-879f651cc6ff"), 1));
	}
	
	@Test
	public void getFuzzyNames() {
		String json = service.getProNameListFuzzy(null);
		System.out.println(json);
	}
	
	@Test
	public void getProById() {
		String json = service.getProById(UUID.fromString("15848f75-3141-45eb-aa2b-7fa1f1efd472"));
		System.out.println(json);
	}

	@Test
	public void export() throws ParseException {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");		
		List<ProImportAndExportDto> dtos = service.exportProByDate(df.parse("2016-01-01"));
		System.out.println(Serialization.toJson(dtos));
	}

}
