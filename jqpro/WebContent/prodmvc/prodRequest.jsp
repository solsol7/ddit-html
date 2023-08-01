<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../js/jquery-3.7.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- w3schools - 부트스트랩 -->
<script>
$(function(){
	
	//lprod를 실행
	$.ajax({
		url : "<%=request.getContextPath()%>/lProdList.do",
		type : 'get',
		dataType : 'json',
		success : function(res){
			code = "";
			$.each(res, function(i, v){
				
				code += `<option value="${v.lprod_gu}">${v.lprod_nm}</option>`
			})
			
			$('#lprod').html(code);
			
			$('#lprod').trigger('change')
			
		},
		error : function(xhr){
			alert("상태 : "+ xhr.status);
		}
	})
	
	//lprod_gu를 서버로 보내서 prod_lgu와 값이 같은 조건으로 prod의 id, name을 select
	$('#lprod').on('change', function(){
		
// 		$('#lprod option:selected').val()
		guvalue = $('option:selected',this).val()
		
		$.ajax({
			url : '<%=request.getContextPath()%>/prodList.do',
			data : 'gu=' + guvalue,
			type : 'post',
			dataType : 'json',
			success : function(res){
				code="";
				if(res.sw=="ok"){
					$.each(res.datas, function(i,v){
						code += `<option value="${v.prod_id}">${v.prod_name}</option>`;
					})
				}else{
					code += `<option value="0">데이타없음</option>`
					$('#result').empty();
				}
					$('#prod').html(code);
					
					$('#prod').trigger('change');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status)
			}
		})
	})
	
	//prod id를 기준으로 prod detail을 수행
	
	$('#prod').on('change',function(){
// 		$('#prod option:selected')
		idvalue = $('option:selected',this).val().trim();
		
		console.log(idvalue);
		
		if(idvalue!=null){
			$.ajax({
				url : '<%=request.getContextPath()%>/prodDetail.do',
				type : 'post',
	// 			data : "id=" + idvalue,			//일반 문자열
				data : { "id" : idvalue },		//객체타입{키:밸류}
				dataType : 'json',
				success : function(res){
					code = `<table border="1" class="table table-striped">
							<tr>
								<td>PROD_ID</td>
								<td>${res.prod_id}</td>
							</tr>
							<tr>
								<td>PROD_NAME</td>
								<td>${res.prod_name}</td>
							</tr>							
							<tr>
								<td>PROD_LGU</td>
								<td>${res.prod_lgu}</td>
							</tr>
							<tr>
								<td>PROD_BUYER</td>
								<td>${res.prod_buyer}</td>
							</tr>
							<tr>
								<td>PROD_PRICE</td>
								<td>${res.prod_price}</td>
							</tr>
							<tr>
								<td>PROD_COST</td>
								<td>${res.prod_cost}</td>
							</tr>
							<tr>
								<td>PROD_SALE</td>
								<td>${res.prod_sale}</td>
							</tr>
							<tr>
								<td>PROD_OUTLINE</td>
								<td>${res.prod_outline}</td>
							</tr>
							</table>`;
					$('#result').html(code);
					
				},
				error : function(xhr){
					alert("상태 : " + xhr.status);
				}
			})//ajax
		}//if문

	})//change이벤트
})//$function
</script>
</head>
<body>

<div class="container mt-3">
    <label for="lprod" class="form-label">Lprod List</label>
    <select class="form-select" id="lprod" name="sellist1">
    </select>
    <br>
    
    <label for="prod" class="form-label">prod List</label>
    <select class="form-select" id="prod" name="sellist2">
    </select>
</div>

<br>
<br>
<div id="result"></div>
</body>
</html>