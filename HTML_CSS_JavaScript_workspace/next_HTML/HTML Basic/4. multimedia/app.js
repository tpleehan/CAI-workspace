const $btn = document.querySelector('#change');
const $new = document.querySelector('#old-script');

$btn.addEventListener('click', e => {
    $new.textContent = '변경 버튼을 누른 스크립트 글 입니다.';
});