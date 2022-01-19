
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
  },
];

// 추가될 할 일 객체의 id를 생성해 주는 함수 정의
function makeNewId() {
  if (todos.length > 0) {
    return todos[todos.length-1].id + 1;
  } else {
    return 1;
  }
}

// 화면에 표현할 .todo-list-item 노드를 생성하는 함수 정의
function makeNewToDoNode(newTodo) {
  const $li = document.createElement('li');
  const $label = document.createElement('label');
  const $divMod = document.createElement('div');
  const $divRem = document.createElement('div');

  // label 태그 작업
  $label.classList.add('checkbox');
  const $check = document.createElement('input');
  $check.setAttribute('type', 'checkbox');
  const $span = document.createElement('span');
  $span.classList.add('text');
  $span.textContent = newTodo.text;

  $label.appendChild($check);
  $label.appendChild($span);

  // 수정 div태그 작업
  $divMod.classList.add('modify');
  const $modIcon = document.createElement('span');
  // 클래스 이름을 add할 때 두개 이상의 경우 매개값을 두개 보내야 한다.
  // 두개의 클래스를 한번에 공백 포함해서 설정하면 에러
  $modIcon.classList.add('lnr', 'lnr-undo');
  $divMod.appendChild($modIcon);

  // 삭제 div 태그 작업
  $divRem.classList.add('remove');
  const $remIcon = document.createElement('span');
  $remIcon.className = 'lnr lnr-cross-circle';
  $divRem.appendChild($remIcon);

  // li 태그 작업
  $li.dataset.id = newTodo.id;
  $li.classList.add('todo-list-item');

  for (let $ele of [$label, $divMod, $divRem]) {
    $li.appendChild($ele);
    
  }

  // ul 태그를 지목해서 $li를 자식노드로 추가
  document.querySelector('.todo-list').appendChild($li);

}

// 화면에 표현할 .todo-list-item 노드를 생성하는 함수 정의
// li를 생성하고 label, div 2개 요소를 생성해서 추가하는 함수
/* 할 일 추가 처리 함수 정의 */
function insertToDoData() {

  const $todoText = document.getElementById('todo-text');

  // 입력값이 없다면 추가 처리하지 않는다.
  // 공백이 들어갈 가능성이 있기 때문에 공백을 제거하고 비교
  // trim(): 문자열의 앞/뒤 공백 제거

  if ($todoText.value.trim() === '') {
    $todoText.style.background = 'orangered';
    $todoText.setAttribute('placeholder', '필수 입력사항입니다.')
    $todoText.value = '';
    return;
  } else {
    // 제대로 입력이 되었다면 속성과 디자인을 초기화
    $todoText.setAttribute('placeholder', '할 일을 입력하세요.');
    $todoText.style.background = '';
  }

  // 1. tods 배열에 객체를 생성한 후 추가
  const newTodo = {
    id: makeNewId(),
    text: $todoText.value,
    done: false
  };

  todos.push(newTodo);

  // 2. 추가된 데이터를 화면에 표현(li 태그 추가)
  makeNewToDoNode(newTodo);

  // 3. 입력 완료 후 input에 존재하는 문자열 제거
  $todoText.value = '';

}


// data-id 값으로 배열을 탐색하여 일치하는 객체가 들어있는 인덱스 반환
// (할 일 완료 처리를 할 때 필요한 함수)
function findIndexByDataId(dataId) {
  for (let i = 0; i < todos.length; i++) {
    if (dataId === todos[i].id) {
      return i;
    } 
  }

}

/* 할 일 완료 처리 수행 함수 정의 */
function changeCheckState($label) {

  // 할 일이 완료된 노드의 클래스 이름 추가 (디자인 적용시키기 위함)
  // checked를 상황에 따라서 추가하거나 삭제해야 하기 때문에 toggle 함수로 처리
  $label.classList.toggle('checked');

  // dataId를 기반으로 배열을 탐색하여 data-id와 일치하는
  // id 프로퍼티를 가진 객체의 인덱스를 얻어온다.
  const dataId = +$label.parentNode.dataset.id;
  const index = findIndexByDataId(dataId);

  todos[index].done = !todos[index].done;

  console.log(todos);

}

/* 할 일 삭제 처리 수행 함수 정의 */
function removeToDoData($delTarget) {

  // 애니메이션 적용을 위해 클래스 이름 추가
  $delTarget.classList.add('delMoving');

  // removeChild 진행 전 애니메이션 발동 후 배열 내부에 객체 삭제 되도록 시간 지연
  setTimeout(() => {
    document.querySelector('.todo-list').removeChild($delTarget);
  }, 1500);

  // 배열 내에 있는 객체 삭제 진행
  const index = findIndexByDataId(+$delTarget.dataset.id);
  todos.splice(index, 1);

  console.log(todos);

}

// 수정 모드 진입 함수
// 수정 완료 이벤트 처리 함수
/* 할 일 수정 처리 수행 함수 정의 */
function modifyToDoData($modTarget) {
  
  const $input = document.createElement('input');
  
  if ($modTarget.className === 'undo') {
    $modTarget.classList.toggle('lnr-undo');
    
  } else {
    $modTarget.classList.toggle('lnr-checkmark-circle');
    // document.querySelector('.todo-list-item span').appendChild($input);
    
  }
}

// 메인 역할을 하는 즉시 실행 함수
(function() {

  // 할 일 추가 이벤트
  const $addBtn = document.getElementById('add');

  $addBtn.addEventListener('click', e => {

    // form태그 안에 button은 type을 명시하지 않으면 자동 submit이 실행된다.
    e.preventDefault(); // 버튼의 고유기능(submit)을 중지
    
    insertToDoData();

  });

  // 할 일 완료(체크박스) 이벤트
  const $todoList = document.querySelector('ul.todo-list');

  $todoList.addEventListener('change', e => {

    if(!e.target.matches('input[type="checkbox"]')) {
      return;
    }

    changeCheckState(e.target.parentNode); // label을 함수의 매개값으로
  });

  // 할 일 삭제 이벤트
  $todoList.addEventListener('click', e => {

    if(!e.target.matches('.todo-list .remove span')) {
      return;
    }

    removeToDoData(e.target.parentNode.parentNode);

  });

  // 할 일 수정 이벤트
  $todoList.addEventListener('click' , e => {

    if(!e.target.matches('.todo-list .modify span')) {
      return;
    }

    modifyToDoData(e.target);

  });

}());