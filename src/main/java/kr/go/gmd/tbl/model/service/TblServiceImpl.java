package kr.go.gmd.tbl.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.go.gmd.tbl.model.dao.TblDao;
import kr.go.gmd.tbl.model.vo.Tbl;

@Service
public class TblServiceImpl implements TblService {

	@Autowired
	private TblDao tblDao;

	@Override
	public List<String> selectTblNameList() {
		return tblDao.selectTblNameList();
	}

	@Override
	public List<Tbl> selectTblByTblName(String tblName) {
		return tblDao.selectTblByTblName(tblName);
	}
}
