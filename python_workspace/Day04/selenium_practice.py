'''
네이버로 접속해서 뉴스스탠드 쪽에 있는 파란색 '뉴스홈' 링크를 클릭

상단에 있는 메뉴 중 정치, 경제, 사회, 생활/문화, IT/과학, 세계
탭을 돌아다니면서 헤드라인 뉴스 4개씩 클릭한다.
뒤로가기는 driver.back() 메서드로 뒤로가기가 가능하다.

XPATH를 확인해 보면 규칙을 발견할 수 있는데
반복문 이용해서 클릭 명령을 내려 주면 된다.
24개의 명령을 일일히 쓰는게 아니라 규칙을 발견해서 로직 작성
'''
from selenium import webdriver
import time

driver = webdriver.Chrome('D:/Workspace/CAI_projects/python_workspace/chromedriver.exe')

driver.get('https://www.naver.com')

time.sleep(1)

# 뉴스홈 클릭
driver.find_element_by_xpath('//*[@id="NM_NEWSSTAND_HEADER"]/div[2]/a[1]').click()
time.sleep(1)

# 카테고리 정치탭 클릭
driver.find_element_by_xpath('/html/body/section/header/div[2]/div/div/div[1]/div/div/ul/li[2]/a/span').click()
time.sleep(1)

for x in range(3, 9):

	for n in range(1, 5):
		if x > 3: # 현재 탭이 정치탭이 아닌경우
			i = 2
		else: # 현재 탭이 정치탭인 경우
			i = 1

		try:
			news_head = f'//*[@id="main_content"]/div/div[2]/div[1]/div[{n}]/div[{i}]/ul/li[1]/div[2]/a'
			driver.find_element_by_xpath(news_head).click()
			
		except:
			try:
				news_head = f'//*[@id="main_content"]/div/div[2]/div[1]/div[{n}]/div[{i}]/ul/li[1]/div/a'
				driver.find_element_by_xpath(news_head).click()
			
			except:
				news_head = f'//*[@id="main_content"]/div/div[{n}]/div/div[2]/ul/li[1]/div/a'
				driver.find_element_by_xpath(news_head).click()

		time.sleep(0.7)
		driver.back()
		time.sleep(0.5)

	# 다른 분야 탭 누르면 동작(카테고리)
	news_tab = f'//*[@id="lnb"]/ul/li[{x}]/a/span'
	driver.find_element_by_xpath(news_tab).click()
	time.sleep(0.5)