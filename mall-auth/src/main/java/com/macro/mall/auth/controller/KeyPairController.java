package com.macro.mall.auth.controller;

import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import io.swagger.annotations.Api;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.KeyPair;
import java.security.interfaces.RSAPublicKey;
import java.util.Map;

/**
 * 获取RSA公钥接口
 */
@RestController
@AllArgsConstructor
@Api(tags = "KeyPairController", description = "获取RSA公钥接口")
@RequestMapping("/rsa")
public class KeyPairController {

    private final KeyPair keyPair;

    @GetMapping("/publicKey")
    public Map<String, Object> getKey() {
        final RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();
        final RSAKey key = new RSAKey.Builder(publicKey).build();
        return new JWKSet(key).toJSONObject();
    }

}
