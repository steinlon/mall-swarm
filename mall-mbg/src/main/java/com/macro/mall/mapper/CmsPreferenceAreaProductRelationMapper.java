package com.macro.mall.mapper;

import com.macro.mall.model.CmsPreferenceAreaProductRelation;
import com.macro.mall.model.CmsPreferenceAreaProductRelationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CmsPreferenceAreaProductRelationMapper {
    long countByExample(CmsPreferenceAreaProductRelationExample example);

    int deleteByExample(CmsPreferenceAreaProductRelationExample example);

    int deleteByPrimaryKey(Long id);

    int insert(CmsPreferenceAreaProductRelation record);

    int insertSelective(CmsPreferenceAreaProductRelation record);

    List<CmsPreferenceAreaProductRelation> selectByExample(CmsPreferenceAreaProductRelationExample example);

    CmsPreferenceAreaProductRelation selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") CmsPreferenceAreaProductRelation record, @Param("example") CmsPreferenceAreaProductRelationExample example);

    int updateByExample(@Param("record") CmsPreferenceAreaProductRelation record, @Param("example") CmsPreferenceAreaProductRelationExample example);

    int updateByPrimaryKeySelective(CmsPreferenceAreaProductRelation record);

    int updateByPrimaryKey(CmsPreferenceAreaProductRelation record);
}