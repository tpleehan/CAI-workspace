# 모듈 내에 존재하는 변수, 함수, 클래스를 직접 임포트 하는 방법
from math import factorial, gcd

print(factorial(6))
print(factorial(5))

print(gcd(12, 18))

# 임포트할 모듈을 별칭으로 지정해서 사용하기
import statistics as st

li = [34, 55, 12, 33, 55, 66, 99]
# 별칭을 지정하지 않으면 statistics를 사용한다.
# print('평균:', statistics.mean(li)) 
# print('분산:', statistics.variance(li))
# print('표준편차:', statistics.stdev(li))

# 별칭 사용
print('평균:', st.mean(li))
print('분산:', st.variance(li))
print('표준편차:', st.stdev(li))

# 임포트와 별칭을 합쳐서 사용할 수 있다.
from math import factorial as fac

print(fac(10))
