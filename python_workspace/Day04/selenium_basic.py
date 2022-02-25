# selenium: 웹 자동화 및 웹의 소스코드를 수집하는 모듈
# cmd -> pip install selenium (selenium 라이브러리 다운로드)
# 셀레늄 임포트
from selenium import webdriver
import time

'''
# chrome web driver 다운을 받는다
- 크롬 설정에서 크롬 버전을 확인해서 해당 버전과 동일한 파일 다운로드
ex)
	크롬 설정 - chrome 정보에서 버전 확인
	https://chromedriver.chromium.org/downloads

- 다운 받은 후 사용할 경로에 압축을 푼다. (실행 파일)
'''

# 다운로드 받은 크롬 물리 드라이버 가동 명령
driver = webdriver.Chrome('D:/Workspace/CAI_projects/python_workspace/chromedriver.exe')

# 물리 드라이버로 사이트 이동 명령
driver.get('https://www.naver.com')

time.sleep(1)

'''
# 자동으로 버튼이나 링크 클릭 제어
login_btn = driver.find_element_by_xpath('//*[@id="account"]/a')
login_btn.click()

time.sleep(1.5)

# 자동 텍스트 입력
id_input = driver.find_element_by_xpath('//*[@id="id"]')
id_input.send_keys('abc1234')

time.sleep(1)

pw_input = driver.find_element_by_xpath('//*[@id="pw"]')
pw_input.send_keys('abc1234')

time.sleep(1)

driver.find_element_by_xpath('//*[@id="log.login"]').click()
'''

# 네이버에 접속해서 검색창에 '오늘 날씨'를 입력하고 검색 버튼을 누르고 가장 첫 번째로 뜨는 네이버 뉴스를 띄운다.

driver.find_element_by_xpath('//*[@id="query"]').send_keys('오늘 날씨')
time.sleep(1)

driver.find_element_by_xpath('//*[@id="search_btn"]').click()
time.sleep(1)

driver.find_element_by_xpath('//*[@id="sp_nws_all4"]/div[1]/div/a').click()
