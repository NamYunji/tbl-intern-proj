package kr.go.gmd.tbl.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tbl {
	private int no;
	private String atrId;
	private String atrName;
	private String atrType;
	private int length;
	private char required;
	private char pk;
	private char fk;
	private char uk;
	private String dfltVal;
	private String atrGrp;
	private String refTbl;
	private String refCode;
	private char srchAtrYn;
	private char listDispYn;
	private char encYn;
	private char maskingYn;
	private String descAtrRule;
}
