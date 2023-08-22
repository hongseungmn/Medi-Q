package com.kosmo.springapp.service;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SearchPhotoMapper {
	@Select("SELECT no FROM foodtable WHERE productname = #{searchPhotoName}")
	String findNoByName(@Param("searchPhotoName") String searchPhotoName);
}