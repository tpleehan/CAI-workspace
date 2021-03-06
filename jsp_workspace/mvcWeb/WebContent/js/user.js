
function joinConfirm(){
	
	if(document.reg_form.id.value == 0) {
		alert("아이디는 필수 사항입니다.");
		reg_form.id.focus(); //태그안에 마우스 포커스
		return; //메서드 강제 종료
	}
	
	if(document.reg_form.pw.value == 0) {
		alert("비밀번호는 필수 사항입니다.");
		reg_form.pw.focus();
		return;
	}
	
	if(document.reg_form.pw_check.value == 0) {
		alert("비밀번호는 필수 사항입니다.");
		reg_form.pw_check.focus();
		return;
	}
	
	if(document.reg_form.name.value == 0) {
		alert("이름은 필수 사항입니다.");
		reg_form.name.focus();
		return;
	}
	
	if(document.reg_form.phone.value == 0) {
		alert("핸드폰은 필수 사항입니다.");
		reg_form.phone.focus();
		return;
	}
	
	if(document.reg_form.phone2.value == 0) {
		alert("핸드폰은 필수 사항입니다.");
		reg_form.phone2.focus();
		return;
	}
	
	if(document.reg_form.phone3.value == 0) {
		alert("핸드폰은 필수 사항입니다.");
		reg_form.phone3.focus();
		return;
	}
	
	if(document.reg_form.email.value == 0) {
		alert("이메일은 필수 사항입니다.");
		reg_form.email.focus();
		return;
	}
	
	if(document.reg_form.address.value == 0) {
		alert("주소 필수 사항입니다.");
		reg_form.address.focus();
		return;
	}
	
	if(document.reg_form.address2.value == 0) {
		alert("상세주소 필수 사항입니다.");
		reg_form.address2.focus();
		return;
	}
	//id의 값의 길이
	if(document.reg_form.id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_form.id.focus();
		return;
	}
	
	if(document.reg_form.pw.value.length < 4) {
		alert("비밀번호는 4글자 이상이어야 합니다.");
		reg_form.pw.focus();
		return;
	}
	
	if(document.reg_form.pw.value != document.reg_form.pw_check.value){
		alert("비밀번호가 틀렸습니다. 비밀번호 확인란을 확인하세요.");
		reg_form.pw_check.focus();
		return;
	}
	
	if(document.reg_form.phone.value.length < 3) {
		alert("핸드폰 번호는 3글자 이어야 합니다.");
		reg_form.phone.focus();
		return;
	}
	
	if(document.reg_form.phone2.value.length < 4) {
		alert("핸드폰 번호는 4글자 이어야 합니다.");
		reg_form.phone2.focus();
		return;
	}
	
	if(document.reg_form.phone3.value.length < 4) {
		alert("핸드폰 번호는 4글자 이어야 합니다.");
		reg_form.phone3.focus();
		return;
	}
	
	if(confirm("회원가입 하시겠습니까?")) {
		reg_form.submit();
	} else {
		return;
	}
	
}
