# points.txt 파일의 숫자값을 모두 읽어서 총합과 평균을 구한 뒤 총점, 평균값을 result.txt라는 파일에 작성되는 프로그램 작성

file_path = 'C:/test/points.txt'

try:
    f = open(file_path, 'r')
    text = f.readline().split()
    print('파일 읽어오기: ', text)
except:
    print('파일 로드 실패')
finally:
    f.close

total = 0
cnt = 0

for t in text:
    # print(t)
    total += int(t)
    cnt += 1

avg = sum/cnt

print(f'총점: {total}')
print(f'평균: {avg:0.2f}')


try:
    result_path = 'C:/test/result.txt'

    re = open(result_path, 'w')

    result = f'총점: {total} \n평균: {avg:0.2f}'

    re.write(result)
    print('파일 저장 완료')

except:
    print('파일 저장 실패')
finally:
    re.close()
