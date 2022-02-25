# points.txt 파일의 숫자값을 모두 읽어서 총합과 평균을 구한 뒤 총점, 평균값을 result.txt라는 파일에 작성되는 프로그램 작성
import traceback as trace

file_path = 'C:/test/points.txt'

try:
    f = open(file_path, 'r')
    numlist = f.readline().split()
    print('파일 읽어오기: ', numlist)
except:
    print('파일 로드 실패')
    print(trace.format_exc())
finally:
    f.close

total = 0

for num in numlist:
    score = int(num)
    total += score

avg = total/len(numlist)

print(f'총점: {total}')
print(f'평균: {avg:0.2f}')


try:
    f = open('C:/test/result.txt', 'w')

    data = f'총점: {total}점, 평균: {avg:0.2f}점'

    f.write(data)
    print('파일 저장 완료')

except:
    print('파일 저장 실패')
    print(trace.format_exc()) # 자바의 e.printStackTrace()와 비슷한 기능
finally:
    f.close()
