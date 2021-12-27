package collection.map;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class HashMapExample {

	public static void main(String[] args) {
		
		/*
		 * # Map
		 * - Key / Value가 한 세트로 이루는 자료구조
		 * - Key값을 통해 Value를 참조하는 방식
		 * - Key는 중복 저장을 허용하지 않는다.
		 */
		
		// Map은 Key, Value 쌍을 이루기 때문에 멀티 제네릭을 작성
		Map<String, String> map = new HashMap<>();
		
		// Map에 데이터를 추가하는 메서드: put(key, value)
		map.put("댕댕이", "김철수");
		map.put("냥냥이", "홍길동");
		map.put("삐약이", "박영희");
		System.out.println(map);
		
		// Map은 Key의 중복 저장을 허용하지 않는다.
		// 만약 중복 Key를 사용하여 put을 호출하면 Value만 수정된다.
		map.put("댕댕이", "김뽀삐");
		map.put("어흥이", "홍길동");
		System.out.println(map);
		
		// Map 내부에 key의 존재 유무를 확인하는 메서드: ContainsKey(key)
		System.out.println(map.containsKey("댕댕이"));
		
		// Map 내부의 값을 참조하는 법: get(key)
		String name = "어흥이";
		if (map.containsKey(name)) {
			System.out.printf("%s의 주인 이름은 %s입니다.\n", name, map.get(name));
		
		} else {
			System.out.println("찾고자 하는 동물이 없습니다.");
			
		}
		
		// Map의 크기를 확인하는 메서드: size()
		System.out.println("map의 크기: " + map.size());
		
		// Map에서 key만 추출하는 메서드: keySet()
		// 모든 key를 Set에 담아 반환한다.
		Set<String> keys = map.keySet();
		for (String k : keys) {
			System.out.println(k + " : " + map.get(k));		
			
		}
		
		// Map의 객체를 삭제: remove(key)
		// key를 주면 value도 함께 제거된다.
		map.remove("냥냥이");
		System.out.println(map);
		map.clear();
		
	}

}
 