<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	
	.outer{
		width: 1000px;
		margin: auto;
		background-color: forestgreen;
		margin-top: 5px;
		color: antiquewhite;
	}
	#mypage-form input{ margin : 5px; }
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	<%
		String userId = loginUser.getUserId();
		String userName = loginUser.getUserName();
		
		String phone = (loginUser.getPhone() == null) ? "" : loginUser.getPhone();
		String email = (loginUser.getEmail() == null) ? "" : loginUser.getEmail();
		String address = (loginUser.getAddress() == null) ? "" : loginUser.getAddress();
		String interest = (loginUser.getInterest() == null) ? "" : loginUser.getInterest();
	%>
	
	<div class="outer">
		<br>
		<h2 align="center">마이페이지</h2>
		
		<form action="<%= contextPath%>/update.me" action="post" id="mypage-form">

			<!-- 회원아이디, 회원비밀번호, 회원명, 전화번호, 이메일, 주소, 취미 -->

			<table align="center">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="userId" value="<%= userId %>" maxlength="12" readonly required></td>
					<td></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName" maxlength="5" value="<%= userName %>" required></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;전화번호</td>
					<td><input type="text" value="<%= phone %>"name="phone" placeholder="- 포함해서 입력해주세요"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;이메일</td>
					<td><input type="email" name="email" value="<%= email %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;주소</td>
					<td><input type="text" name="address" placeholder="주소 입력" value="<%= address %>"></td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;&nbsp;취미</td>
					<td colspan="2">
						<input type="checkbox" name="interest" id="climbing" value="등산"><label for="climbing">등산</label>
						<input type="checkbox" name="interest" id="drinking" value="음주"><label for="drinking">음주</label>
						<input type="checkbox" name="interest" id="challenge" value="첼린지"><label for="challenge">첼린지</label>
						<br>
						<input type="checkbox" name="interest" id="community" value="커뮤니티"><label for="community">커뮤니티</label>
						<input type="checkbox" name="interest" id="vegetarian" value="채식"><label for="vegetarian">채식</label>
						<input type="checkbox" name="interest" id="rest" value="휴식"><label for="rest">휴식</label>
					</td>
				</tr>
			</table>
			<br><br>
			
			
			<script>
			
				var interest = '<%= interest %>';
				// 등산, 채식
				
				// 모든 체크박스가 배열에 담김
				$('input[type=checkbox]').each(function(){
					
					// 순차적으로 접근한 checkbox의 value속성값이 interest 포함되어 있을 경우 체크
					// checked속성부여 => prop(속성명, 속성값); attr(속성명, 속성값);
					
					// 자바스키립트의 indexof => 찾고자 하는 문자가 없을 경우 -1을 리턴 == 제이쿼리 search메소드 
					// 제이쿼리에서 value속성값을 리턴해주는 메소드 : val()
					// 제이쿼리에서 현재 접근한 요소 지칭 : $(this)
					if(interest.search($(this).val()) != -1){	// 포함되어 있을 경우 => checked 부여
						$(this).attr('checked', true);
					}
				});
			
			</script>

			<div align="center">
				<button type="submit" class="btn btn-sm btn-secondary">정보변경</button>
				<button type="button" class="btn btn-sm btn-warning">비밀번호변경</button>
				<button type="button" class="btn btn-sm btn-danger">회원탈퇴</button>
			</div>

		</form>
	
	
	</div>

</body>
</html>