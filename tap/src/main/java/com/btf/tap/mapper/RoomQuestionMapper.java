package com.btf.tap.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.btf.tap.vo.RoomQuestion;

@Mapper
public interface RoomQuestionMapper {
	List<RoomQuestion> selectRoomQnaList(Map<String, Object> page);
	int totalRowCount(int roomId);
}
