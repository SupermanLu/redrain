package com.redrain.service.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.redrain.dao.LbMapper;
import com.redrain.dao.UserMapper;
import com.redrain.model.Gain;
import com.redrain.model.Info;
import com.redrain.model.Lb;
import com.redrain.model.User;
import com.redrain.service.LbService;
import com.redrain.service.UserService;

@Service("lbService")
public class LbServiceImpl implements LbService {

	private final static String XLS = "xls";

	private final static String XLSX = "xlsx";

	@Resource
	private LbMapper objectDao;

	public Lb getObjectById(Integer objectId) {
		// TODO Auto-generated method stub
		return this.objectDao.selectByPrimaryKey(objectId);
	}

	public int insert(Lb object) {
		return this.objectDao.insert(object);
	}

	public int updateByPrimaryKey(Lb object) {
		return this.objectDao.updateByPrimaryKey(object);
	}

	public int deleteByPrimaryKey(Integer id) {
		return this.objectDao.deleteByPrimaryKey(id);
	}

	public int importExcel(MultipartFile myFile) throws Exception {
		// TODO Auto-generated method stub
		Workbook workbook = null;
		String fileName = myFile.getOriginalFilename();
		if (fileName.endsWith(XLS)) {
			// 2003
			workbook = new HSSFWorkbook(myFile.getInputStream());
		} else if (fileName.endsWith(XLSX)) {
			// 2007
			workbook = new XSSFWorkbook(myFile.getInputStream());
		} else {
			throw new Exception("文件不是Excel文件");
		}

		Sheet sheet = workbook.getSheet("Sheet1");
		int rows = sheet.getLastRowNum();
		if (rows == 0) {
			throw new Exception("请填写数据");
		}

		for (int i = 1; i <= rows + 1; i++) {
			Row row = sheet.getRow(i);
			if (row != null&&!isRowEmpty(row)&&!getCellValue(row.getCell(0)).equals("")) {
				Lb object = new Lb();
				String username = getCellValue(row.getCell(0));
				object.setLbname(username);
				String money = getCellValue(row.getCell(1));
				object.setLbmoney(money);
				

				this.objectDao.insert(object);
			}
		}
		return 0;
	}

	public static boolean isRowEmpty(Row row) {

		for (int c = row.getFirstCellNum(); c < row.getLastCellNum(); c++) {

			Cell cell = row.getCell(c);

			if (cell != null && cell.getCellType() != Cell.CELL_TYPE_BLANK)

				return false;

		}

		return true;

	}

	public String getCellValue(Cell cell) {
		String value = "";
		if (cell != null) {
			// 以下是判断数据的类型
			switch (cell.getCellType()) {
			case HSSFCell.CELL_TYPE_NUMERIC:
				value = cell.getNumericCellValue() + "";
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					Date date = cell.getDateCellValue();
					if (date != null) {
						value = new SimpleDateFormat("yyyy-MM-dd").format(date);
					} else {
						value = "";
					}
				} else {
					value = new DecimalFormat("0").format(cell.getNumericCellValue());
				}
				break;
			case HSSFCell.CELL_TYPE_STRING:
				value = cell.getStringCellValue();
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				value = cell.getBooleanCellValue() + "";
				break;
			case HSSFCell.CELL_TYPE_FORMULA:
				value = cell.getCellFormula() + "";
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				value = "";
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				value = "非法字符";
				break;
			default:
				value = "未知类型";
				break;

			}
		}
		return value.trim();
	}
	
	public List<Lb> selectList(Lb object) {
		// TODO Auto-generated method stub
		return this.objectDao.selectList(object);
	}

	public List<Lb> selectCount(Lb object) {
		// TODO Auto-generated method stub
		return this.objectDao.selectCount(object);
	}

	public int update(Lb object) {
		// TODO Auto-generated method stub
		return this.objectDao.updateByPrimaryKeySelective(object);
	}

	public int deletebyid(Integer objectId) {
		// TODO Auto-generated method stub
		return this.objectDao.deleteByPrimaryKey(objectId);
	}
	
	
	public List<Lb> selectAllList() {
		// TODO Auto-generated method stub
		List<Lb> list=this.objectDao.selectAllList();
		List<Lb> resList=new ArrayList();
		int size=list.size();
		for(int i=0;i<20;i++) {
			int b=(int)(Math.random()*(size-1));
			resList.add(list.get(b));
		}
		return resList;
	}
	
	public int delete() {
		// TODO Auto-generated method stub
		return this.objectDao.deleteAllLb();
	}


}
