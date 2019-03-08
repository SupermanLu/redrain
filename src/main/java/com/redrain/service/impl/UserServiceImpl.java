package com.redrain.service.impl;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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

import com.redrain.dao.UserMapper;
import com.redrain.model.Info;
import com.redrain.model.User;
import com.redrain.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	private final static String XLS = "xls";

	private final static String XLSX = "xlsx";

	@Resource
	private UserMapper userDao;

	public User getUserById(String userId) {
		// TODO Auto-generated method stub
		return this.userDao.selectByPrimaryKey(userId);
	}

	public int insert(User user) {
		return this.userDao.insert(user);
	}

	public int updateByPrimaryKey(User user) {
		return this.userDao.updateByPrimaryKey(user);
	}

	public int deleteByPrimaryKey(String id) {
		return this.userDao.deleteByPrimaryKey(id);
	}

	public List<User> getUserByUserName(String userName) {
		return this.userDao.selectByUserName(userName);
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
				User user = new User();
				String username = getCellValue(row.getCell(0));
				user.setUsername(username);
				String money = getCellValue(row.getCell(1));
				if (!StringUtils.isEmpty(money)) {
					Integer fixedmoney = Integer.parseInt(money);
					user.setFixedmoney(fixedmoney);
				}
				String count = getCellValue(row.getCell(2));
				if (!StringUtils.isEmpty(count)) {
					Integer num = Integer.parseInt(count);
					user.setFloatercount(num);
				}
				if(!user.getUsername().equals("admin"))
				{
					List<User> list=this.userDao.selectByUserName(username);
					if(list.size()>0) {
						User updUser=list.get(0);
						updUser.setFixedmoney(user.getFixedmoney());
						updUser.setFloatercount(user.getFloatercount());
						this.userDao.updateByPrimaryKey(updUser);
					}
					else {
						this.userDao.insert(user);
					}
				}
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
	
	public List<User> selectList(User info) {
		// TODO Auto-generated method stub
		return this.userDao.selectList(info);
	}

	public List<User> selectCount(User info) {
		// TODO Auto-generated method stub
		return this.userDao.selectCount(info);
	}

	public int update(User user) {
		// TODO Auto-generated method stub
		return this.userDao.updateByPrimaryKeySelective(user);
	}

	public int deletebyid(String userId) {
		// TODO Auto-generated method stub
		return this.userDao.deleteByPrimaryKey(userId);
	}

	public int delete() {
		// TODO Auto-generated method stub
		return this.userDao.deleteAllUser();
	}

}
