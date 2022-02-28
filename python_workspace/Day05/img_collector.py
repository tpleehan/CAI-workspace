
print('# 최초 실행 시 약간의 로딩이 발생할 수 있으니 잠시만 기다려주세요. (최대 1분)')
print('# 인터넷 연결이 되어 있어야 합니다.')

# 운영체제에서 제공되는 여러 기능 (폴더 생성)
import os
from selenium import webdriver
from bs4 import BeautifulSoup
import urllib.parse as rep
import urllib.request as req
import time as t
from fake_useragent import UserAgent

opener = req.build_opener() # 헤더 정보 초기화
opener.addheaders = [('User-agent', UserAgent().ie)]
req.install_opener(opener)

# Daum 페이지 이미지 기본 URL
base = 'https://search.daum.net/search?w=img&nil_search=btn&DA=NTB&enc=utf8&q='

print('### 검색어를 입력하시면 해당 검색어에 맞는 이미지를 다운로드 받습니다.')
print('### 이미지 자료는 DAUM 검색 자료를 활용하고, 개수는 첫 페이지 기준으로 80개의 이미지를 가져옵니다.')
print('### 다운받은 이미지는 C드라이브 imagedown 폴더에 자동 저장됩니다.')

# 검색어
s = input('### 검색어 입력: ')

# 모든 브라우저에서 모든 서버에게 정확한 요청을 전달하기 위해 URL Encoding이 필요하다
# URL에서 아스키 코드를 이용한 문자만 전달이 가능하기 때문에 타 언어로 작성된 문자를 변환해서 전달해야 한다.
quote = rep.quote_plus(s)

url = base + quote
print(url)

# 저장 경로 폴더 만들기
save_path = 'C:/imagedown/'

# 폴더 생성 (예외 처리)
try:
	# 기존 폴더 확인 체크
	if not os.path.isdir(save_path):
		# 폴더가 없으면 생성
		os.mkdir(save_path)
except OSError as e:
	print('폴더 생성 실패')
	print('폴더 이름:', e.filename)

browser = webdriver.Chrome('D:/Workspace/CAI_projects/python_workspace/chromedriver.exe')
browser.get(url)

browser.implicitly_wait(5)

src = browser.page_source

soup = BeautifulSoup(src, 'html.parser')

img_list = soup.select('div.wrap_thumb > a.link_thumb > img')
# print(img_list)

for i, img in enumerate(img_list, 1):
	# print(img, i)

	# 저장 파일명 및 경로
	full_file_name = os.path.join(save_path, save_path + str(i) + '.png')

	# 파일명
	print(full_file_name)

	# 다운로드 요청
	req.urlretrieve(img['data-src'], full_file_name)

# 다운 완료
print('download success')

# 다운로드 완료 후 지정한 폴더를 자동으로 열어준다.
path = os.path.realpath(save_path)
os.startfile(path)

print('5초 뒤 자동 종료됩니다.')
t.sleep(5)
browser.close()


'''
# 라이브러리 설치
cmd -> pip install pyinstaller

# 변환할 파일 폴더 이동
cd D:/Workspace/CAI_projects/python_workspace/Day05/

# 변환할 파일 선택
pyinstaller img_collector.py

-------------------------------------

# 파일 하나로 만들기
pyinstaller --onefile img_collector.py
'''