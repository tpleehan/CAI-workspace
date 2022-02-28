from selenium import webdriver
import time
from bs4 import BeautifulSoup
import codecs
from datetime import datetime

d = datetime.today()

file_path = f'D:/Workspace/CAI_projects/python_workspace/crawling/교보 베스트셀러 1~20위_{d.year}_{d.month}_{d.day}.html'

with codecs.open(file_path, mode='w', encoding='utf-8') as f:
	driver = webdriver.Chrome('D:/Workspace/CAI_projects/python_workspace/chromedriver.exe')
	driver.get('http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?orderClick=d79')
	
	time.sleep(1)
	
	src = driver.page_source

	soup = BeautifulSoup(src, 'html.parser')

	title_list = soup.findAll('div', class_='title')
	# print(len(title_list))

	rank = 1

	f.write('<!DOCTYPE HTML> \r\n')
	f.write('<html> \r\n')
	f.write('<head> \r\n')
	f.write('<meta charset="UTF-8"> \r\n')
	f.write('<title>교보문고 베스트셀러 1~20위 \r\n')
	f.write('</title> \r\n')
	f.write("</head> \r\n")
	f.write('<body> \r\n')
	
	for idx in range(len(title_list)):
		if idx > 31:
			f.write('<p style = "font-size:20px"> \r\n')
			f.write(f'<b>순위: {rank}위</b> <br> \r\n')
			a_url = str(title_list[idx].find('a'))
			f.write(a_url + '\n <hr> \n')
			rank += 1
			f.write('</p>')

	f.write("</body> \r\n")
	f.write("</html>")
		
	driver.close()
	
