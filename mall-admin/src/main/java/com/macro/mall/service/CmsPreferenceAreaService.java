package com.macro.mall.service;

import com.macro.mall.model.CmsPreferenceArea;

import java.util.List;

/**
 * 优选专区Service
 */
public interface CmsPreferenceAreaService {
    /**
     * 获取所有优选专区
     */
    List<CmsPreferenceArea> listAll();
}
