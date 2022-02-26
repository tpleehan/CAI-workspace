'''
* 식별자 (identifier)

1. 식별자: 사용자 정의로 데이터에 이름을 붙인 것 
2. 모듈, 패키지, 변수, 함수, 클래스 등의 이름을 식별자라고 한다.
3. 식별자 이름은 중복해서 지정할 수 없다.
'''

# 식별자 이름을 숫자로 지정하거나 숫자로 시작하면 안된다.
# 7 = 777 (x)
# 7number = 7 (x)
number7 = 7
num7ber = 7

# 식별자 이름에 공백을 포함하면 안된다.
# my birth day = 20220222 (x)
my_birth_day = 20220222

# 키워드를 식별자로 지정할 수 없다. (if, while, for ... 등)
# if = '만약에' (x)
If = '만약에' # 사용 할 수 있지만 좋은 방법은 아니다.

# print()와 같은 내장함수의 이름을 식별자로 사용할 수 있다.
# 하지만 함수의 기능을 사용할 수 없다.
# print = '출력하다'
# print(print)

# 한글, 한자 등 영어 이외의 문자로 사용할 수 있다.
# 하지만 사용을 권장하지 않는다.
야옹이 = '고양이' # 권장하지 않는다.
print(야옹이)