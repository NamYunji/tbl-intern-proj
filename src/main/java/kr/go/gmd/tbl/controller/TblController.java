package kr.go.gmd.tbl.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import ch.qos.logback.classic.Logger;
import kr.go.gmd.tbl.model.service.TblService;
import kr.go.gmd.tbl.model.vo.Tbl;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/tbl")
@Slf4j
public class TblController {

	@Autowired
	TblService tblService;

	@GetMapping("/tblList.do")
	public void tblList(Model model) {
		List<String> tblNameList = tblService.selectTblNameList();
		// log.debug("tblNameList = {}", tblNameList);
		model.addAttribute("tblNameList", tblNameList);
	}

	@GetMapping("/table/{tblName}")
	public List<Tbl> tblByTblName(@PathVariable String tblName) {
		System.out.println("tblName = " + tblName);
			List<Tbl> list = tblService.selectTblByTblName(tblName);
			return list;
	}
}
