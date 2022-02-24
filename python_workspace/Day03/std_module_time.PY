'''
* 표준 모듈 time
- time모듈은 시간 관련 기능들을 제공한다.
- 대표적인 함수는 time()으로 이 함수는 현재 시간을 1970년 1월 1일 자정을 기준으로 현재까지 경과한
 시간을 초단위로 표현한 유닉스 시간을 반환한다.
'''
import time
print(time.time())

# time 함수를 이용한 프로그램 속도 측정 테스트
start = time.time()

sum = 0
for n in range(500000):
    sum += n

end = time.time()

print(f'프로그램 실행 속도: {end-start:0.4f}초')

# time 모듈의 sleep()함수는 cpu를 지정한 시간만큼 잠재워 아무것도 하지 않고 시간을 끌게 한다.

print("아재개그 문제를 준비했습니다.")
time.sleep(3)
print("대학생이 힘이 센 이유는??")
time.sleep(15)
print("개강하니까~~~")
time.sleep(3)
print("^^;;;;;;;;;;;;;;;;;;;;;;;;")
