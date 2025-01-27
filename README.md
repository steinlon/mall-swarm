# mall-swarm

<p>
  <a href="https://github.com/steinlon/mall-learning"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%AD%A6%E4%B9%A0%E6%95%99%E7%A8%8B-mall--learning-green.svg" alt="学习教程"></a>
  <a href="https://github.com/steinlon/mall"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%90%8E%E5%8F%B0%E9%A1%B9%E7%9B%AE-mall-blue.svg" alt="后台项目"></a>
  <a href="https://github.com/steinlon/mall-admin-web"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E5%89%8D%E7%AB%AF%E9%A1%B9%E7%9B%AE-mall--admin--web-green.svg" alt="前端项目"></a>
  <a href="https://github.com/steinlon/mall-swarm"><img src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/badge/%E7%A0%81%E4%BA%91-%E9%A1%B9%E7%9B%AE%E5%9C%B0%E5%9D%80-orange.svg" alt="码云"></a>
  <a href="https://github.com/steinlon/mall-swarm"><img src="https://github.com/steinlon/mall-swarm/workflows/Mall%20Swarm%20Build%20CI/badge.svg" alt="CI"></a>
</p>

## 友情提示

> 1. **快速体验项目**：[在线访问地址](https://www.macrozheng.com/admin/index.html) 。
> 2. **全套学习教程**：[《mall学习教程》](https://www.macrozheng.com) 。
> 3. **视频教程（2023最新版）**：[《mall视频教程》](https://www.macrozheng.com/mall/catalog/mall_video.html) 。
> 4. **Spring Cloud全套教程**：[《SpringCloud学习教程》](https://github.com/macrozheng/springcloud-learning) 。
> 5. **项目交流**：想要加群交流项目的朋友，可以加入[mall项目交流群](#公众号) 。

## 项目简介

`mall-swarm`是一套微服务商城系统，采用了 Spring Cloud 2021 & Alibaba、Spring Boot 2.7、Oauth2、MyBatis、Elasticsearch、Docker、Kubernetes等核心技术，同时提供了基于Vue的管理后台方便快速搭建系统。`mall-swarm`在电商业务的基础集成了注册中心、配置中心、监控中心、网关等系统功能。文档齐全，附带全套Spring Cloud教程。

## 项目演示

### 后台管理系统

前端项目`mall-admin-web`地址：https://github.com/macrozheng/mall-admin-web

项目演示地址： [https://www.macrozheng.com/admin/index.html](https://www.macrozheng.com/admin/index.html)

![后台管理系统功能演示](./document/resource/mall_admin_show.png)

### 前台商城系统

前端项目`mall-app-web`地址：https://github.com/macrozheng/mall-app-web

项目演示地址（将浏览器切换为手机模式效果更佳）：[https://www.macrozheng.com/app/](https://www.macrozheng.com/app/)

![前台商城系统功能演示](./document/resource/re_mall_app_show.jpg)

## 项目架构

### 系统架构

![系统架构图](./document/resource/mall_micro_service_arch.jpg)

### 业务架构

![业务架构图](./document/resource/re_mall_business_arch.jpg)

### 组织结构

```
mall
├── mall-common -- 工具类及通用代码模块
├── mall-mbg -- MyBatisGenerator生成的数据库操作代码模块
├── mall-auth -- 基于Spring Security Oauth2的统一的认证中心
├── mall-gateway -- 基于Spring Cloud Gateway的微服务API网关服务
├── mall-monitor -- 基于Spring Boot Admin的微服务监控中心
├── mall-admin -- 后台管理系统服务
├── mall-search -- 基于Elasticsearch的商品搜索系统服务
├── mall-portal -- 移动端商城系统服务
├── mall-demo -- 微服务远程调用测试服务
├── config -- 配置中心存储的配置
└── document -- 其他配置文件
```

## 技术选型

### 后端技术

| 技术                   | 说明                 | 官网                                                 |
| ---------------------- | -------------------- | ---------------------------------------------------- |
| Spring Cloud           | 微服务框架           | https://spring.io/projects/spring-cloud              |
| Spring Cloud Alibaba   | 微服务框架           | https://github.com/alibaba/spring-cloud-alibaba      |
| Spring Boot            | 容器+MVC框架         | https://spring.io/projects/spring-boot               |
| Spring Security OAuth2 | 认证和授权框架       | https://spring.io/projects/spring-security-oauth     |
| MyBatis                | ORM框架              | http://www.mybatis.org/mybatis-3/zh/index.html       |
| MyBatisGenerator       | 数据层代码生成       | http://www.mybatis.org/generator/index.html          |
| PageHelper             | MyBatis物理分页插件  | http://git.oschina.net/free/Mybatis_PageHelper       |
| Knife4j                | 文档生产工具         | https://github.com/xiaoymin/swagger-bootstrap-ui     |
| Elasticsearch          | 搜索引擎             | https://github.com/elastic/elasticsearch             |
| RabbitMq               | 消息队列             | https://www.rabbitmq.com/                            |
| Redis                  | 分布式缓存           | https://redis.io/                                    |
| MongoDb                | NoSql数据库          | https://www.mongodb.com/                             |
| Docker                 | 应用容器引擎         | https://www.docker.com/                              |
| Druid                  | 数据库连接池         | https://github.com/alibaba/druid                     |
| OSS                    | 对象存储             | https://github.com/aliyun/aliyun-oss-java-sdk        |
| MinIO                  | 对象存储             | https://github.com/minio/minio                       |
| JWT                    | JWT登录支持          | https://github.com/jwtk/jjwt                         |
| LogStash               | 日志收集             | https://github.com/logstash/logstash-logback-encoder |
| Lombok                 | 简化对象封装工具     | https://github.com/rzwitserloot/lombok               |
| Seata                  | 全局事务管理框架     | https://github.com/seata/seata                       |
| Portainer              | 可视化Docker容器管理 | https://github.com/portainer/portainer and https://hub.docker.com/r/portainer/portainer-ce           |
| GitHub CI              | 自动化部署工具       | https://docs.github.com/cn/actions/learn-github-actions                 |
| Kubernetes             | 应用容器管理平台     | https://kubernetes.io/                               |

### 前端技术

| 技术       | 说明                  | 官网                           |
| ---------- | --------------------- | ------------------------------ |
| Vue        | 前端框架              | https://vuejs.org/             |
| Vue-router | 路由框架              | https://router.vuejs.org/      |
| Vuex       | 全局状态管理框架      | https://vuex.vuejs.org/        |
| Element    | 前端UI框架            | https://element.eleme.io/      |
| Axios      | 前端HTTP框架          | https://github.com/axios/axios |
| v-charts   | 基于Echarts的图表框架 | https://v-charts.js.org/       |

### 移动端技术

| 技术         | 说明             | 官网                                    |
| ------------ | ---------------- | --------------------------------------- |
| Vue          | 核心前端框架     | https://vuejs.org                       |
| Vuex         | 全局状态管理框架 | https://vuex.vuejs.org                  |
| uni-app      | 移动端前端框架   | https://uniapp.dcloud.io                |
| mix-mall     | 电商项目模板     | https://ext.dcloud.net.cn/plugin?id=200 |
| luch-request | HTTP请求框架     | https://github.com/lei-mu/luch-request  |

## 环境搭建

### 开发环境

| 工具          | 版本号 | 下载                                                         |
| ------------- | ------ | ------------------------------------------------------------ |
| JDK           | 11    | https://www.oracle.com/java/technologies/javase-jdk11-downloads.html |
| Postgres      | 13.3   | https://www.postgresql.org                                   |
| Flyway          | 8.3.0    | https://www.flywaydb.org/                                     |
| Redis         | 7.0    | https://redis.io/download                                    |
| Redis Commander | latest   | https://registry.hub.docker.com/r/rediscommander/redis-commander |
| Elasticsearch | 7.17.3 | https://www.elastic.co/cn/downloads/elasticsearch            |
| Kibana        | 7.17.3 | https://www.elastic.co/cn/downloads/kibana                   |
| Logstash      | 7.17.3 | https://www.elastic.co/cn/downloads/logstash                 |
| MongoDb       | 5.0    | https://www.mongodb.com/download-center                      |
| RabbitMq      | 3.10.5 | http://www.rabbitmq.com/download.html                        |
| nginx         | 1.22   | http://nginx.org/en/download.html                            |

### Nacos配置中心

[Nacos配置中心](https://mp.weixin.qq.com/s/N9eAMHuDEJq7kCCJPEEJqw)

### 搭建步骤

> 数据库部署

- create database mall;

> Windows环境部署

- Windows环境搭建请参考：[mall-swarm在Windows环境下的部署](https://www.macrozheng.com/mall/deploy/mall_swarm_deploy_windows.html);
- `mall-admin-web`项目的安装及部署请参考：[mall前端项目的安装与部署](https://www.macrozheng.com/mall/deploy/mall_deploy_web.html);
- `ELK`日志收集系统的搭建请参考：[SpringBoot应用整合ELK实现日志收集](https://www.macrozheng.com/mall/reference/mall_tiny_elk.html);
- 使用MinIO存储文件请参考：[前后端分离项目，如何优雅实现文件存储](https://www.macrozheng.com/mall/technology/minio_use.html);
- 读写分离解决方案请参考：[你还在代码里做读写分离么，试试这个中间件吧](https://www.macrozheng.com/project/gaea.html);
- `分布式事务`解决方案请参考：[使用Seata彻底解决Spring Cloud中的分布式事务问题！](https://www.macrozheng.com/cloud/seata.html) 。

> Docker环境部署

- 使用虚拟机安装CentOS7.6请参考：[虚拟机安装及使用Linux，看这一篇就够了](https://www.macrozheng.com/tool/linux_install.html);
- Docker环境的安装请参考：[开发者必备Docker命令](https://www.macrozheng.com/mall/reference/linux_command.html);
- 本项目Docker镜像构建请参考：[使用Maven插件为SpringBoot应用构建Docker镜像](https://www.macrozheng.com/mall/reference/docker_maven.html);
- 本项目在Docker容器下的部署请参考：[mall-swarm在Linux环境下的部署（基于Docker容器）](https://www.macrozheng.com/mall/deploy/mall_swarm_deploy_windows.html);
- 本项目使用Jenkins自动化部署请参考：[mall-swarm使用Jenkins实现自动化部署](https://www.macrozheng.com/mall/deploy/mall_swarm_deploy_jenkins.html) 。

> Kubernetes环境部署

- 本项目使用Kubernetes部署请参考：[mall-swarm微服务项目在K8S下的实践！](https://www.macrozheng.com/mall/deploy/mall_swarm_deploy_k8s.html)

> 构建项目
- mvn clean compile
- mvn clean package
- mvn clean package -DskipTests
- mvn clean package -Dmaven.test.skip=true

## 运行效果展示

- 查看注册中心注册服务信息，访问地址：http://192.168.3.101:8848/nacos/

![](./document/resource/mall_swarm_run_new_01.png)

- 监控中心应用信息，访问地址：http://192.168.3.101:8101

![](./document/resource/mall_swarm_run_new_02.png)

![](./document/resource/mall_swarm_run_new_04.png)

![](./document/resource/redis_commander.png)

- API文档信息(本地运行)，访问地址：http://localhost:8201/doc.html
- API文档信息，访问地址：http://192.168.3.101:8201

![](./document/resource/mall_swarm_run_05.png)

- 日志收集系统信息，访问地址：http://192.168.3.101:5601

![](./document/resource/mall_swarm_run_new_06.png)
- logstash-plugin install logstash-codec-json_lines
- Install elasticsearch-header plugin from Google Chrome extension
![](./document/resource/mall_swarm_run_06.png)

- 可视化容器管理，访问地址：http://192.168.3.101:9000

![](./document/resource/mall_swarm_run_new_08.png)
![](./document/resource/mall_swarm_run_07.png)

![](./document/resource/mall_swarm_run_08.png)

## Spring Cloud Upgrade

[Bootstrap issue](https://stackoverflow.com/questions/64994034/bootstrap-yml-configuration-not-processed-anymore-with-spring-cloud-2020-0)  
[Load balance issue](https://blog.csdn.net/qq_33220089/article/details/115940165)   
[Nacos load balance issue](https://blog.csdn.net/SirLZF/article/details/117127361)

### Nacos配置中心

[Nacos配置中心](https://mp.weixin.qq.com/s/N9eAMHuDEJq7kCCJPEEJqw)

## ELK 搭建
[ELK](https://mp.weixin.qq.com/s/ll_A6ddBaU99LSYmKdttYw)  
[Logstash概念](https://blog.csdn.net/UbuntuTouch/article/details/105973985)  
[Logstash](https://www.jianshu.com/p/ef6a57309c72)

## Modules Learning

| 模块        | 子模块                 | 重构                              |
| ---------- | --------------------  | ------------------------------   |
| UMS        | UmsRole               | yes                              |
| UMS        | UmsResource           | yes                              |
| UMS        | UmsResourceCategory   | yes                              |
| UMS        | UmsMenu               | yes                              |
| UMS        | UmsMemberLevel        | yes                              |
| UMS        | UmsAdmin              | yes                              |
| UMS        | UmsAdminCache         | yes                              |
| UMS        | UmsPermission         | yes                              |
| SMS        |                       |                                  |
| PMS        |                       |                                  |
| OMS        |                       |                                  |
| CMS        |                       |                                  |

## 许可证

[Apache License 2.0](https://github.com/macrozheng/mall-swarm/blob/master/LICENSE)

Copyright (c) 2018-2025
