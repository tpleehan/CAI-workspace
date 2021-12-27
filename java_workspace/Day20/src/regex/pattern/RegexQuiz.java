package regex.pattern;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexQuiz {

	public static void main(String[] args) {

		String str = "헠4,500원 힣~ 1,200원엌? 6000원윀 120000원";
		
		/*
		 * - 가격 형식만 찾아서 순서대로 출력
		 *  ex)
		 *  	4,500원 ... 
		 *  *: 0회 이상 반복
		 *  	있어도 되고 없어도 되는 경우
		 */
		
		String pattern = "\\d원*";
		
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(str);
		
		while(m.find()) {
			System.out.printf(m.group());
		}
		
		/*
		String pattern = "\\d+,*[0-9]+원";
		
		Matcher m = Pattern.compile(pattern).matcher(str);
		
		while(m.find()) {
			System.out.println(m.group());
		}
		 */
	}

}
