package com.macro.mall.common.constant;

import com.macro.mall.common.propertirs.SystemProperties;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;

import java.util.List;

public interface SystemController {

    SystemProperties getProfile();

    DiscoveryClient getDiscoveryClient();

    List<ServiceInstance> getDiscoveryClientServiceInstances();
}
