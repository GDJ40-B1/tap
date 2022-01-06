package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.Favorites;

@Mapper
public interface FavoritesMapper {
	int insertFavorites(Map<String, Object> paramMap);				// 회원 즐겨찾기 등록
	int selectFavorites(Favorites favorites);						// 회원 특정 페이지 즐겨찾기 등록 여부 조회
	int deleteFavorites(Map<String, Object> paramMap);				// 회원 즐겨찾기 삭제
	List<Favorites> selectFavoritesList(String memberId);			// 회원 즐겨찾기 조회
	int favTotalRowCount(String memberId);							// 즐겨찾기 페이지 체크
}
