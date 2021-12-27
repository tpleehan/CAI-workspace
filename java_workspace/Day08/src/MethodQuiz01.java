import java.util.Arrays;

public class MethodQuiz01 {

	//Q1.
	static void method1() {
		System.out.println("안녕");
	}
	
	//Q2.
	static String method2(String str){
		return str;
	}
	
	//Q3.
	static double method3 (int n1, int n2, double d){
		return n1 + n2 + d;
	}
	
	//Q4.
	static String method4 (int i) {
		
		if(i % 2 == 0) {
			return "짝수";
		} else {
			return "홀수";
		}
	}
	
	//Q5.
	static void method5 (String s, int i) {

		for(int j = 1; j <= i; j++) {
			System.out.println(s);
		}
	}
	
	//Q6.
	static int maxNum (int i, int j) {
		
		if(i > j) {
			return i;
		} else {
			return j;
		}
//		return i > j ? i : j; //삼항 연산자
	}
	
	//Q7.
	static int abs (int i) {
		
		return i > 0 ? i : -i;
	}
	
	//Q8.
	static int method6 (int i) {
		
		int total = 0;
		for(int j = 0; j <= i; j++) {
			total += j;
		}
		return total;
	}
	
	//Q9.
	static int method7 (int[] arr) {
		
		return arr.length;
	}
	
	//Q10.
	static String[] method8 (String s1, String s2) {
		
		return new String[] {s1, s2}; 
	}
	//Q11.
	static String java (int i) {
		String str = "";

		for(int j = 1; j <= i; j++) {
			if(j % 2 != 0) {
				str += "자"; //홀수
			} else {
				str += "바"; //짝수
			}
//			str += (j % 2 != 0 ? "자" : "바"); //삼항 연산자
		}
		
		//배열로 넣어서 문자열에 들어 있는 값을 
		//하나씩 대입하려고 했지만 배열은 답이 아니었다. 
//		String[] arr = new String[str.length()];
//		for(int j = 0; j < arr.length; j++) {
//			arr[j] = str;
//		}
		return str;
	}
	
	public static void main(String[] args) {
		
		//Q1.
		method1();
		
		//Q2.
		System.out.println(method2("안녕하세요."));
		
		//Q3.
		System.out.println(method3(3, 4, 3.14));
		
		//Q4.
		System.out.println(method4(23));
		
		//Q5.
		method5("반복", 3);
		
		//Q6.
		System.out.println(maxNum(43, 96));
		
		//Q7.
		System.out.println(abs(-43));
		
		//Q8.
		System.out.println(method6(100));
		
		//Q9.
		System.out.println("배열의 길이: " + method7(new int[] {1, 2, 3, 4, 5}));
		
		//Q10.
		System.out.println(Arrays.toString(method8("자바", "java")));
		
		//Q11.
		String str = java(5);
		System.out.println(str);
		System.out.println(java(9));
	}

}
