package com.spring.dct.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dct.cart.mapper.ICartMapper;
import com.spring.dct.vo.CartsVO;

@Service
public class CartService implements ICartService {

	@Autowired
	private ICartMapper mapper;

	@Override
	public void addCart(CartsVO vo) {
		mapper.addCart(vo);
	}

	@Override
	public void updateCartItemAmount(CartsVO vo) {
		mapper.updateCartItemAmount(vo);
	}

	@Override
	public CartsVO getCartItem(CartsVO vo) {
		return mapper.getCartItem(vo);
	}

	@Override
	public List<CartsVO> listCart(int userNo) {
		return mapper.listCart(userNo);
	}

	@Override
	public List<Map<String, Object>> getCartItemsByUserNo(int userNo) {
		return mapper.getCartItemsByUserNo(userNo);
	}

	@Override
	public List<CartsVO> getCartItemtsByCartNo(int cartNo) {
		return mapper.getCartItemtsByCartNo(cartNo);
	}

	@Override
	public void modifyCart(CartsVO vo) {
		mapper.modifyCart(vo);
	}

	@Override
	public void deleteCart(CartsVO vo) {
		mapper.deleteCart(vo);
	}

	@Override
	public void deleteAllCart(int userNo) {
		mapper.deleteAllCart(userNo);
	}

	@Override
	public int getTotalAmount(int userNo) {
		return mapper.getTotalAmount(userNo);
	}

	@Override
	public int cartCheck(int lectureNo, int userNo) {
		return mapper.cartCheck(lectureNo, userNo);
	}



}
