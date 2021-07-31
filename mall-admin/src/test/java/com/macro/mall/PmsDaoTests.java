package com.macro.mall;


import cn.hutool.json.JSONUtil;
import com.macro.mall.dao.PmsMemberPriceDao;
import com.macro.mall.dao.PmsProductDao;
import com.macro.mall.dto.PmsProductResult;
import com.macro.mall.model.PmsMemberPrice;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class PmsDaoTests {

    @Autowired
    private PmsMemberPriceDao memberPriceDao;
    @Autowired
    private PmsProductDao productDao;

    private static final Logger LOGGER = LoggerFactory.getLogger(PmsDaoTests.class);

    @Test
    @Transactional
    @Rollback
    public void insertPriceBatch() {
        final List<PmsMemberPrice> list = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            final PmsMemberPrice memberPrice = new PmsMemberPrice();
            memberPrice.setProductId(1L);
            memberPrice.setMemberLevelId((long) (i + 1));
            memberPrice.setMemberPrice(new BigDecimal("22"));
            list.add(memberPrice);
        }
        final int count = memberPriceDao.insertList(list);
        Assertions.assertEquals(5, count);
    }

    @Test
    public void getProductUpdateInfo() {
        final PmsProductResult productResult = productDao.getUpdateInfo(7L);
        final String json = JSONUtil.parse(productResult).toString();
        LOGGER.info(json);
    }
}
