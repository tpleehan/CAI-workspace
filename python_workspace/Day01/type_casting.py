name = '홍길동'
score = 90

'''
# print(name + '의 점수는 ' + score + '점 입니다.') (x) TypeError: can only concatenate str (not "int") to str
- 문자열과 정수의 + 연산 진행 시 타입이 일치하지 않기 때문에 에러가 발생하는데 어느 한 쪽에 타입을 맞춰야 한다.
- 정수나 실수를 문자열로 변환할 때는 str() 내장 함수를 사용한다.
'''

print(name + '의 점수는 ' + str(score) + '점 입니다.')

# 숫자로 이루어진 문자열을 정수로 변환할 때는 int()를 사용한다.
n1 = 10
n2 = '34'
print(n1 + int(n2))

# 실수가 저장된 문자열을 실수로 변환할 때는 float()를 사용한다.
s = '2.34'
print(10 + float(s))
print(10 + float('3.14e-2'))

# 반올림을 할 때는 round() 함수를 사용한다.
print('-' * 30)

print(round(4.78))

# 반올림할 자리수를 선택하려면 함수의 두 번째 값으로 자리수를 지정한다.
print(round(4.78, 1))