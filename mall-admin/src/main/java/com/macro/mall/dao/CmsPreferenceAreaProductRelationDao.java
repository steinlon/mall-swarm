package com.macro.mall.dao;

import com.macro.mall.model.CmsPreferenceAreaProductRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 自定义优选和商品关系操作Dao
 */
public interface CmsPreferenceAreaProductRelationDao {
    /**
     * 批量创建
     */
    int insertList(@Param("list") List<CmsPreferenceAreaProductRelation> preferenceAreaProductRelationList);
}
