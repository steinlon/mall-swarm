package com.macro.mall.service.impl;

import com.macro.mall.mapper.CmsPreferenceAreaMapper;
import com.macro.mall.model.CmsPreferenceArea;
import com.macro.mall.model.CmsPreferenceAreaExample;
import com.macro.mall.service.CmsPreferenceAreaService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品优选Service实现类
 */
@Service
@AllArgsConstructor
public class CmsPreferenceAreaServiceImpl implements CmsPreferenceAreaService {

    private final CmsPreferenceAreaMapper preferenceAreaMapper;

    @Override
    public List<CmsPreferenceArea> listAll() {
        return preferenceAreaMapper.selectByExample(new CmsPreferenceAreaExample());
    }
}
