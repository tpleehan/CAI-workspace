package api.util.arrays;

import java.util.Arrays;

public class ArraysExample {

	public static void main(String[] args) {
		
		// 배열의 복사
		char[] arr = {'J', 'A', 'V', 'A'};
		char[] arr2 = Arrays.copyOf(arr, 4);
//		char[] arr2 = Arrays.copyOf(arr, arr.length);
		// copyOfRange(복사할 배열, 시작할 인덱스, 끝 인덱스(미만))
		char[] arr3 = Arrays.copyOfRange(arr, 1, 4);
		
		System.out.println(Arrays.toString(arr));
		System.out.println(Arrays.toString(arr2));
		System.out.println(Arrays.toString(arr3));
		
		// 배열의 탐색: binarySearch(배열, 검색할 값)
		// 반드시 정렬이 선행되어야 한다. 정렬이 안된 경우 판단하기 어렵다.
		
		int[] numbers = {1, 3, 5, 7, 9, 11, 13};
		System.out.println("5의 위치: " + Arrays.binarySearch(numbers, 5));
		
		// 배열의 정렬
		int[] nums = {41, 11, 35, 88, 34, 100};
		Arrays.sort(nums);
		System.out.println(Arrays.toString(nums));
		
		// 배열의 내부 요소가 동일한지 여부를 확인
		System.out.println(Arrays.equals(arr, arr3));
		
	}

}