package kr.go.gmd.tbl.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.go.gmd.tbl.model.vo.Tbl;

@Repository
public class TblDaoImpl implements TblDao {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<String> selectTblNameList() {
		return session.selectList("tbl.selectTblNameList");
	}

	@Override
	public List<Tbl> selectTblByTblName(String tblName) {
		return session.selectList("tbl.selectTblByTblName", tblName);
	}
}
