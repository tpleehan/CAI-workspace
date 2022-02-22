'''
* 반복문 (loop)
- 반복문은 유사한 명령을 반복해서 실행하는 제어문이다.
- 파이썬의 반복문 키워드: while, for ~ in
'''

# while문에 필요한 3요소: 제어변수(begin), 조건식(end), 증감식(step)

i = 1 # begin
total = 0

while i <= 10: # end
	total += i
	i += 1 # 파이썬은 증감 연산자(++, --)가 없다. 

print('1부터 10까지의 누적합: ', total)

print('-' * 30)

'''
- 정수를 2개 (x, y) 입력받아 x부터 y까지의 누적합계를 while을 사용해서 값을 구하는 코드를 만든다.
 ex) "x부터 y까지의 누적합계: z"

- 처음 정수값 x가 무조건 작은 값으로 들어올 것이라는 가정을 하고 작성한다.
 만약 x가 y보다 더 큰 값이 들어왔을 때 어떻게 대처할 지 생각해 본다. (while 2번 x)
'''

x = int(input('정수1: '))
y = int(input('정수2: '))

'''
if x > y:
	temp = x
	x = y
	y = temp
'''
if x > y:
	x, y = y, x

total = 0
n = x # x가 무조건 작을 것이기 때문에 begin으로 시작

while n <= y:
	
	total += n
	n += 1

print(x, '~', y, '까지의 누적합계: ', total)

