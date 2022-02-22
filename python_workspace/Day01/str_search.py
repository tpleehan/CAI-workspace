'''
* 문자열 관리 함수, 메서드
- 함수: 모듈 내부에서 공용적으로 사용할 수 있는 기능 (단독 호출)
- 메서드: 클래스에 소속된 함수, 특정 자료형 전용 함수. (참조할 문자열을 .앞에 붙인다.)
'''

# 내장함수 len(): 순차형 자료(sequence)의 내부 데이터 개수를 구한다.
# len()은 함수이기 때문에 문자열 이외에 다른 곳에서 쓸 수 있다.

s = 'python programming'

count = 0
for c in s:
	count += 1
print('s의 글자 수: ', count)
print('s의 글자 수: ', len(s))

'''
* 문자열 메서드 find(), rfind()
- 문자열 내부에 특정 문자를 검색하여 해당 문자의 인덱스 번호를 알려준다.
- find()는 앞에서부터 탐색하고, rfind()는 뒤에서부터 탐색한다.
'''
print('-' * 40)
print(s.find('o'))
print(s.rfind('o'))

# program이 문자열변수 s에 있다면 해당 단어의 첫번째 인덱스를 반환한다.
print(s.find('program'))
# 탐색 시 문자를 발견하지 못하면 -1을 반환한다.
print(s.find('search'))

# 메서드 count(): 문자열 내부에 찾는 단어의 출현 횟수 반환
message = """
	내가 그린 기린 그림은 목이 긴 기린그림이고
	네가 그린 기린 그림은 목이 짧은 기린그림이다.
"""

print('"기린"이라는 단어의 출현 횟수: ', message.count('기린'))

'''
- 특정 문자가 있는 인덱스 번호 및 횟수 말고 단순히 포함 여부만 빠르게 확인하고 싶다면 in 키워드를 사용한다.
'''

print('-' * 30)
print('a' in s)
print('q' in s)
print('z' not in s)
print('pro' in s)

'''
- 사용자에게 데이터를 입력 받을 때 입력값의 형태를 검사하는 메서드

1. isdecimal(): 모든 문자가 숫자 형태인지 검사
2. isalpha(): 모든 문자가 영문 알파벳인지 검사
3. islower(): 모든 문자가 영문 소문자인지 검사
4. isupper(): 모든 문자가 영문 대문자인지 검사
'''

print('-' * 30)

print('15 + 8 = ???')

while(True):
	answer = input('> ')
	
	if answer.isdecimal():
		answer = int(answer)
	else:
		print('정답은 숫자로만 입력하세요.')
		continue

	if answer == 23:
		print('정답입니다.')
		break
	else:
		print('틀렸습니다.')
		