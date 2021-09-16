package kr.go.gmd.tbl.model.dao;

import java.util.List;

import kr.go.gmd.tbl.model.vo.Tbl;

public interface TblDao {

	List<String> selectTblNameList();

	List<Tbl> selectTblByTblName(String tblName);

}
