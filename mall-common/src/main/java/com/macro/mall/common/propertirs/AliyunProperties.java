package com.macro.mall.common.propertirs;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "aliyun.oss")
public class AliyunProperties {

    private String endpoint;
    private String accessKeyId;
    private String accessKeySecret;
    private String bucketName;
    private AliyunProperties.Policy policy;
    private Integer maxSize;
    private String callback;
    private AliyunProperties.Dir dir;

    @Data
    private static class Policy {
        private Integer expire;
    }

    @Data
    private static class Dir {
        private String prefix;
    }
}
