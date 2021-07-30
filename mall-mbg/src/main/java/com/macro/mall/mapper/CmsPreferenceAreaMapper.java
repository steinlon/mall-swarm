package com.macro.mall.mapper;

import com.macro.mall.model.CmsPreferenceArea;
import com.macro.mall.model.CmsPreferenceAreaExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CmsPreferenceAreaMapper {

    long countByExample(CmsPreferenceAreaExample example);

    int deleteByExample(CmsPreferenceAreaExample example);

    int deleteByPrimaryKey(Long id);

    int insert(CmsPreferenceArea record);

    int insertSelective(CmsPreferenceArea record);

    List<CmsPreferenceArea> selectByExampleWithBLOBs(CmsPreferenceAreaExample example);

    List<CmsPreferenceArea> selectByExample(CmsPreferenceAreaExample example);

    CmsPreferenceArea selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") CmsPreferenceArea record, @Param("example") CmsPreferenceAreaExample example);

    int updateByExampleWithBLOBs(@Param("record") CmsPreferenceArea record, @Param("example") CmsPreferenceAreaExample example);

    int updateByExample(@Param("record") CmsPreferenceArea record, @Param("example") CmsPreferenceAreaExample example);

    int updateByPrimaryKeySelective(CmsPreferenceArea record);

    int updateByPrimaryKeyWithBLOBs(CmsPreferenceArea record);

    int updateByPrimaryKey(CmsPreferenceArea record);
}