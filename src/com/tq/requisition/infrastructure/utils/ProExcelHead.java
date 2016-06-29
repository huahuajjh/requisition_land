package com.tq.requisition.infrastructure.utils;

import java.util.ArrayList;
import java.util.List;

import com.excel.util.model.ColAttrVal;
import com.excel.util.model.ExcelColData;

public class ProExcelHead {

	public static List<ColAttrVal> getkeys(int... ids){
		List<Head> heads = getHeads(ids);
		List<ColAttrVal> keys = new ArrayList<>();
		for (Head head : heads) {
			for (String key : head.getCelKey()) {
				ColAttrVal col = new ColAttrVal();
				col.setAttrName(key);
				col.setColIndex(keys.size());
				keys.add(col);
			}
		}
		return keys;
	}
	
	public static List<ExcelColData> getExcelColDatas(int... ids) {
		List<Head> heads = getHeads(ids);
		List<ExcelColData> colDatas = new ArrayList<>();
		for (Head head : heads) {
			for (ExcelColData colData : head.getCelData()) {
				colDatas.add(colData);
			}
		}
		return colDatas;
	}

	public static List<Head> getHeads(int... ids) {
		List<Head> list = new ArrayList<Head>();
		ProExcelHead proExcelHead = new ProExcelHead();
		int x = 2;
		int y = 0;
		for (int i : ids) {
			Head head = null;
			switch (i) {
			case 0:
				head = proExcelHead.getXuHaoHead(x,y);
				break;
			case 1:
				head = proExcelHead.getXiangMuMingChengHead(x,y);
				break;
			case 2:
				head = proExcelHead.getXiangMuTianDate(x,y);
				break;
			case 3:
				head = proExcelHead.getShenPiDanHaoHead(x,y);
				break;
			case 4:
				head = proExcelHead.getMoneyUnitHead(x,y);
				break;
			case 5:
				head = proExcelHead.getOtherMoneyUnitHead(x,y);
				break;
			case 6:
				head = proExcelHead.getXiangMuFenLeiHead(x,y);
				break;
			case 7:
				head = proExcelHead.getXiangMuLeiXingHead(x,y);
				break;
			case 8:
				head = proExcelHead.getShiFouBenYueQiDongHead(x,y);
				break;
			case 9:
				head = proExcelHead.getShiFouBenYueWanChengJieSuanHead(x,y);
				break;
			case 10:
				head = proExcelHead.getYongDiWeiZhiHead(x,y);
				break;
			case 11:
				head = proExcelHead.getYiGongGaoHead(x,y);
				break;
			case 12:
				head = proExcelHead.getYiGongGaoNumberHead(x,y);
				break;
			case 13:
				head = proExcelHead.getErGongGaoHead(x,y);
				break;
			case 14:
				head = proExcelHead.getErGongGaoNumberHead(x,y);
				break;
			case 15:
				head = proExcelHead.getSanGongGaoHead(x,y);
				break;
			case 16:
				head = proExcelHead.getSanGongGaoNumberHead(x,y);
				break;
			case 17:
				head = proExcelHead.getTengDiQingKuangHead(x,y);
				break;
			case 18:
				head = proExcelHead.getChaiChuFngWuQingKuangHead(x,y);
				break;
			case 19:
				head = proExcelHead.getAnZhiQingKuangHead(x,y);
				break;
			case 20:
				head = proExcelHead.getXiaDaTengDiShuHead(x,y);
				break;
			case 21:
				head = proExcelHead.getShenQingFaYuanZhiXingHead(x,y);
				break;
			case 22:
				head = proExcelHead.getYiFaQiangZhiTengDiHead(x,y);
				break;
			case 23:
				head = proExcelHead.getLiuQianXingMuHead(x,y);
				break;
			case 24:
				head = proExcelHead.getBeiZhuHead(x,y);
				break;
			}
			if(head != null){
				y = head.y;
				list.add(head);
			}
		}
		return list;
	}

	private Head getXuHaoHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("���");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "num" });
	}

	private Head getXiangMuMingChengHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�ڲ���Ŀ����");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "proName" });
	}

	private Head getXiangMuTianDate(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�ʱ��");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "date" });
	}

	private Head getShenPiDanHaoHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("��������");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "approvalNumber" });
	}

	private Head getMoneyUnitHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�����ֳ���(��λ����)");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "moneyUnit" });
	}

	private Head getOtherMoneyUnitHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("������λ����(��λ����)");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "otherMoneyUnit" });
	}

	private Head getXiangMuFenLeiHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("��Ŀ����");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "categoryStr" });
	}

	private Head getXiangMuLeiXingHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("��Ŀ���ͣ��á̱�ʶ��");
		celData.setColspan(1);
		celData.setRowspan(1);
		celData.setX(x);
		celData.setY(y);
		ExcelColData jiChuSheShiData = new ExcelColData();
		jiChuSheShiData.setValue("������ʩ");
		jiChuSheShiData.setColspan(0);
		jiChuSheShiData.setRowspan(1);
		jiChuSheShiData.setX(x + 2);
		jiChuSheShiData.setY(y);
		ExcelColData qiTaData = new ExcelColData();
		qiTaData.setValue("����");
		qiTaData.setColspan(0);
		qiTaData.setRowspan(1);
		qiTaData.setX(x + 2);
		qiTaData.setY(y + 1);
		return new Head(y + 2, new ExcelColData[] { celData, jiChuSheShiData,
				qiTaData },
				new String[] { "proTypeStrInfra", "proTypeStrOther" });
	}

	private Head getShiFouBenYueQiDongHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("������������Ŀ���á̱�ʶ��");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "newStart" });
	}

	private Head getShiFouBenYueWanChengJieSuanHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�Ƿ�Ϊ������ɽ�����Ŀ���á̱�ʶ��");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "curMonthComplete" });
	}

	private Head getYongDiWeiZhiHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�õ�λ��");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "totalAddress" });
	}

	private Head getYiGongGaoHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("һ����");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "announce1" });
	}

	private Head getYiGongGaoNumberHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("һ�����ĺ�");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "announce1Number" });
	}

	private Head getErGongGaoHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("������");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "announce2" });
	}

	private Head getErGongGaoNumberHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�������ĺ�");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "announce2Number" });
	}

	private Head getSanGongGaoHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("������");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "announce3" });
	}

	private Head getSanGongGaoNumberHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�������ĺ�");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "announce3Number" });
	}

	private Head getTengDiQingKuangHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�ڵ����");
		celData.setColspan(3);
		celData.setRowspan(0);
		celData.setX(x);
		celData.setY(y);
		ExcelColData zhengDiMianJiData = new ExcelColData();
		zhengDiMianJiData.setValue("�������");
		zhengDiMianJiData.setColspan(0);
		zhengDiMianJiData.setRowspan(2);
		zhengDiMianJiData.setX(x + 1);
		zhengDiMianJiData.setY(y);
		ExcelColData yiTengDiData = new ExcelColData();
		yiTengDiData.setValue("���ڵ�");
		yiTengDiData.setColspan(2);
		yiTengDiData.setRowspan(1);
		yiTengDiData.setX(x + 1);
		yiTengDiData.setY(y + 1);
		ExcelColData leiJiData = new ExcelColData();
		leiJiData.setValue("�ۼ�");
		leiJiData.setColspan(0);
		leiJiData.setRowspan(0);
		leiJiData.setX(x + 3);
		leiJiData.setY(y + 1);
		ExcelColData benYueData = new ExcelColData();
		benYueData.setValue("����");
		benYueData.setColspan(0);
		benYueData.setRowspan(0);
		benYueData.setX(x + 3);
		benYueData.setY(y + 2);
		ExcelColData benNianData = new ExcelColData();
		benNianData.setValue("����");
		benNianData.setColspan(0);
		benNianData.setRowspan(0);
		benNianData.setX(x + 3);
		benNianData.setY(y + 3);
		return new Head(y + 4, new ExcelColData[] { celData, zhengDiMianJiData,
				yiTengDiData, leiJiData, benYueData, benNianData },
				new String[] { "requisitionArea", "requisitionLandAreaTotal",
						"removedLandArea", "requisitionLandAreaYear" });
	}

	private Head getChaiChuFngWuQingKuangHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("����������");
		celData.setColspan(7);
		celData.setRowspan(0);
		celData.setX(x);
		celData.setY(y);
		ExcelColData celData1 = new ExcelColData();
		celData1.setValue("Ӧ�������Ϸ���");
		celData1.setColspan(0);
		celData1.setRowspan(1);
		celData1.setX(x + 1);
		celData1.setY(y);
		ExcelColData celData2 = new ExcelColData();
		celData2.setValue("�ۼ�");
		celData2.setColspan(0);
		celData2.setRowspan(0);
		celData2.setX(x + 3);
		celData2.setY(y);
		ExcelColData celData3 = new ExcelColData();
		celData3.setValue("�Ѳ���  ���Ϸ���");
		celData3.setColspan(2);
		celData3.setRowspan(1);
		celData3.setX(x + 1);
		celData3.setY(y + 1);
		ExcelColData celData4 = new ExcelColData();
		celData4.setValue("�ۼ�");
		celData4.setColspan(0);
		celData4.setRowspan(0);
		celData4.setX(x + 3);
		celData4.setY(y + 1);
		ExcelColData celData5 = new ExcelColData();
		celData5.setValue("����");
		celData5.setColspan(0);
		celData5.setRowspan(0);
		celData5.setX(x + 3);
		celData5.setY(y + 2);
		ExcelColData celData6 = new ExcelColData();
		celData6.setValue("����");
		celData6.setColspan(0);
		celData6.setRowspan(0);
		celData6.setX(x + 3);
		celData6.setY(y + 3);
		ExcelColData celData7 = new ExcelColData();
		celData7.setValue("Ӧ����������Ϸ���");
		celData7.setColspan(0);
		celData7.setRowspan(1);
		celData7.setX(x + 1);
		celData7.setY(y + 4);
		ExcelColData celData8 = new ExcelColData();
		celData8.setValue("�ۼ�");
		celData8.setColspan(0);
		celData8.setRowspan(0);
		celData8.setX(x + 3);
		celData8.setY(y + 4);
		ExcelColData celData9 = new ExcelColData();
		celData9.setValue("�Ѳ�������Ϸ���");
		celData9.setColspan(2);
		celData9.setRowspan(1);
		celData9.setX(x + 1);
		celData9.setY(y + 5);
		ExcelColData celData10 = new ExcelColData();
		celData10.setValue("�ۼ�");
		celData10.setColspan(0);
		celData10.setRowspan(0);
		celData10.setX(x + 3);
		celData10.setY(y + 5);
		ExcelColData celData11 = new ExcelColData();
		celData11.setValue("����");
		celData11.setColspan(0);
		celData11.setRowspan(0);
		celData11.setX(x + 3);
		celData11.setY(y + 6);
		ExcelColData celData12 = new ExcelColData();
		celData12.setValue("����");
		celData12.setColspan(0);
		celData12.setRowspan(0);
		celData12.setX(x + 3);
		celData12.setY(y + 7);
		return new Head(y + 8, new ExcelColData[] { celData, celData1,
				celData2, celData3, celData4, celData5, celData6, celData7,
				celData8, celData9, celData10, celData11, celData12 },
				new String[] { "shouldRemoveBuildings",
						"removedBuildingsLegalTotal", "removedBuildings",
						"removedBuildingsLegalYear", "shouldRemoveLegalArea",
						"removedAreaLegalTotal", "removedLegalArea",
						"removedAreaLegalYear" });
	}

	private Head getAnZhiQingKuangHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("��Ǩ�����˿����");
		celData.setColspan(3);
		celData.setRowspan(0);
		celData.setX(x);
		celData.setY(y);
		ExcelColData celData1 = new ExcelColData();
		celData1.setValue("Ӧ��Ǩ�˿ڣ�������ũ����߻���������Ů��");
		celData1.setColspan(0);
		celData1.setRowspan(2);
		celData1.setX(x + 1);
		celData1.setY(y);
		ExcelColData celData2 = new ExcelColData();
		celData2.setValue("�Ѷ�Ǩ�˿�");
		celData2.setColspan(2);
		celData2.setRowspan(1);
		celData2.setX(x + 1);
		celData2.setY(y + 1);
		ExcelColData celData3 = new ExcelColData();
		celData3.setValue("�ۼ�");
		celData3.setColspan(0);
		celData3.setRowspan(0);
		celData3.setX(x + 3);
		celData3.setY(y + 1);
		ExcelColData celData4 = new ExcelColData();
		celData4.setValue("����");
		celData4.setColspan(0);
		celData4.setRowspan(0);
		celData4.setX(x + 3);
		celData4.setY(y + 2);
		ExcelColData celData5 = new ExcelColData();
		celData5.setValue("����");
		celData5.setColspan(0);
		celData5.setRowspan(0);
		celData5.setX(x + 3);
		celData5.setY(y + 3);
		return new Head(y + 4, new ExcelColData[] { celData, celData1,
				celData2, celData3, celData4, celData5 }, new String[] {
				"shouldMovePopulation", "removedPopulationTotal",
				"movedPopulation", "removedPopulationYear" });
	}

	private Head getXiaDaTengDiShuHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�����´������ڵؾ�����");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "yearDeadlineFile" });
	}

	private Head getShenQingFaYuanZhiXingHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("�������뷨Ժִ��");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "yearCourtExecute" });
	}

	private Head getYiFaQiangZhiTengDiHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("��������ʵʩǿ���ڵػ���");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "yearLegalRemoved" });
	}

	private Head getLiuQianXingMuHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("������ǰ��Ŀ������");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "sixForheadPro" });
	}

	private Head getBeiZhuHead(int x, int y) {
		ExcelColData celData = new ExcelColData();
		celData.setValue("��ע");
		celData.setColspan(0);
		celData.setRowspan(3);
		celData.setX(x);
		celData.setY(y);
		return new Head(y + 1, new ExcelColData[] { celData },
				new String[] { "remark" });
	}

	private class Head {
		public Head(int y, ExcelColData[] celData, String[] celKey) {
			super();
			this.y = y;
			this.celData = celData;
			this.celKey = celKey;
		}

		private int y;
		private ExcelColData[] celData;
		private String[] celKey;

		public ExcelColData[] getCelData() {
			return celData;
		}

		public String[] getCelKey() {
			return celKey;
		}
	}
}
