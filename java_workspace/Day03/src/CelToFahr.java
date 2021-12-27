import java.util.Scanner;

public class CelToFahr {

	public static void main(String[] args) {
		
		/*
		 사용자에게 섭씨 온도를 입력 받아서
		 화씨 온도로 변환하여 출력하는 로직을 작성하라.
		 화씨 온도는 소수점 첫째 자리까지 표현하라.
		 섭씨 온도 특수문자 표기 : ㄹ 한자 7 (℃)
		 화씨 온도 특수문자 표기 : ㄹ 한자 다음장 4 -> (℉)
		 */
	
		Scanner sc = new Scanner(System.in);
		System.out.print("섭씨 온도를 입력하세요(℃): ");

		int celsius = sc.nextInt(); // 섭씨
		double fahrenheit = celsius * 1.8 + 32; // 화씨
//		double fahrenheit = (double) celsius * 9 / 5 + 32; // 화씨
		
		System.out.println("섭씨 온도는 " + celsius + " ℃ 입니다.");
		System.out.println("화씨 온도는 " + fahrenheit + " ℉ 입니다.");
		System.out.printf("입력한 섭씨: %d℃\n", celsius);
		System.out.printf("변환된 화씨: %.1f℉\n", fahrenheit);
		
		sc.close();
		
	}

}
