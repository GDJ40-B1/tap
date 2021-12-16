package com.btf.tap.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.btf.tap.mapper.HashtagMapper;
import com.btf.tap.vo.Hashtag;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class HashtagService {
	@Autowired HashtagMapper hashtagMapper;
	
	// 특정 타겟의 해시태그 수정
	public void modifyHashtag(String hashtag, String hashtagTargetCategory, int hashtagTarget) {
		// 수정의 경우 기존 해시태그 데이터를 삭제 후 다시 삽입하는 방식이 가장 효율적
		removeHashtag(hashtagTargetCategory, hashtagTarget);
		addHashtag(hashtag, hashtagTargetCategory, hashtagTarget);
	}
	
	// 특정 타겟의 해시태그를 모두 삭제
	public void removeHashtag(String hashtagTargetCategory, int hashtagTarget) {
		Map<String, Object> hashtagElement = new HashMap<>();
		hashtagElement.put("hashtagTargetCategory", hashtagTargetCategory);
		hashtagElement.put("hashtagTarget", hashtagTarget);
		hashtagMapper.deleteHashtag(hashtagElement);
	}
	
	// 특정 타겟의 해시태그 합쳐서 추출
	public String getHashtag(String hashtagTargetCategory, int hashtagTarget) {
		// 해시태그 추출을 위한 target 요소
		Map<String, Object> hashtagElement = new HashMap<>();
		hashtagElement.put("hashtagTargetCategory", hashtagTargetCategory);
		hashtagElement.put("hashtagTarget", hashtagTarget);
		List<String> hashtagList = hashtagMapper.selecthashtagList(hashtagElement);
		String hashtag = "";
		for(String h : hashtagList) {
			hashtag += " #" + h;
		}
		
		// 해시태그가 비어있지 않는다면, 맨 앞의 공백을 제거한다.
		if(!hashtag.equals("") && !hashtag.equals(" ")) {
			hashtag = hashtag.substring(1);
		} else {
			hashtag = "#";
		}
		
		return hashtag;
	}
	
	// 해시태그 생성 (해시태그 여러개가 #포함으로 달린 문자열을 받기)
	public void addHashtag(String hashtag, String hashtagTargetCategory, int hashtagTarget) {
		/* 해시태그 데이터 추가 시작 */
		// 문자열 공백 제거
		hashtag = hashtag.replaceAll(" ", "");
		String[] hashtagList = hashtag.split("#");
		Arrays.sort(hashtagList); // 중복된 해시태그 제거
		
		// 해시태그 값 넣기
		Hashtag hashtagVal = new Hashtag();
		hashtagVal.setHashtagTargetCategory(hashtagTargetCategory);
		hashtagVal.setHashtagTarget(hashtagTarget);
		for(String h : hashtagList) {
			// 해시태그 값이 공백이 아닐 경우에만 추가되도록 한다.
			if(!h.equals("") && !h.equals(" ")) {
				hashtagVal.setHashtagName(h);
				hashtagMapper.insertHashtag(hashtagVal);
			}
		}
		/* 해시태그 데이터 추가 끝 */
	}
}
