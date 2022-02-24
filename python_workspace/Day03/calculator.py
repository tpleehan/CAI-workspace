def add(n1, n2):
    return n1 + n2

def sub(n1, n2):
    return n1 - n2

def calc_sum(end):
    sum = 0
    for n in range(end + 1):
        sum += n
    return sum

def info():
    print('모듈 임포트 연습')

inch = 2.54
yard = 0.91
lb = 0.45


'''
- 배포의 목적으로 만든 모듈이라면 테스트 코드를 작성해서
 다른 사용자들에게 모듈 사용법을 간단히 공개해주면 좋다.

- 처음부터 import를 목적으로 설계된 모듈의 테스트 코드 작성 시
다음과 같은 문법 하에서 테스트를 실행한다.

ex) if __name__ == '__main__':
        test code...

- __name__ 이라는 숨겨진 변수 (내장 변수)에는 현재 실행중인 모듈의 이름이 저장되게 되는데,
현재 모듈에서 실행할 때는 이름이 main으로 저장되고 다른 모듈에서 실행할 때는 이름이 모듈 이름으로 저장된다.
'''

if __name__ == '__main__': # 현재 모듈에서는 main, 다른 모듈에서
    print('__name__의 값:', __name__)

    # test code
    print('1 ~ 100까지의 누적합:', calc_sum(100))
    info()
    print(sub(100, 15))
    print('이런 식으로 쓰면 됩니다.')