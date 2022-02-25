# cmd -> pip install xlsxwriter
# cmd -> pip install fake_useragent 
# cmd -> pip install requests
# cmd -> pip install urllib3

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
from bs4 import BeautifulSoup
from datetime import datetime

# 엑셀처리 모듈 임포트
import xlsxwriter

# user-agent 정보를 변환해 주는 모듈 임포트
# 특정 브라우저로 크롤링을 진행할 때 차단되는 것을 방지
from fake_useragent import UserAgent

# 이미지를 바이트 변환 처리 모듈
from io import BytesIO

# 요청 헤더 정보를 꺼내올 수 있는 모듈
import urllib.request as req

d = datetime.today()

file_path = f'D:/Workspace/CAI_projects/python_workspace/crawling/알라딘 베스트셀러 1~400위(new version)_{d.year}_{d.month}_{d.day}.xlsx'

# User Agent 정보 변환 (필수 아님)
opener = req.build_opener() # 헤더 정보 초기화
opener.addheaders = [('User-agent', UserAgent().ie)]
req.install_opener(opener) # 새로운 헤더 정보를 삽입

# 엑셀 처리 선언
# Workbook 객체를 선언하여 엑셀 파일 생성(매개값으로 저장될 경로 지정)
workbook = xlsxwriter.Workbook(file_path)

# 워크 시트 생성
worksheet = workbook.add_worksheet()

# 브라우저를 실행하지 않도록 설정
chrome_option = Options()
chrome_option.add_argument('--headless')

# 브라우저 설정 - 일반 모드
browser = webdriver.Chrome('D:/Workspace/CAI_projects/python_workspace/chromedriver.exe')

# 브라우저 설정 - headless 모드
# browser = webdriver.Chrome('C:/Users/admin/Desktop/CAI-workspace/python_workspace/chromedriver.exe', options=chrome_option)

# 브라우저 사이즈 조정
browser.set_window_size(800, 600)

# 브라우저 내부 대기
# time.sleep(10) -> 브라우저 로딩에 상관 없이 무조건 10초 대기

# 웹 페이지 전체가 로딩될 때 까지 대기 후 남은시간 무시
browser.implicitly_wait(10)

# 페이지 이동 (베스트셀러 페이지)
browser.get('https://www.aladin.co.kr/shop/common/wbest.aspx?BranchType=1')

# 엑셀에 텍스트 저장
cell_format = workbook.add_format({'bold':True, 'font_color':'red', 'bg_color':'yellow'})
worksheet.write('A1', '썸네일', cell_format)
worksheet.write('B1', '제목', cell_format)
worksheet.write('C1', '작가', cell_format)
worksheet.write('D1', '출판사', cell_format)
worksheet.write('E1', '출판일', cell_format)
worksheet.write('F1', '가격', cell_format)
worksheet.write('G1', '링크', cell_format)

while True:
	# bs4 초기화
	soup = BeautifulSoup(browser.page_source, 'html.parser')

	div_ss_book_box_list = soup.find_all('div', class_='ss_book_box')


	for div_ss_book_box in div_ss_book_box_list:
		
		# 이미지
		img_url = div_ss_book_box.select_one('table div > a > img.i_cover') # 여러개를 가져 오려면 .select
		print(img_url)
