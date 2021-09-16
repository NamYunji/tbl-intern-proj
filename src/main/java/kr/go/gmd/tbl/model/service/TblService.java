package kr.go.gmd.tbl.model.service;

import java.util.List;

import kr.go.gmd.tbl.model.vo.Tbl;

public interface TblService {

	List<String> selectTblNameList();

	List<Tbl> selectTblByTblName(String tblName);

}
