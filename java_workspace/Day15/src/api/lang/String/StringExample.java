package api.lang.String;

import java.util.Arrays;

public class StringExample {
	
	public static void main(String[] args) {

		String str = "Hello Java";
		
		// chartAt(인덱스) -> 해당 인덱스의 단일 문자를 리턴
		char c = str.charAt(4);
		System.out.println("4번 인덱스의 문자: " + c);
		
		// substring(인덱스) -> 문자열의 특정 범위의 문자를 추출
		String s2 = str.substring(6); // 6번 인덱스부터 끝까지 추출
		System.out.println(s2);
		
		// 0번부터 5번 미만까지 추출(끝값을 미만으로 처리함)
		System.out.println(str.substring(0, 5));
		
		// length(): 문자열의 총 길이 리턴
		System.out.println("str의 총 문자 개수: " + str.length());
		
		// indexOf(문자열): 특정 단어의 인덱스르 리턴
		// 단어를 검색하면 해당 단어의 첫글자 인덱스를 리턴
		// 찾는 단어가 없다면 -1을 리턴
		int idx = str.indexOf("o");
		System.out.println("o의 인덱스: " + idx);
		
		idx = str.indexOf("Java");
		System.out.println("Java의 인덱스: " + idx);
		
		idx = str.indexOf("안녕");
		System.out.println(idx);
		
		// toLowerCase(), toUpperCase()
		String s3 = "Hello JAVA WOrlD";
		System.out.println(s3.toLowerCase());
		System.out.println(s3.toUpperCase());
		
		// trim(): 문자열의 앞, 뒤 공백을 제거
		String name = "     		  홍길동			   ";
		System.out.println(name.trim() + "님 안녕하세요.");
		
		// replace(old, new)
		// 기존 문자열 내부의 old문자값을 모두 찾아 new 문자열로 일괄 변경
		String java = "자바 언어를 배우고 있습니다. 자바 심볼은 커피로 사용하고 있습니다.";
		System.out.println(java.replace("자바", "Java"));
		System.out.println(java.replace("습니", ""));
		
		// valueOf: 기본 타입을 문자열로 변경 (static)
		System.out.println(3 + 4);
		System.out.println(String.valueOf(3) + String.valueOf(4));
		
		// split: 문자열을 구분자로 구분하여 분할
		// 분할한 문자들을 String 배열에 담아서 리턴
		String phone = "010-1234-5678";
		String[] numbers = phone.split("-");
		System.out.println(Arrays.toString(numbers));
		
		String pet = "멍멍이, 야옹이, 삐약이";
		String[] pets = pet.split(", ");
		System.out.println(Arrays.toString(pets));
		
	}

}
