'''
* 함수 (function)
- 함수는 지속적으로 사용되는 코드블록에 이름을 붙여놓은 형태이다.
- 함수는 한 번 정의해 두면 지정된 함수 이름을 통해 언제든지 해당 코드 블록을 실행할 수 있다.
- 함수를 정의할 때는 def라는 키워드를 사용한다.
- 정의해 놓은 함수를 사용하는 것을 호출(call) 이라고 부른다.
- 파이썬에서는 함수를 호출하려면 반드시 호출문보다 상단부에 함수를 먼저 정의해야 한다.
'''

# 함수의 정의 (1 ~ x까지의 누적합을 구하는 로직)
from audioop import add


def calc_sum(end):
    sum = 0
    for n in range(1, end + 1):
        sum += n
    return sum

# 함수의 호출
print('1 ~ 100가지의 누적합: ', calc_sum(100))


'''
* 인수, 매개변수 (arguments)
- 인수는 함수를 호출할 때 함수 실행에 필요한 값들을 전달하는 매개체 역할을 하며, 매개변수(parameter)라고 부른다.
- 인수의 개수는 제한이 없어 많은 값을 함수에 전달할 수도 있고 하나도 전달하지 않을 수 있다.

- 파이썬의 경우에는 데이터 타입을 작성하지 않기 때문에
해당 함수를 처음 사용하는 사람도 인수 이름만 보고 무슨 값을
전달해야 할 지 의미를 알기 쉽게 지정하는 것이 좋다.
'''


'''
* 연습
1. 인수를 정수형태로 시작값(start), 끝값(end)을 입력받아
 반복문으로 start부터 end까지의 누적 총합을 구하는 함수를 정의한다.

2. 함수 이름은 calc_rangesum으로 정의
ex) calc_rangesum(3, 7) -> 3부터 7까지의 누적합을 구해와야 한다.

3. 출력예시: "x~y까지의 누적합: z"
사용자에게 입력받은 값을 함수로 전달해서 값을 출력한다.
'''

def calc_rangesum(start, end):
    if start > end:
        start, end = end, start
    
    total = 0
    for n in range(start, end + 1):
        total += n
    return total

print('-' * 40)
n1 = int(input('정수1: '))
n2 = int(input('정수2: '))

print(f'{n1} ~ {n2}까지의 누적합: {calc_rangesum(n1, n2)}')


'''
* 반환값(return value)
- 반환값이란 함수를 호출한 곳으로 함수의 최종 실행 결과를 전달하는 값이다.
- 인수는 여러 개 존재할 수 있지만, 반환값은 언제나 하나만 존재해야 한다.
- 모든 함수가 반환값이 있는 것은 아니다.
 함수 실행 후에 딱히 반환할 값이 없다면 return을 생략할 수 있다.
'''

def add(n1, n2):
    return n1 + n2

result = add(10, 5)
print(result)
print(add(add(5, 7), add(9, 8))) # add(12, 17)이라 생각하면 된다.

# n = int(input('정수: ')) -> n = int('3')
