package com.spring.dct.cart.mapper;

import java.util.List;
import java.util.Map;

import com.spring.dct.vo.CartsVO;

public interface ICartMapper {
	
	// 장바구니 추가
	void addCart(CartsVO vo);
	
	// 장바구니 수량 변경 (장바구니는 여러 상품이 들어갈 수 있기 때문에)
	void updateCartItemAmount(CartsVO vo);
	
	// 장바구니에 담긴 강의 찾기 (사용자 + 강의)
	CartsVO getCartItem(CartsVO vo); 
	
	// 장바구니 목록 얻어오기
	List<CartsVO> listCart(int userNo);
	
	// 장바구니에 담긴 상품 찾기 (사용자)
	List<Map<String, Object>> getCartItemsByUserNo(int userNo);
	
	// 장바구니에 담긴 상품 찾기 (장바구니 번호)
	List<CartsVO> getCartItemtsByCartNo(int cartNo);
	
	// 장바구니 수정
	void modifyCart(CartsVO vo);
	
	// 장바구니 삭제
	void deleteCart(CartsVO vo);
	
	// 장바구니 전체 삭제
	void deleteAllCart(int userNo);
	
	// 장바구니 전체금액
	int getTotalAmount(int userNo);
	
	// 장바구니 동일한 상품 중복 확인
	int cartCheck(int lectureNo, int userNo);

}
