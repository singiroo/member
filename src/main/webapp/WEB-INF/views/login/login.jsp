<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="/member/resources/bootstrap/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

<%@ include file="/WEB-INF/views/layout/commonLib.jsp" %>

<style>
body.login-page {
	background-image: url('/member/resources/images/intro.jpg');
	background-position: center;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<script src="${pageContext.request.contextPath}/member/resources/js/js.cookie-2.2.1.min.js"></script>
<script>
	$(function(){
		//remember me cookie 확인
		if(Cookies.get("rememberme")=="Y"){
			$('#id').val(Cookies.get("userId"));
			$('#rememberme').prop('checked',true);
		}
		
		//remember me check 여부에 의한 쿠키 생성/제거
		$('#submitBtn').on('click', function(){
			var id = "";
			if($('#rememberme').prop('checked')){
				id = $('#id').val();
				Cookies.set("rememberme", "Y");
				Cookies.set("userId", id);
			}else{
				Cookies.remove("rememberme");
				Cookies.remove("userId");
			}
			$('form').submit();
		})
	})
</script>




</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>관리자 로그인</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>

				<form action="/main" method="post">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="id" name="id"
							placeholder="아이디를 입력하세요." value="${id}"> <span
							class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="pwd"
							placeholder="패스워드를 입력하세요." value=""> <span
							class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck">
								<label> <input type="checkbox" id="rememberme" name="rememberMe"
									value=""> Remember Me
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-sm-4">
							<button id="submitBtn" type="submit" class="btn btn-primary btn-block btn-flat">로그인</button>
						</div>
						<!-- /.col -->
					</div>
				</form>

			</div>
			<!-- /.login-box-body -->
		</div>
	</div>
	<!-- /.login-box -->
	
</body>
</html>