package com.macro.mall.service.impl;

import com.macro.mall.mapper.CmsPreferenceAreaMapper;
import com.macro.mall.model.CmsPreferenceArea;
import com.macro.mall.model.CmsPreferenceAreaExample;
import com.macro.mall.service.CmsPreferenceAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商品优选Service实现类
 * Created by macro on 2018/6/1.
 */
@Service
public class CmsPreferenceAreaServiceImpl implements CmsPreferenceAreaService {
    
    @Autowired
    private CmsPreferenceAreaMapper preferenceAreaMapper;

    @Override
    public List<CmsPreferenceArea> listAll() {
        return preferenceAreaMapper.selectByExample(new CmsPreferenceAreaExample());
    }
}
