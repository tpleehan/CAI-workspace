
function updateConfirm() {
	
	if(document.update_form.name.value == 0) {
		alert("이름란이 비어 있습니다.");
		update_form.name.focus();
		return;
	}
	
	if(document.update_form.pw.value == 0) {
		alert("비밀번호란이 비어 있습니다.");
		update_form.pw.focus();
		return;
	}
	
	if(document.update_form.pw_check.value == 0) {
		alert("비밀번호 확인란이 비어 있습니다.");
		update_form.pw_check.focus();
		return;
	}
	
	if(document.update_form.email.value == 0) {
		alert("이메일란이 비어 있습니다.");
		update_form.email.focus();
		return;
	}
	
	if(document.update_form.phone.value == 0) {
		alert("핸드폰란이 비어 있습니다.");
		update_form.phone.focus();
		return;
	}
	
	if(document.update_form.phone2.value == 0) {
		alert("핸드폰란이 비어 있습니다.");
		update_form.phone2.focus();
		return;
	}
	
	if(document.update_form.phone3.value == 0) {
		alert("핸드폰란이 비어 있습니다.");
		update_form.phone3.focus();
		return;
	}
	
	if(document.update_form.address.value == 0) {
		alert("주소란이 비어 있습니다.");
		update_form.address.focus();
		return;
	}
	
	if(document.update_form.address2.value == 0) {
		alert("상세주소란이 비어 있습니다.");
		update_form.address2.focus();
		return;
	}
	
	if(document.update_form.pw.value.length < 4) {
		alert("비밀번호는 4글자 이상이어야 합니다.");
		update_form.pw.focus();
		return;
	}
	
	if(document.update_form.phone.value.length < 3) {
		alert("핸드폰 번호는 3글자 이어야 합니다.");
		update_form.phone.focus();
		return;
	}
	
	if(document.update_form.phone2.value.length < 4) {
		alert("핸드폰 번호는 4글자 이어야 합니다.");
		update_form.phone2.focus();
		return;
	}
	
	if(document.update_form.phone3.value.length < 4) {
		alert("핸드폰 번호는 4글자 이어야 합니다.");
		update_form.phone3.focus();
		return;
	}
	
	if(document.update_form.pw.value != document.update_form.pw_check.value){
		alert("비밀번호가 틀렸습니다. 비밀번호 확인란을 확인하세요.");
		update_form.pw_check.focus();
		return;
	}
	
	if(confirm("수정 하시겠습니까?")) {
		update_form.submit();
		
	} else {
		return;
		
	}
	
}
