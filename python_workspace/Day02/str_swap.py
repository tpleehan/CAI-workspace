'''
* 문자열 알파벳 형태 변경 메서드
1. lower(): 영문 알파벳을 모두 소문자로 변경
2. upper(): 영문 알파벳을 모두 대문자로 변경
3. swapcase(): 영문 대소문자를 각각 반대로 변경
4. capitalize(): 문장의 맨 첫 글자만 대문자, 나머지는 소문자로 변경
5. title(): 각 단어의 맨 첫 글자만 대문자, 나머지는 소문자로 변경
'''

s = 'GOOD MORnig, toDAY\'s WEATher is COld.'

print(s)
print(s.lower())
print(s.upper())
print(s.swapcase())
print(s.capitalize())
print(s.title())
