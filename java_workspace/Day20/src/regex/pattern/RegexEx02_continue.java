package regex.pattern;

import java.util.regex.Pattern;

public class RegexEx02_continue {

	public static void main(String[] args) {
		
		//[]: 해당 위치의 한 글자에 어떤 문자들이 올 수 있는지 정의
		System.out.println(Pattern.matches("s[lh]eep", "sleep"));
		System.out.println(Pattern.matches("s[lh]eep", "sweep"));
		
		/*
		 * # [] 안에 정의할 수 있는 것
		 * 1. [abc]: a, b, c 중 하나만 허용
		 * 2. [^abc]: a, b, c를 제외한 모두를 허용
		 * 3. [a-z]: a부터 z까지 허용
		 *    [a-zA-Z가-힣]: 영문 소문자, 대문자, 한글을 허용
		 * 4. [0-9]: 숫자만 허용
		 * 5. &&: 교집합 (좌항과 우항 패턴을 모두 만족하는 문자)
		 */
		
		System.out.println(Pattern.matches("s[^1-9]eep", "s0eep"));
		System.out.println(Pattern.matches("s[a-zA-Z]eep", "sLeep"));
		System.out.println(Pattern.matches("s[a-dm-z]eep", "sleep"));
		System.out.println(Pattern.matches("s[a-d&&c-f]eep", "sceep"));
		
		/*
		 * # 해당 패턴이 적용될 문자의 개수를 정의하는 법 (공백은 허용하지 않는다.)
		 * 1. Ex{n}: 앞에 있는 패턴이 n글자 일치해야 한다.
		 * 2. Ex{n,m}: 최소 n글자 최대 m글자가 일치해야 한다.
		 * 3. Ex{n,}: 최소 n글자 일치해야 한다. (최대는 제한이 없다)
		 * 4. Ex?: 0번 혹은 한번
		 * 5. Ex+: 최소 한번 이상
		 * 6. Ex*: 0번 혹은 여러 번
		 */
		
		System.out.println(Pattern.matches("....[\\d]{3}", "abcd123"));
		System.out.println(Pattern.matches("[\\w가-힣]{2,12}", "abcd안녕하세요123456"));
		
		String email = "abc@github.io";
		System.out.println(Pattern.matches("[\\w]+@[a-zA-z0-9]+[.][a-zA-Z]+", email));
		
		/*
		 * Pattern.matches(regex, str)
		 * - 전달한 문자열이 정규표현식과 일치하면 일치하면 true. 일치하지 않으면 false
		 * 
		 * Matcher
		 * - 문자열을 처음부터 끝까지 검사해서 해당 정규표현식과 일치하는 인덱스를 찾을 결과를 가지고 있는 객체
		 */
		
	}

}
