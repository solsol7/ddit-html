<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="../js/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
.form-control{
  width : 200px;
  height : 30px;
}
#add1, #add2{
  width : 400px;
}
input[type=button]{
  margin-bottom: 2px;
}
</style>
</head>
<body>
<div class="container mt-3">
  <h2>회원가입</h2>
  <form action="">  
    <div class="mb-3 mt-3">
      <label for="id">아이디:</label>
      <input type="button" class="btn btn-outline-primary btn-sm" value="중복검사">
      <span id="checkid"></span>
      <input type="text" class="form-control" id="id" name="mem_id">
    </div>
    <div class="mb-3 mt-3">
      <label for="name">이름:</label>
      <input type="text" class="form-control" id="name" name="mem_name">
    </div>
    <div class="mb-3 mt-3">
      <label for="email">Email:</label>
      <input type="text" class="form-control" id="email" name="mem_mail">
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="mem_pass">
    </div>
    <div class="mb-3">
      <label for="hp">전화번호:</label>
      <input type="text" class="form-control" id="hp" name="mem_hp">
    </div>
    <div class="mb-3">
      <label for="bir">생일:</label>
      <input type="date" class="form-control" id="bir" name="mem_bir">
    </div>
    <div class="mb-3">
      <label for="zip">우편번호:</label>
      <input type="button" value="번호검색" class="btn btn-outline-primary btn-sm">
      <input type="text" class="form-control" id="zip" name="mem_zip">
    </div>
    <div class="mb-3">
      <label for="add1">주소:</label>
      <input type="text" class="form-control" id="add1" name="mem_add1">
    </div>
    <div class="mb-3">
      <label for="add2">상세주소:</label>
      <input type="text" class="form-control" id="add2" name="mem_add2">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <span id="joinspan"></span>
  </form>
</div>
</body>
</html>