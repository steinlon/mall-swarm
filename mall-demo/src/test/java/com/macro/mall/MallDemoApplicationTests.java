package com.macro.mall;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.macro.mall.model.PmsProduct;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import static org.junit.jupiter.api.Assertions.assertNotNull;

@Slf4j
@SpringBootTest
public class MallDemoApplicationTests {

    @Autowired
    private ApplicationContext applicationContext;

    @Test
    public void contextLoads() {
        assertNotNull(applicationContext);
    }

    @Test
    public void testLogStash() throws Exception {
        final ObjectMapper mapper = new ObjectMapper();
        final PmsProduct product = new PmsProduct();
        product.setId(1L);
        product.setName("小米手机");
        product.setBrandName("小米");
        log.info(mapper.writeValueAsString(product));
        log.error(mapper.writeValueAsString(product));
    }

}
