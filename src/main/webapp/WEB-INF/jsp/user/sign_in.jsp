<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center">
	<div class="login-box">
		<h1>로그인</h1>
		
		<form id="loginForm" method="post" action="/user/sign_in">
			<div class="input-group mb-3">
				<%-- input-group-prepend : input 앞에 ID 부분을 회색으로 붙인다. --%>
				<div class="input-group-prepend">
					<span class="input-group-text">ID</span>
				</div>
				<input type="text" class="form-control" id="loginId" name="loginId">
			</div>
			
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">PW</span>
				</div>
				<input type="password" class="form-control" id="password" name="password">
			</div>
			
			<input type="submit" class="btn btn-primary btn-block" value="로그인">
			<a href="/user/sign_up_view" class="btn btn-dark btn-block">회원가입</a>
		</form>
	</div>
</div>

<script>
	$(document).ready(function(){
		$('#loginForm').submit(function(e){
			e.preventDefault();
			
			// validation
			let loginId = $('#loginId').val().trim();
			if(loginId == ''){
				alert("아이디를 입력하세요");
				return;
			}
			
			let password = $('#password').val();
			let confirmPassword = $('#confirmPassword').val();
			if(password == '' || confirmPassword == ''){
				alert("비밀번호를 입력하세요.");
				return;
			}
			
			// AJAX로 submit
			let url = $(this).attr('action');
			let params = $(this).serialize();
			
			$.post(url, params).done(function(data){
				if(data.result == 'success'){
					location.href ="/post/post_list_view";
				} else{
					alert("로그인에 실패했습니다. 다시 시도해주세요");
				}
			});
		});
	});
</script>