package com.tq.requisition.autoMapper;

import java.util.ArrayList;
import java.util.List;

import com.tq.requisition.domain.model.project.Announcement;
import com.tq.requisition.presentation.dto.project.AnnouncementDto;

/**
 * ��Ŀ����dto������ģ�͵�ת��
 * @author jjh
 * @time 2015-12-28 1:47
 */
public class AnnouncementMapper {
	public static Announcement toModel(AnnouncementDto dto) {
		if(dto.getDocPath().trim().equals("")){dto.setDocPath(null);}
		return Announcement.obtain(dto.getNumber(), dto.getDocPath(), dto.getDate(), dto.getSequence(), dto.getProId());
	}
	
	public static AnnouncementDto toDto(Announcement model) {
		String name = ""; 
		switch (model.getSequence()) {
		case 1:
			name="һ����";
			break;
		case 2:
			name="������";
			break;
		case 3:
			name="������";
			break;

		default:
			break;
		}
		return AnnouncementDto.obtain(model.getId(),model.getNumber(),model.getDocPath(),model.getDate(),name,model.getProId(),model.getSequence());
	}
	
	public static List<Announcement> toModelList(List<AnnouncementDto> dtos) {
		List<Announcement> models = new ArrayList<Announcement>();
		for (AnnouncementDto announcementDto : dtos) {
			models.add(toModel(announcementDto));
		}
		return models;
	}
	
	public static List<AnnouncementDto> toDtoList(List<Announcement> models) {
		List<AnnouncementDto> dtos = new ArrayList<>();
		for (Announcement announcement : models) {
			dtos.add(toDto(announcement));
		}
		return dtos;
	}
}