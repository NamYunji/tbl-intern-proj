<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Complex Layout - jQuery EasyUI Demo</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="https://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.min.js"></script>
<script type="text/javascript" src="https://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
    <!-- bootstrap js: jquery load 이후에 작성할것.-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    
</head>
<body>
    <div class="col-12" style="width: 100%;;">
    <div class="easyui-layout" style="width:100%; height:1200px;">
        <div data-options="region:'north'" style="height:50px"></div>
        <div data-options="region:'south',split:true" style="height:50px;"></div>
         <div data-options="region:'east',split:true" title="테이블 정보" style="width:500px;">
            <ul class="easyui-tree" data-options="url:'',method:'get',animate:true,dnd:true"></ul>
            <div style="margin:20px 0;"></div>
            <div class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" label="Name:" labelPosition="top" style="width:100%;">
                </div>
                <div style="margin-bottom:20px">
                    <input class="easyui-textbox" label="Description:" labelPosition="top" multiline="true" value="This TextBox will allow the user to enter multiple lines of text." style="width:100%;height:120px">
                </div>
            </div>
        </div>
        <div data-options="region:'west',split:true" title="테이블 목록"  style="width:250px;">
            <div class="easyui-accordion" id="tbl-name-list" data-options="fit:true,border:false">
            	<c:forEach items="${tblNameList}" var="tblName" >
            	<div title="${tblName}" style="padding:10px;">
                    
                </div>
            	</c:forEach>
<!--                 <div title="Title2" data-options="selected:true" style="padding:10px;">
                    content2
                </div> -->
            </div>
        </div>
        <div data-options="region:'center',title:'데이터 조회',iconCls:'icon-ok'">
            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true">
                <div title="테이블이름" style="padding:5px">
                    <div class="easyui-panel py-2" style="width:100%;">
                            <select class="easyui-combobox" name="tableName" label="테이블" labelPosition="left" style="width: 200px; margin-left: 500x;">
                                <option value="NE">Nebraska</option>
                                <option value="NV">Nevada</option>
                                <option value="OH" selected>Ohio</option>
                            </select>
                            <input class="easyui-textbox" label="속성ID" labelPosition="left" >
                            <input class="easyui-textbox" label="속성명" labelPosition="left">
                            <a href="#" class="easyui-linkbutton float-right mx-3" data-options="iconCls:'icon-search'">Search</a>
                    </div>
                    <table class="easyui-datagrid"
                            data-options="url:'',method:'get',singleSelect:true,fit:true,fitColumns:true">
                        <thead>
                            <tr>
                                <th data-options="field:'itemid'" width="80">Item ID</th>
                                <th data-options="field:'productid'" width="100">Product ID</th>
                                <th data-options="field:'listprice',align:'right'" width="80">List Price</th>
                                <th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
                                <th data-options="field:'attr1'" width="150">Attribute</th>
                                <th data-options="field:'status',align:'center'" width="50">Status</th>
                            </tr>
                        </thead>
<div class="result" id="tbl-result"></div>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
$(function() {
$("#tbl-name-list").accordion({
	onSelect:function(title, index) { 
		var tblName = title;
		$.ajax({
			url: `${pageContext.request.contextPath}/tbl/table/\${tblName}`,
			method: "GET",
			success(data){
				console.log(data);
				displayResultTable("tbl-result", data);
			},
			error: console.log
		})
	}
});
});
</script>

<script>
function displayResultTable(id, data){
	const $container = $("#" + id);
	/* 테이블 동적 생성 */
	let html = "<table class='table'>";
	html += "<tr><th>번호</th><th>음식점</th><th>메뉴</th><th>가격</th><th>타입</th><th>맛</th></tr>";

	/* 배열로 넘어온 데이터 처리 : forEach */
	/* 주의 : 
		mybatis session.selectList는 조회된 것이 아무것도 없어도 null이 넘어오지 않음
		데이터가 없다면 빈 list를 리턴
		무조건 배열은 있는데 데이터가 있느냐 없느냐의 차이
	*/
	/* 검색된 데이터가 있는 경우 */
	/* 인덱스와 menu객체가 넘어옴 */
	if(data.length > 0) {
		$(data).each((i, col) => {
			/* menu객체의 것들을 하나씩 변수에 옮겨담기 */
			const {no, atrId, atrName, atrType, length, required, pk, fk, uk, dfltVal, atrGrp, refTbl, refCode, srchAtrYn, listDispYn, encYn, makingYn, descAtrRule} = tbl;
			/* 변수의 값들을 td안에 넣어줌 */
			/* [`] template string 사용 : 여러줄 입력 가능 */
			html +=`
				<tr>
					<td>\${no}</td>
					<td>\${atrId}</td>
					<td>\${atrName}</td>
					<td>\${length}</td>
					<td>\${required}</td>
					<td>\${pk}</td>
				</tr>`;
		}); 
	}

	html += "</table>";
	/* 만들어준 html을 추가해줌 */
	$container.html(html);
}
</script>