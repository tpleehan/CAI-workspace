
// 일정 데이터가 들어 있는 배열 선언
const todos = [
  {
    id: 1,
    text: '할 일 1',
    done: false // checkbox를 클릭해서 할 일을 마쳤는지 여부
  },
  {
    id: 2,
    text: '할 일 2',
    done: false // checkbox를 클릭해서 할 일을 마쳤는지 여부
  },
  {
    id: 3,
    text: '할 일 3',
    done: false // checkbox를 클릭해서 할 일을 마쳤는지 여부
  }
];

// 추가될 할 일 객체의 id를 생성해 주는 함수 정의


// 화면에 표현할 .todo-list-item 노드를 생성하는 함수 정의
// li를 생성하고 label, div 2개 요소를 생성해서 추가하는 함수


// data-id 값으로 배열을 탐색하여 일치하는 객체가 들어있는 인덱스 반환
// (할 일 완료 처리를 할 때 필요한 함수)


// 수정 모드 진입 함수
// 수정 완료 이벤트 처리 함수


// 메인 역할을 하는 즉시 실행 함수



const $lnr_undo = document.querySelector('.lnr-undo');
const $todo_list_item = document.querySelector('.todo-list-item');
const $span = document.querySelector('.todo-list-item > label > span');

$lnr_undo.addEventListener('click', e => {

  if (!e.target.matches('ul > li > div > .lnr-undo')) {
    return;
  }
  console.log($span);

  // let input = document.createElement('input');
  // input.append($span);

});




const $todo_list = document.querySelector('.todo-list');

$todo_list.addEventListener('click', e => {
  
  if (!e.target.matches('ul > li > div > .lnr-cross-circle')) {
    return;
  }
  
  e.target.parentNode.parentNode.remove();
});
