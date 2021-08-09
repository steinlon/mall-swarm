-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
drop table if exists cms_help;
create table cms_help (
    id          serial not null,
    category_id bigint       default null,
    icon        varchar(500) default null,
    title       varchar(100) default null,
    show_status int          default null,
    create_time timestamp    default null,
    read_count  int          default null,
    content     text,
    primary key (id)
);
comment on table cms_help is '帮助表';

-- ----------------------------
-- Records of cms_help
-- ----------------------------

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
drop table if exists cms_help_category;
create table cms_help_category (
    id          serial not null,
    name        varchar(100) default null,
    icon        varchar(500) default null,
    help_count  int          default null,
    show_status int          default null,
    sort        int          default null,
    primary key (id)
);
comment on table cms_help is '帮助分类表';

-- ----------------------------
-- Records of cms_help_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
drop table if exists cms_member_report;
create table cms_member_report (
    id                 bigint not null,
    report_type        int          default null,
    report_member_name varchar(100) default null,
    create_time        date         default null,
    report_object      varchar(100) default null,
    report_status      int          default null,
    handle_status      int          default null,
    note               varchar(200) default null,
    primary key (id)
);
comment on table cms_member_report is '用户举报表';

-- ----------------------------
-- Records of cms_member_report
-- ----------------------------

-- ----------------------------
-- Table structure for cms_preference_area
-- ----------------------------
drop table if exists cms_preference_area;
create table cms_preference_area (
    id          serial not null,
    name        varchar(255) default null,
    sub_title   varchar(255) default null,
    pic         bytea        default null,
    sort        int          default null,
    show_status int          default null,
    primary key (id)
);
comment on table cms_preference_area is '优选专区';

-- ----------------------------
-- Records of cms_preference_area
-- ----------------------------
insert into cms_preference_area
values ('1', '让音质更出众', '音质不打折 完美现场感', null, null, '1');
insert into cms_preference_area
values ('2', '让音质更出众22', '让音质更出众22', null, null, null);
insert into cms_preference_area
values ('3', '让音质更出众33', null, null, null, null);
insert into cms_preference_area
values ('4', '让音质更出众44', null, null, null, null);

-- ----------------------------
-- Table structure for cms_preference_area_product_relation
-- ----------------------------
drop table if exists cms_preference_area_product_relation;
create table cms_preference_area_product_relation (
    id                 bigint not null,
    preference_area_id bigint default null,
    product_id         bigint default null,
    primary key (id)
);
comment on table cms_preference_area_product_relation is '优选专区和产品关系表';

-- ----------------------------
-- Records of cms_preference_area_product_relation
-- ----------------------------
insert into cms_preference_area_product_relation
values ('1', '1', '12');
insert into cms_preference_area_product_relation
values ('2', '1', '13');
insert into cms_preference_area_product_relation
values ('3', '1', '14');
insert into cms_preference_area_product_relation
values ('4', '1', '18');
insert into cms_preference_area_product_relation
values ('5', '1', '7');
insert into cms_preference_area_product_relation
values ('6', '2', '7');
insert into cms_preference_area_product_relation
values ('7', '1', '22');
insert into cms_preference_area_product_relation
values ('24', '1', '23');

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
drop table if exists cms_subject;
create table cms_subject (
    id               bigint not null,
    category_id      bigint        default null,
    title            varchar(100)  default null,
    pic              varchar(500)  default null,
    product_count    int           default null,
    recommend_status int           default null,
    create_time      date          default null,
    collect_count    int           default null,
    read_count       int           default null,
    comment_count    int           default null,
    album_pics       varchar(1000) default null,
    description      varchar(1000) default null,
    show_status      int           default null,
    content          text,
    forward_count    int           default null,
    category_name    varchar(200)  default null,
    primary key (id)
);
comment on table cms_subject is '专题表';

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
insert into cms_subject
values ('1', '1', 'polo衬衫的也时尚', null, null, null, '2018-11-11 13:26:55', null, null, null, null, null, null, null, null, '服装专题');
insert into cms_subject
values ('2', '2', '大牌手机低价秒', null, null, null, '2018-11-12 13:27:00', null, null, null, null, null, null, null, null, '手机专题');
insert into cms_subject
values ('3', '2', '晓龙845新品上市', null, null, null, '2018-11-13 13:27:05', null, null, null, null, null, null, null, null, '手机专题');
insert into cms_subject
values ('4', '1', '夏天应该穿什么', null, null, null, '2018-11-01 13:27:09', null, null, null, null, null, null, null, null, '服装专题');
insert into cms_subject
values ('5', '1', '夏季精选', null, null, null, '2018-11-06 13:27:18', null, null, null, null, null, null, null, null, '服装专题');
insert into cms_subject
values ('6', '2', '品牌手机降价', null, null, null, '2018-11-07 13:27:21', null, null, null, null, null, null, null, null, '手机专题');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
drop table if exists cms_subject_category;
create table cms_subject_category (
    id            bigint not null,
    name          varchar(100) default null,
    icon          varchar(500) default null,
    subject_count int          default null,
    show_status   int          default null,
    sort          int          default null,
    primary key (id)
);
comment on table cms_subject_category is '专题分类表';

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
insert into cms_subject_category
values ('1', '服装专题', null, null, null, null);
insert into cms_subject_category
values ('2', '手机专题', null, null, null, null);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
drop table if exists cms_subject_comment;
create table cms_subject_comment (
    id               bigint not null,
    subject_id       bigint        default null,
    member_nick_name varchar(255)  default null,
    member_icon      varchar(255)  default null,
    content          varchar(1000) default null,
    create_time      date          default null,
    show_status      int           default null,
    primary key (id)
);
comment on table cms_subject_comment is '专题评论表';

-- ----------------------------
-- Records of cms_subject_comment
-- ----------------------------

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
drop table if exists cms_subject_product_relation;
create table cms_subject_product_relation (
    id         bigint not null,
    subject_id bigint default null,
    product_id bigint default null,
    primary key (id)
);
comment on table cms_subject_product_relation is '专题商品关系表';

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
insert into cms_subject_product_relation
values ('1', '1', '12');
insert into cms_subject_product_relation
values ('2', '1', '13');
insert into cms_subject_product_relation
values ('3', '1', '14');
insert into cms_subject_product_relation
values ('4', '1', '18');
insert into cms_subject_product_relation
values ('5', '1', '7');
insert into cms_subject_product_relation
values ('6', '2', '7');
insert into cms_subject_product_relation
values ('7', '1', '22');
insert into cms_subject_product_relation
values ('29', '1', '23');
insert into cms_subject_product_relation
values ('30', '4', '23');
insert into cms_subject_product_relation
values ('31', '5', '23');
insert into cms_subject_product_relation
values ('41', '2', '26');
insert into cms_subject_product_relation
values ('42', '3', '26');
insert into cms_subject_product_relation
values ('43', '6', '26');

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
drop table if exists cms_topic;
create table cms_topic (
    id              bigint not null,
    category_id     bigint       default null,
    name            varchar(255) default null,
    create_time     date         default null,
    start_time      date         default null,
    end_time        date         default null,
    attend_count    int          default null,
    attention_count int          default null,
    read_count      int          default null,
    award_name      varchar(100) default null,
    attend_type     varchar(100) default null,
    content         text,
    primary key (id)
);
comment on table cms_topic is '话题表';

-- ----------------------------
-- Records of cms_topic
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
drop table if exists cms_topic_category;
create table cms_topic_category (
    id            bigint not null,
    name          varchar(100) default null,
    icon          varchar(500) default null,
    subject_count int          default null,
    show_status   int          default null,
    sort          int          default null,
    primary key (id)
);
comment on table cms_topic_category is '话题分类表';

-- ----------------------------
-- Records of cms_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
drop table if exists cms_topic_comment;
create table cms_topic_comment (
    id               bigint not null,
    member_nick_name varchar(255)  default null,
    topic_id         bigint        default null,
    member_icon      varchar(255)  default null,
    content          varchar(1000) default null,
    create_time      date          default null,
    show_status      int           default null,
    primary key (id)
);
comment on table cms_topic_comment is '专题评论表';

-- ----------------------------
-- Records of cms_topic_comment
-- ----------------------------

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
drop table if exists oms_cart_item;
create table oms_cart_item (
    id                  bigint not null,
    product_id          bigint         default null,
    product_sku_id      bigint         default null,
    member_id           bigint         default null,
    quantity            int            default null,
    price               decimal(10, 2) default null,
    product_pic         varchar(1000)  default null,
    product_name        varchar(500)   default null,
    product_sub_title   varchar(500)   default null,
    product_sku_code    varchar(200)   default null,
    member_nickname     varchar(500)   default null,
    create_date         date           default null,
    modify_date         date           default null,
    delete_status       int            default '0',
    product_category_id bigint         default null,
    product_brand       varchar(200)   default null,
    product_sn          varchar(200)   default null,
    product_attr        varchar(500)   default null,
    primary key (id)
);
comment on table oms_cart_item is '购物车表';

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
insert into oms_cart_item
values ('12', '26', '90', '1', '1', '3788.00', null, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001',
        'windir', '2018-08-27 16:53:44', null, '1', '19', null, null, null);
insert into oms_cart_item
values ('13', '27', '98', '1', '3', '2699.00', null, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir',
        '2018-08-27 17:11:53', null, '1', '19', null, null, null);
insert into oms_cart_item
values ('14', '28', '102', '1', '1', '649.00', null, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir',
        '2018-08-27 17:18:02', null, '1', '19', null, null, null);
insert into oms_cart_item
values ('15', '28', '103', '1', '1', '699.00', null, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir',
        '2018-08-28 10:22:45', null, '1', '19', null, null, null);
insert into oms_cart_item
values ('16', '29', '106', '1', '1', '5499.00', null, 'Apple iPhone 8 Plus',
        '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50',
        null, '1', '19', null, null, null);
insert into oms_cart_item
values ('19', '36', '163', '1', '3', '100.00', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001',
        'windir', '2020-02-25 15:51:59', null, '1', '29', 'NIKE', '6799345',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into oms_cart_item
values ('20', '36', '164', '1', '2', '120.00', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001',
        'windir', '2020-02-25 15:54:23', null, '1', '29', 'NIKE', '6799345',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into oms_cart_item
values ('21', '36', '164', '1', '2', '120.00', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001',
        'windir', '2020-02-25 16:49:53', null, '1', '29', 'NIKE', '6799345',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
drop table if exists oms_company_address;
create table oms_company_address (
    id             bigint not null,
    address_name   varchar(200) default null,
    send_status    int          default null,
    receive_status int          default null,
    name           varchar(64)  default null,
    phone          varchar(64)  default null,
    province       varchar(64)  default null,
    city           varchar(64)  default null,
    region         varchar(64)  default null,
    detail_address varchar(200) default null,
    primary key (id)
);
comment on table oms_company_address is '公司收发货地址表';

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
insert into oms_company_address
values ('1', '深圳发货点', '1', '1', '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
insert into oms_company_address
values ('2', '北京发货点', '0', '0', '大梨', '18000000000', '北京市', null, '南山区', '科兴科学园');
insert into oms_company_address
values ('3', '南京发货点', '0', '0', '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
drop table if exists oms_order;
create table oms_order (
    id                      bigint       not null,
    member_id               bigint       not null,
    coupon_id               bigint                default null,
    order_sn                varchar(64)           default null,
    create_time             date                  default null,
    member_username         varchar(64)           default null,
    total_amount            decimal(10, 2)        default null,
    pay_amount              decimal(10, 2)        default null,
    freight_amount          decimal(10, 2)        default null,
    promotion_amount        decimal(10, 2)        default null,
    integration_amount      decimal(10, 2)        default null,
    coupon_amount           decimal(10, 2)        default null,
    discount_amount         decimal(10, 2)        default null,
    pay_type                int                   default null,
    source_type             int                   default null,
    status                  int                   default null,
    order_type              int                   default null,
    delivery_company        varchar(64)           default null,
    delivery_sn             varchar(64)           default null,
    auto_confirm_day        int                   default null,
    integration             int                   default null,
    growth                  int                   default null,
    promotion_info          varchar(100)          default null,
    bill_type               int                   default null,
    bill_header             varchar(200)          default null,
    bill_content            varchar(200)          default null,
    bill_receiver_phone     varchar(32)           default null,
    bill_receiver_email     varchar(64)           default null,
    receiver_name           varchar(100) not null,
    receiver_phone          varchar(32)  not null,
    receiver_post_code      varchar(32)           default null,
    receiver_province       varchar(32)           default null,
    receiver_city           varchar(32)           default null,
    receiver_region         varchar(32)           default null,
    receiver_detail_address varchar(200)          default null,
    note                    varchar(500)          default null,
    confirm_status          int                   default null,
    delete_status           int          not null default '0',
    use_integration         int                   default null,
    payment_time            date                  default null,
    delivery_time           date                  default null,
    receive_time            date                  default null,
    comment_time            date                  default null,
    modify_time             date                  default null,
    primary key (id)
);
comment on table oms_order is '订单表';

-- ----------------------------
-- Records of oms_order
-- ----------------------------
insert into oms_order
values ('12', '1', '2', '201809150101000001', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '20.00', '2344.25', '0.00', '10.00', '10.00',
        '0', '1', '4', '0', '', '', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null,
        null, null, null, '大梨', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', '111', '0', '0', null, null, null, null, null,
        '2019-11-09 16:50:28');
insert into oms_order
values ('13', '1', '2', '201809150102000002', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1',
        '1', '1', '0', '', '', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null,
        null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', '1000', '2018-10-11 14:04:19', null, null, null,
        null);
insert into oms_order
values ('14', '1', '2', '201809130101000001', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2',
        '1', '2', '0', '顺丰快递', '201707196398345', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',
        null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, '2018-10-13 13:44:04',
        '2018-10-16 13:43:41', null, null, null);
insert into oms_order
values ('15', '1', '2', '201809130102000002', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1',
        '1', '3', '0', '顺丰快递', '201707196398346', '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠',
        null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '1', '0', null, '2018-10-13 13:44:54',
        '2018-10-16 13:45:01', '2018-10-18 14:05:31', null, null);
insert into oms_order
values ('16', '1', '2', '201809140101000001', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2',
        '1', '4', '0', null, null, '15', '13284', '13284', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null,
        null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
insert into oms_order
values ('17', '1', '2', '201809150101000003', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '0',
        '1', '4', '0', '顺丰快递', '201707196398345', '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null,
        null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, '2018-10-12 14:01:28', null,
        null, null);
insert into oms_order
values ('18', '1', '2', '201809150102000004', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1',
        '1', '1', '0', '圆通快递', 'xx', '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null,
        null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', '1000', null, '2018-10-16 14:42:17', null, null,
        null);
insert into oms_order
values ('19', '1', '2', '201809130101000003', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2',
        '1', '2', '0', null, null, '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null,
        null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
insert into oms_order
values ('20', '1', '2', '201809130102000004', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1',
        '1', '3', '0', null, null, '15', null, null, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null,
        null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
insert into oms_order
values ('21', '1', '2', '201809140101000002', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2',
        '1', '4', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null,
        null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '1', null, null, null, null, null, null);
insert into oms_order
values ('22', '1', '2', '201809150101000005', '2018-09-15 12:24:27', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '0',
        '1', '4', '0', '顺丰快递', '201707196398345', '15', '0', '0', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null,
        null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, '2018-10-12 14:01:28', null,
        null, null);
insert into oms_order
values ('23', '1', '2', '201809150102000006', '2018-09-15 14:24:29', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '1',
        '1', '1', '0', '顺丰快递', 'xxx', '15', '0', '0', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null, null,
        null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', '1000', null, '2018-10-16 14:41:28', null, null,
        null);
insert into oms_order
values ('24', '1', '2', '201809130101000005', '2018-09-13 16:57:40', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2',
        '1', '2', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null,
        null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '0', null, null, null, null, null, null);
insert into oms_order
values ('25', '1', '2', '201809130102000006', '2018-09-13 17:03:00', 'test', '18732.00', '16377.75', '10.00', '2344.25', '0.00', '10.00', '5.00', '1',
        '1', '4', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null,
        null, null, null, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', '0', '0', null, null, null, null, null,
        '2018-10-30 15:08:31');
insert into oms_order
values ('26', '1', '2', '201809140101000003', '2018-09-14 16:16:16', 'test', '18732.00', '16377.75', '0.00', '2344.25', '0.00', '10.00', '0.00', '2',
        '1', '4', '0', null, null, '15', '18682', '18682', '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', null, null,
        null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', null, '0', '1', null, null, null, null, null, null);
insert into oms_order
values ('27', '1', null, '202002250100000001', '2020-02-25 15:59:20', 'test', '540.00', '540.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1',
        '0', '0', null, null, null, '0', '0', '无优惠,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园',
        null, '0', '1', null, null, null, null, null, null);
insert into oms_order
values ('28', '1', null, '202002250100000002', '2020-02-25 16:05:47', 'test', '540.00', '540.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1',
        '0', '0', null, null, null, '0', '0', '无优惠,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园',
        null, '0', '1', null, null, null, null, null, null);
insert into oms_order
values ('29', '1', null, '202002250100000003', '2020-02-25 16:07:58', 'test', '540.00', '540.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '1',
        '0', '0', null, null, null, '0', '0', '无优惠,无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园',
        null, '0', '0', null, null, null, null, null, null);
insert into oms_order
values ('30', '1', null, '202002250100000004', '2020-02-25 16:50:13', 'test', '240.00', '240.00', '20.00', '0.00', '0.00', '0.00', '10.00', '0', '1',
        '2', '0', '顺丰快递', '12333333', null, '0', '0', '无优惠', null, null, null, null, null, '大梨', '18033441849', '518000', '广东省', '深圳市', '南山区',
        '科兴科学园', null, '0', '0', null, '2020-02-25 16:53:29', '2020-02-25 16:54:03', null, null, '2020-02-25 16:52:51');

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
drop table if exists oms_order_item;
create table oms_order_item (
    id                  bigint not null,
    order_id            bigint         default null,
    order_sn            varchar(64)    default null,
    product_id          bigint         default null,
    product_pic         varchar(500)   default null,
    product_name        varchar(200)   default null,
    product_brand       varchar(200)   default null,
    product_sn          varchar(64)    default null,
    product_price       decimal(10, 2) default null,
    product_quantity    int            default null,
    product_sku_id      bigint         default null,
    product_sku_code    varchar(50)    default null,
    product_category_id bigint         default null,
    promotion_name      varchar(200)   default null,
    promotion_amount    decimal(10, 2) default null,
    coupon_amount       decimal(10, 2) default null,
    integration_amount  decimal(10, 2) default null,
    real_amount         decimal(10, 2) default null,
    gift_integration    int            default '0',
    gift_growth         int            default '0',
    product_attr        varchar(500)   default null,
    primary key (id)
);
comment on table oms_order_item is '订单中所包含的商品';

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
insert into oms_order_item
values ('21', '12', '201809150101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg',
        '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('22', '12', '201809150101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米',
        '7437788', '2699.00', '3', '98', '201808270027001', '19', '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('23', '12', '201809150101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('24', '12', '201809150101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('25', '12', '201809150101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg',
        'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499',
        '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('26', '13', '201809150102000002', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg',
        '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('27', '13', '201809150102000002', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米',
        '7437788', '2699.00', '3', '98', '201808270027001', '19', '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('28', '13', '201809150102000002', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('29', '13', '201809150102000002', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('30', '13', '201809150102000002', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg',
        'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499',
        '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('31', '14', '201809130101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg',
        '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('32', '14', '201809130101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米',
        '7437788', '2699.00', '3', '98', '201808270027001', '19', '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('33', '14', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('34', '14', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('35', '14', '201809130101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg',
        'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499',
        '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('36', '15', '201809130101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg',
        '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('37', '15', '201809130101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米',
        '7437788', '2699.00', '3', '98', '201808270027001', '19', '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('38', '15', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('39', '15', '201809130101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('40', '15', '201809130101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg',
        'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499',
        '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('41', '16', '201809140101000001', '26', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg',
        '华为 HUAWEI P20', '华为', '6946605', '3788.00', '1', '90', '201806070026001', '19', '单品促销', '200.00', '2.02', '0.00', '3585.98', '3788', '3788',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('42', '16', '201809140101000001', '27', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米',
        '7437788', '2699.00', '3', '98', '201808270027001', '19', '打折优惠：满3件，打7.50折', '674.75', '1.44', '0.00', '2022.81', '2699', '2699',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('43', '16', '201809140101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '649.00', '1', '102', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '57.60', '0.35', '0.00', '591.05', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into oms_order_item
values ('44', '16', '201809140101000001', '28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A',
        '小米', '7437789', '699.00', '1', '103', '201808270028001', '19', '满减优惠：满1000.00元，减120.00元', '62.40', '0.37', '0.00', '636.23', '649', '649',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('45', '16', '201809140101000001', '29', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg',
        'Apple iPhone 8 Plus', '苹果', '7437799', '5499.00', '1', '106', '201808270029001', '19', '无优惠', '0.00', '2.94', '0.00', '5496.06', '5499',
        '5499', '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into oms_order_item
values ('46', '27', '202002250100000001', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '100.00', '3', '163', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '100.00', '0', '0', null);
insert into oms_order_item
values ('47', '27', '202002250100000001', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '120.00', '0', '0', null);
insert into oms_order_item
values ('48', '28', '202002250100000002', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '100.00', '3', '163', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '100.00', '0', '0', null);
insert into oms_order_item
values ('49', '28', '202002250100000002', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '120.00', '0', '0', null);
insert into oms_order_item
values ('50', '29', '202002250100000003', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '100.00', '3', '163', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '100.00', '0', '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into oms_order_item
values ('51', '29', '202002250100000003', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '120.00', '0', '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into oms_order_item
values ('52', '30', '202002250100000004', '36', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg',
        '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', '120.00', '2', '164', '202002210036001', '29', '无优惠', '0.00',
        '0.00', '0.00', '120.00', '0', '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
drop table if exists oms_order_operate_history;
create table oms_order_operate_history (
    id           bigint not null,
    order_id     bigint       default null,
    operate_man  varchar(100) default null,
    create_time  date         default null,
    order_status int          default null,
    note         varchar(500) default null,
    primary key (id)
);
comment on table oms_order_operate_history is '订单操作历史记录';

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
insert into oms_order_operate_history
values ('5', '12', '后台管理员', '2018-10-12 14:01:29', '2', '完成发货');
insert into oms_order_operate_history
values ('6', '13', '后台管理员', '2018-10-12 14:01:29', '2', '完成发货');
insert into oms_order_operate_history
values ('7', '12', '后台管理员', '2018-10-12 14:13:10', '4', '订单关闭:买家退货');
insert into oms_order_operate_history
values ('8', '13', '后台管理员', '2018-10-12 14:13:10', '4', '订单关闭:买家退货');
insert into oms_order_operate_history
values ('9', '22', '后台管理员', '2018-10-15 16:31:48', '4', '订单关闭:xxx');
insert into oms_order_operate_history
values ('10', '22', '后台管理员', '2018-10-15 16:35:08', '4', '订单关闭:xxx');
insert into oms_order_operate_history
values ('11', '22', '后台管理员', '2018-10-15 16:35:59', '4', '订单关闭:xxx');
insert into oms_order_operate_history
values ('12', '17', '后台管理员', '2018-10-15 16:43:40', '4', '订单关闭:xxx');
insert into oms_order_operate_history
values ('13', '25', '后台管理员', '2018-10-15 16:52:14', '4', '订单关闭:xxx');
insert into oms_order_operate_history
values ('14', '26', '后台管理员', '2018-10-15 16:52:14', '4', '订单关闭:xxx');
insert into oms_order_operate_history
values ('15', '23', '后台管理员', '2018-10-16 14:41:28', '2', '完成发货');
insert into oms_order_operate_history
values ('16', '13', '后台管理员', '2018-10-16 14:42:17', '2', '完成发货');
insert into oms_order_operate_history
values ('17', '18', '后台管理员', '2018-10-16 14:42:17', '2', '完成发货');
insert into oms_order_operate_history
values ('18', '26', '后台管理员', '2018-10-30 14:37:44', '4', '订单关闭:关闭订单');
insert into oms_order_operate_history
values ('19', '25', '后台管理员', '2018-10-30 15:07:01', '0', '修改收货人信息');
insert into oms_order_operate_history
values ('20', '25', '后台管理员', '2018-10-30 15:08:13', '0', '修改费用信息');
insert into oms_order_operate_history
values ('21', '25', '后台管理员', '2018-10-30 15:08:31', '0', '修改备注信息：xxx');
insert into oms_order_operate_history
values ('22', '25', '后台管理员', '2018-10-30 15:08:39', '4', '订单关闭:2222');
insert into oms_order_operate_history
values ('23', '12', '后台管理员', '2019-11-09 16:50:28', '4', '修改备注信息：111');
insert into oms_order_operate_history
values ('24', '30', '后台管理员', '2020-02-25 16:52:37', '0', '修改费用信息');
insert into oms_order_operate_history
values ('25', '30', '后台管理员', '2020-02-25 16:52:51', '0', '修改费用信息');
insert into oms_order_operate_history
values ('26', '30', '后台管理员', '2020-02-25 16:54:03', '2', '完成发货');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
drop table if exists oms_order_return_apply;
create table oms_order_return_apply (
    id                 bigint not null,
    order_id           bigint         default null,
    company_address_id bigint         default null,
    product_id         bigint         default null,
    order_sn           varchar(64)    default null,
    create_time        date           default null,
    member_username    varchar(64)    default null,
    return_amount      decimal(10, 2) default null,
    return_name        varchar(100)   default null,
    return_phone       varchar(100)   default null,
    status             int            default null,
    handle_time        date           default null,
    product_pic        varchar(500)   default null,
    product_name       varchar(200)   default null,
    product_brand      varchar(200)   default null,
    product_attr       varchar(500)   default null,
    product_count      int            default null,
    product_price      decimal(10, 2) default null,
    product_real_price decimal(10, 2) default null,
    reason             varchar(200)   default null,
    description        varchar(500)   default null,
    proof_pics         varchar(1000)  default null,
    handle_note        varchar(500)   default null,
    handle_man         varchar(100)   default null,
    receive_man        varchar(100)   default null,
    receive_time       date           default null,
    receive_note       varchar(500)   default null,
    primary key (id)
);
comment on table oms_order_return_apply is '订单退货申请';

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
insert into oms_order_return_apply
values ('3', '12', null, '26', '201809150101000001', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg',
        null, null, null, null, null);
insert into oms_order_return_apply
values ('4', '12', '2', '27', '201809150101000001', '2018-10-17 14:40:21', 'test', '3585.98', '大梨', '18000000000', '1', '2018-10-18 13:54:10',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', '已经处理了', 'admin', null, null, null);
insert into oms_order_return_apply
values ('5', '12', '3', '28', '201809150101000001', '2018-10-17 14:44:18', 'test', '3585.98', '大梨', '18000000000', '2', '2018-10-18 13:55:28',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
insert into oms_order_return_apply
values ('8', '13', null, '28', '201809150102000002', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '3', '2018-10-18 13:57:12',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', '理由不够充分', 'admin', null, null, null);
insert into oms_order_return_apply
values ('9', '14', '2', '26', '201809130101000001', '2018-10-17 14:34:57', 'test', '3500.00', '大梨', '18000000000', '2', '2018-10-24 15:44:56',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
insert into oms_order_return_apply
values ('10', '14', null, '27', '201809130101000001', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '3', '2018-10-24 15:46:57',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', '就是不退', 'admin', null, null, null);
insert into oms_order_return_apply
values ('11', '14', '2', '28', '201809130101000001', '2018-10-17 14:44:18', 'test', '591.05', '大梨', '18000000000', '1', '2018-10-24 17:09:04',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', '可以退款', 'admin', null, null, null);
insert into oms_order_return_apply
values ('12', '15', '3', '26', '201809130102000002', '2018-10-17 14:34:57', 'test', '3500.00', '大梨', '18000000000', '2', '2018-10-24 17:22:54',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
insert into oms_order_return_apply
values ('13', '15', null, '27', '201809130102000002', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '3', '2018-10-24 17:23:30',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', '无法退货', 'admin', null, null, null);
insert into oms_order_return_apply
values ('15', '16', null, '26', '201809140101000001', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('16', '16', null, '27', '201809140101000001', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('17', '16', null, '28', '201809140101000001', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('18', '17', null, '26', '201809150101000003', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('19', '17', null, '27', '201809150101000003', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('20', '17', null, '28', '201809150101000003', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('21', '18', null, '26', '201809150102000004', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('22', '18', null, '27', '201809150102000004', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('23', '18', null, '28', '201809150102000004', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('24', '19', null, '26', '201809130101000003', '2018-10-17 14:34:57', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', '1',
        '3788.00', '3585.98', '质量问题', '老是卡', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('25', '19', null, '27', '201809130101000003', '2018-10-17 14:40:21', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', '1', '2699.00', '2022.81',
        '质量问题', '不够高端', '', null, null, null, null, null);
insert into oms_order_return_apply
values ('26', '19', null, '28', '201809130101000003', '2018-10-17 14:44:18', 'test', null, '大梨', '18000000000', '0', null,
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', '1', '649.00',
        '591.05', '质量问题', '颜色太土', '', null, null, null, null, null);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
drop table if exists oms_order_return_reason;
create table oms_order_return_reason (
    id          serial not null,
    name        varchar(100) default null,
    sort        int          default null,
    status      int          default null,
    create_time timestamp    default null,
    primary key (id)
);
comment on table oms_order_return_reason is '退货原因表';

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
insert into oms_order_return_reason
values ('1', '质量问题', '1', '1', '2018-10-17 10:00:45');
insert into oms_order_return_reason
values ('2', '尺码太大', '1', '1', '2018-10-17 10:01:03');
insert into oms_order_return_reason
values ('3', '颜色不喜欢', '1', '1', '2018-10-17 10:01:13');
insert into oms_order_return_reason
values ('4', '7天无理由退货', '1', '1', '2018-10-17 10:01:47');
insert into oms_order_return_reason
values ('5', '价格问题', '1', '0', '2018-10-17 10:01:57');
insert into oms_order_return_reason
values ('12', '发票问题', '0', '1', '2018-10-19 16:28:36');
insert into oms_order_return_reason
values ('13', '其他问题', '0', '1', '2018-10-19 16:28:51');
insert into oms_order_return_reason
values ('14', '物流问题', '0', '1', '2018-10-19 16:29:01');
insert into oms_order_return_reason
values ('15', '售后问题', '0', '1', '2018-10-19 16:29:11');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
drop table if exists oms_order_setting;
create table oms_order_setting (
    id                    bigint not null,
    flash_order_overtime  int default null,
    normal_order_overtime int default null,
    confirm_overtime      int default null,
    finish_overtime       int default null,
    comment_overtime      int default null,
    primary key (id)
);
comment on table oms_order_setting is '订单设置表';

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
insert into oms_order_setting
values ('1', '60', '120', '15', '7', '7');

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
drop table if exists pms_album;
create table pms_album (
    id          serial not null,
    name        varchar(64)   default null,
    cover_pic   varchar(1000) default null,
    pic_count   int           default null,
    sort        int           default null,
    description varchar(1000) default null,
    primary key (id)
);
comment on table pms_album is '相册表';

-- ----------------------------
-- Records of pms_album
-- ----------------------------

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
drop table if exists pms_album_pic;
create table pms_album_pic (
    id       bigint not null,
    album_id bigint        default null,
    pic      varchar(1000) default null,
    primary key (id)
);
comment on table pms_album_pic is '画册图片表';

-- ----------------------------
-- Records of pms_album_pic
-- ----------------------------

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
drop table if exists pms_brand;
create table pms_brand (
    id                    bigint not null,
    name                  varchar(64)  default null,
    first_letter          varchar(8)   default null,
    sort                  int          default null,
    factory_status        int          default null,
    show_status           int          default null,
    product_count         int          default null,
    product_comment_count int          default null,
    logo                  varchar(255) default null,
    big_pic               varchar(255) default null,
    brand_story           text,
    primary key (id)
);
comment on table pms_brand is '品牌表';

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
insert into pms_brand
values ('1', '万和', 'W', '0', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '',
        'Victoria`s Secret的故事');
insert into pms_brand
values ('2', '三星', 's', '100', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', null,
        '三星的故事');
insert into pms_brand
values ('3', '华为', 'h', '100', '1', '0', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (2).jpg', null,
        'Victoria`s Secret的故事');
insert into pms_brand
values ('4', '格力', 'G', '30', '1', '0', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg', null,
        'Victoria`s Secret的故事');
insert into pms_brand
values ('5', '方太', 'F', '20', '1', '0', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', null,
        'Victoria`s Secret的故事');
insert into pms_brand
values ('6', '小米', 'M', '500', '1', '1', '100', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5a912944N474afb7a.png',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
insert into pms_brand
values ('21', 'OPPO', 'O', '0', '1', '1', '88', '500', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '',
        'string');
insert into pms_brand
values ('49', '七匹狼', 'S', '200', '1', '1', '77', '400', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/1522738681.jpg', null,
        'BOOB的故事');
insert into pms_brand
values ('50', '海澜之家', 'H', '200', '1', '1', '66', '300', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/LOGO1024.png', '',
        '海澜之家的故事');
insert into pms_brand
values ('51', '苹果', 'A', '200', '1', '1', '55', '200', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', null, '苹果的故事');
insert into pms_brand
values ('58', 'NIKE', 'N', '0', '1', '1', '33', '100', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '',
        'NIKE的故事');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
drop table if exists pms_comment;
create table pms_comment (
    id                bigint not null,
    product_id        bigint        default null,
    member_nick_name  varchar(255)  default null,
    product_name      varchar(255)  default null,
    star              int           default null,
    member_ip         varchar(64)   default null,
    create_time       date          default null,
    show_status       int           default null,
    product_attribute varchar(255)  default null,
    collect_count     int           default null,
    read_count        int           default null,
    content           text,
    pics              varchar(1000) default null,
    member_icon       varchar(255)  default null,
    replay_count      int           default null,
    primary key (id)
);
comment on table pms_comment is '商品评价表';
-- ----------------------------
-- Records of pms_comment
-- ----------------------------

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
drop table if exists pms_comment_replay;
create table pms_comment_replay (
    id               bigint not null,
    comment_id       bigint        default null,
    member_nick_name varchar(255)  default null,
    member_icon      varchar(255)  default null,
    content          varchar(1000) default null,
    create_time      date          default null,
    type             int           default null,
    primary key (id)
);
comment on table pms_comment_replay is '产品评价回复表';

-- ----------------------------
-- Records of pms_comment_replay
-- ----------------------------

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
drop table if exists pms_feight_template;
create table pms_feight_template (
    id              bigint not null,
    name            varchar(64)    default null,
    charge_type     int            default null,
    first_weight    decimal(10, 2) default null,
    first_fee       decimal(10, 2) default null,
    continue_weight decimal(10, 2) default null,
    continme_fee    decimal(10, 2) default null,
    dest            varchar(255)   default null,
    primary key (id)
);
comment on table pms_feight_template is '运费模版';

-- ----------------------------
-- Records of pms_feight_template
-- ----------------------------

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
drop table if exists pms_member_price;
create table pms_member_price (
    id                bigint not null,
    product_id        bigint         default null,
    member_level_id   bigint         default null,
    member_price      decimal(10, 2) default null,
    member_level_name varchar(100)   default null,
    primary key (id)
);
comment on table pms_member_price is '商品会员价格表';

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
insert into pms_member_price
values ('26', '7', '1', '500.00', null);
insert into pms_member_price
values ('27', '8', '1', '500.00', null);
insert into pms_member_price
values ('28', '9', '1', '500.00', null);
insert into pms_member_price
values ('29', '10', '1', '500.00', null);
insert into pms_member_price
values ('30', '11', '1', '500.00', null);
insert into pms_member_price
values ('31', '12', '1', '500.00', null);
insert into pms_member_price
values ('32', '13', '1', '500.00', null);
insert into pms_member_price
values ('33', '14', '1', '500.00', null);
insert into pms_member_price
values ('37', '18', '1', '500.00', null);
insert into pms_member_price
values ('44', '7', '2', '480.00', null);
insert into pms_member_price
values ('45', '7', '3', '450.00', null);
insert into pms_member_price
values ('52', '22', '1', null, null);
insert into pms_member_price
values ('53', '22', '2', null, null);
insert into pms_member_price
values ('54', '22', '3', null, null);
insert into pms_member_price
values ('58', '24', '1', null, null);
insert into pms_member_price
values ('59', '24', '2', null, null);
insert into pms_member_price
values ('60', '24', '3', null, null);
insert into pms_member_price
values ('112', '23', '1', '88.00', '黄金会员');
insert into pms_member_price
values ('113', '23', '2', '88.00', '白金会员');
insert into pms_member_price
values ('114', '23', '3', '66.00', '钻石会员');
insert into pms_member_price
values ('142', '31', '1', null, '黄金会员');
insert into pms_member_price
values ('143', '31', '2', null, '白金会员');
insert into pms_member_price
values ('144', '31', '3', null, '钻石会员');
insert into pms_member_price
values ('148', '32', '1', null, '黄金会员');
insert into pms_member_price
values ('149', '32', '2', null, '白金会员');
insert into pms_member_price
values ('150', '32', '3', null, '钻石会员');
insert into pms_member_price
values ('154', '33', '1', null, '黄金会员');
insert into pms_member_price
values ('155', '33', '2', null, '白金会员');
insert into pms_member_price
values ('156', '33', '3', null, '钻石会员');
insert into pms_member_price
values ('175', '34', '1', null, '黄金会员');
insert into pms_member_price
values ('176', '34', '2', null, '白金会员');
insert into pms_member_price
values ('177', '34', '3', null, '钻石会员');
insert into pms_member_price
values ('178', '30', '1', null, '黄金会员');
insert into pms_member_price
values ('179', '30', '2', null, '白金会员');
insert into pms_member_price
values ('180', '30', '3', null, '钻石会员');
insert into pms_member_price
values ('192', '27', '1', null, '黄金会员');
insert into pms_member_price
values ('193', '27', '2', null, '白金会员');
insert into pms_member_price
values ('194', '27', '3', null, '钻石会员');
insert into pms_member_price
values ('195', '28', '1', null, '黄金会员');
insert into pms_member_price
values ('196', '28', '2', null, '白金会员');
insert into pms_member_price
values ('197', '28', '3', null, '钻石会员');
insert into pms_member_price
values ('198', '29', '1', null, '黄金会员');
insert into pms_member_price
values ('199', '29', '2', null, '白金会员');
insert into pms_member_price
values ('200', '29', '3', null, '钻石会员');
insert into pms_member_price
values ('201', '26', '1', null, '黄金会员');
insert into pms_member_price
values ('202', '26', '2', null, '白金会员');
insert into pms_member_price
values ('203', '26', '3', null, '钻石会员');
insert into pms_member_price
values ('246', '36', '1', null, '黄金会员');
insert into pms_member_price
values ('247', '36', '2', null, '白金会员');
insert into pms_member_price
values ('248', '36', '3', null, '钻石会员');
insert into pms_member_price
values ('249', '35', '1', null, '黄金会员');
insert into pms_member_price
values ('250', '35', '2', null, '白金会员');
insert into pms_member_price
values ('251', '35', '3', null, '钻石会员');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
drop table if exists pms_product;
create table pms_product (
    id                            bigint      not null,
    brand_id                      bigint         default null,
    product_category_id           bigint         default null,
    feight_template_id            bigint         default null,
    product_attribute_category_id bigint         default null,
    name                          varchar(64) not null,
    pic                           varchar(255)   default null,
    product_sn                    varchar(64) not null,
    delete_status                 int            default null,
    publish_status                int            default null,
    new_status                    int            default null,
    recommand_status              int            default null,
    verify_status                 int            default null,
    sort                          int            default null,
    sale                          int            default null,
    price                         decimal(10, 2) default null,
    promotion_price               decimal(10, 2) default null,
    gift_growth                   int            default '0',
    gift_point                    int            default '0',
    use_point_limit               int            default null,
    sub_title                     varchar(255)   default null,
    description                   text,
    original_price                decimal(10, 2) default null,
    stock                         int            default null,
    low_stock                     int            default null,
    unit                          varchar(16)    default null,
    weight                        decimal(10, 2) default null,
    preview_status                int            default null,
    service_ids                   varchar(64)    default null,
    keywords                      varchar(255)   default null,
    note                          varchar(255)   default null,
    album_pics                    varchar(255)   default null,
    detail_title                  varchar(255)   default null,
    detail_desc                   text,
    detail_html                   text,
    detail_mobile_html            text,
    promotion_start_time          date           default null,
    promotion_end_time            date           default null,
    promotion_per_limit           int            default null,
    promotion_type                int            default null,
    brand_name                    varchar(255)   default null,
    product_category_name         varchar(255)   default null,
    primary key (id)
);
comment on table pms_product is '商品信息';

-- ----------------------------
-- Records of pms_product
-- ----------------------------
insert into pms_product
values ('1', '49', '7', '0', '0', '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1',
        '1', '1', '1', '100', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '件', '1000.00', '0', null, '银色星芒刺绣网纱底裤',
        '银色星芒刺绣网纱底裤', null, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', null, null, null, '0', '七匹狼', '外套');
insert into pms_product
values ('2', '49', '7', '0', '0', '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', '1', '1',
        '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '件', '1000.00', '0', null, '银色星芒刺绣网纱底裤2',
        '银色星芒刺绣网纱底裤', null, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', null, null, null, '0', '七匹狼', '外套');
insert into pms_product
values ('3', '1', '7', '0', '0', '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', '1', '1',
        '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '件', '1000.00', '0', null, '银色星芒刺绣网纱底裤3',
        '银色星芒刺绣网纱底裤', null, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', null, null, null, '0', '万和', '外套');
insert into pms_product
values ('4', '1', '7', '0', '0', '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', '1', '1',
        '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '件', '1000.00', '0', null, '银色星芒刺绣网纱底裤4',
        '银色星芒刺绣网纱底裤', null, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', null, null, null, '0', '万和', '外套');
insert into pms_product
values ('5', '1', '7', '0', '0', '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', '1', '0',
        '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '件', '1000.00', '0', null, '银色星芒刺绣网纱底裤5',
        '银色星芒刺绣网纱底裤', null, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', null, null, null, '0', '万和', '外套');
insert into pms_product
values ('6', '1', '7', '0', '0', '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', '1', '1',
        '1', '1', '1', '1', '0', '100.00', null, '0', '100', null, '111', '111', '120.00', '100', '20', '件', '1000.00', '0', null, '银色星芒刺绣网纱底裤6',
        '银色星芒刺绣网纱底裤', null, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', null, null, null, '0', '万和', '外套');
insert into pms_product
values ('7', '1', '7', '0', '1', '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0',
        '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('8', '1', '7', '0', '1', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0',
        '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('9', '1', '7', '0', '1', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0',
        '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('10', '1', '7', '0', '1', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0',
        '0', '0', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('11', '1', '7', '0', '1', '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1',
        '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('12', '1', '7', '0', '1', '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1',
        '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('13', '1', '7', '0', '1', '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '1',
        '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('14', '1', '7', '0', '1', '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0',
        '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('18', '1', '7', '0', '1', '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', '1', '0',
        '0', '1', '0', '0', '0', '249.00', '0.00', '0', '100', '0', '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', '299.00', '100', '0', '件', '0.00', '0', 'string',
        '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', '0', '0', '万和',
        '外套');
insert into pms_product
values ('22', '6', '7', '0', '1', 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', '1', '1', '0', '0',
        '0', '0', '0', '0.00', null, '0', '0', '0', 'test', '', '0.00', '100', '0', '', '0.00', '1', '1,2', '', '', '', '', '', '', '', null, null,
        '0', '0', '小米', '外套');
insert into pms_product
values ('23', '6', '19', '0', '1', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', '1', '1',
        '1', '1', '0', '0', '0', '99.00', null, '99', '99', '1000', '毛衫测试11', 'xxx', '109.00', '100', '0', '件', '1000.00', '1', '1,2,3', '毛衫测试',
        '毛衫测试',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg',
        '毛衫测试', '毛衫测试',
        '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>',
        '', null, null, '0', '2', '小米', '手机数码');
insert into pms_product
values ('24', '6', '7', '0', null, 'xxx', '', '', '1', '0', '0', '0', '0', '0', '0', '0.00', null, '0', '0', '0', 'xxx', '', '0.00', '100', '0', '',
        '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '小米', '外套');
insert into pms_product
values ('26', '3', '19', '0', '3', '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg',
        '6946605', '0', '1', '1', '1', '0', '100', '0', '3788.00', null, '3788', '3788', '0', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '',
        '4288.00', '1000', '0', '件', '0.00', '1', '2,3,1', '', '',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg',
        '', '',
        '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>',
        '', null, null, '0', '1', '华为', '手机通讯');
insert into pms_product
values ('27', '6', '19', '0', '3', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', '0', '1', '1', '1', '0', '0', '0', '2699.00',
        null, '2699', '2699', '0', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '2699.00', '100', '0', '',
        '0.00', '0', '', '', '', '', '', '',
        '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>',
        '', null, null, '0', '3', '小米', '手机数码');
insert into pms_product
values ('28', '6', '19', '0', '3', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', '0', '1', '1', '1', '0', '0', '0',
        '649.00', null, '649', '649', '0', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', '649.00', '100', '0', '', '0.00', '0', '', '', '', '', '',
        '', '', '', null, null, '0', '4', '小米', '手机数码');
insert into pms_product
values ('29', '51', '19', '0', '3', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', '0', '1', '1', '1', '0', '0', '0',
        '5499.00', null, '5499', '5499', '0', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', '5499.00',
        '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '苹果', '手机数码');
insert into pms_product
values ('30', '50', '8', '0', '1', 'HLA海澜之家简约动物印花短袖T恤',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', '0', '1', '1', '1',
        '0', '0', '0', '98.00', null, '0', '0', '0', '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', '98.00', '100', '0', '', '0.00',
        '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '海澜之家', 'T恤');
insert into pms_product
values ('31', '50', '8', '0', '1', 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', '0', '1', '0', '0',
        '0', '0', '0', '98.00', null, '0', '0', '0', '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', '98.00', '100', '0', '',
        '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '海澜之家', 'T恤');
insert into pms_product
values ('32', '50', '8', '0', null, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg',
        'HNTBJ2E153A', '0', '1', '0', '0', '0', '0', '0', '68.00', null, '0', '0', '0', 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '',
        '68.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '海澜之家', 'T恤');
insert into pms_product
values ('33', '6', '35', '0', null, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg',
        '4609652', '0', '1', '0', '0', '0', '0', '0', '2499.00', null, '0', '0', '0',
        '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', '2499.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '',
        '', null, null, '0', '0', '小米', '手机数码');
insert into pms_product
values ('34', '6', '35', '0', null, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg',
        '4609660', '0', '1', '0', '0', '0', '0', '0', '3999.00', null, '0', '0', '0', ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '',
        '3999.00', '100', '0', '', '0.00', '0', '', '', '', '', '', '', '', '', null, null, '0', '0', '小米', '手机数码');
insert into pms_product
values ('35', '58', '29', '0', '11', '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', '0', '1', '0', '0', '0', '0', '0',
        '369.00', null, '0', '0', '0', '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', '369.00', '100', '0', '', '0.00', '0', '', '', '', '', '',
        '', '', '', null, null, '0', '0', 'NIKE', '男鞋');
insert into pms_product
values ('36', '58', '29', '0', '11', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', '0', '1', '1', '1', '0', '0', '0',
        '499.00', null, '0', '0', '0', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', '499.00', '100', '0', '', '0.00', '0', '', '',
        '', '', '', '', '', '', null, null, '0', '0', 'NIKE', '男鞋');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
drop table if exists pms_product_attribute;
create table pms_product_attribute (
    id                            bigint not null,
    product_attribute_category_id bigint       default null,
    name                          varchar(64)  default null,
    select_type                   int          default null,
    input_type                    int          default null,
    input_list                    varchar(255) default null,
    sort                          int          default null,
    filter_type                   int          default null,
    search_type                   int          default null,
    related_status                int          default null,
    hand_add_status               int          default null,
    type                          int          default null,
    primary key (id)
);
comment on table pms_product_attribute is '商品属性参数表';

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
insert into pms_product_attribute
values ('1', '1', '尺寸', '2', '1', 'M,X,XL,2XL,3XL,4XL', '0', '0', '0', '0', '0', '0');
insert into pms_product_attribute
values ('7', '1', '颜色', '2', '1', '黑色,红色,白色,粉色', '100', '0', '0', '0', '1', '0');
insert into pms_product_attribute
values ('13', '0', '上市年份', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('14', '0', '上市年份1', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('15', '0', '上市年份2', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('16', '0', '上市年份3', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('17', '0', '上市年份4', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('18', '0', '上市年份5', '1', '1', '2013年,2014年,2015年,2016年,2017年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('19', '0', '适用对象', '1', '1', '青年女性,中年女性', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('20', '0', '适用对象1', '2', '1', '青年女性,中年女性', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('21', '0', '适用对象3', '2', '1', '青年女性,中年女性', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('24', '1', '商品编号', '1', '0', '', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('25', '1', '适用季节', '1', '1', '春季,夏季,秋季,冬季', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('32', '2', '适用人群', '0', '1', '老年,青年,中年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('33', '2', '风格', '0', '1', '嘻哈风格,基础大众,商务正装', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('35', '2', '颜色', '0', '0', '', '100', '0', '0', '0', '1', '0');
insert into pms_product_attribute
values ('37', '1', '适用人群', '1', '1', '儿童,青年,中年,老年', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('38', '1', '上市时间', '1', '1', '2017年秋,2017年冬,2018年春,2018年夏', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('39', '1', '袖长', '1', '1', '短袖,长袖,中袖', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('40', '2', '尺码', '0', '1', '29,30,31,32,33,34', '0', '0', '0', '0', '0', '0');
insert into pms_product_attribute
values ('41', '2', '适用场景', '0', '1', '居家,运动,正装', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('42', '2', '上市时间', '0', '1', '2018年春,2018年夏', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('43', '3', '颜色', '0', '0', '', '100', '0', '0', '0', '1', '0');
insert into pms_product_attribute
values ('44', '3', '容量', '0', '1', '16G,32G,64G,128G', '0', '0', '0', '0', '0', '0');
insert into pms_product_attribute
values ('45', '3', '屏幕尺寸', '0', '0', '', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('46', '3', '网络', '0', '1', '3G,4G', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('47', '3', '系统', '0', '1', 'Android,IOS', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('48', '3', '电池容量', '0', '0', '', '0', '0', '0', '0', '0', '1');
insert into pms_product_attribute
values ('49', '11', '颜色', '0', '1', '红色,蓝色,绿色', '0', '1', '0', '0', '0', '0');
insert into pms_product_attribute
values ('50', '11', '尺寸', '0', '1', '38,39,40', '0', '0', '0', '0', '0', '0');
insert into pms_product_attribute
values ('51', '11', '风格', '0', '1', '夏季,秋季', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
drop table if exists pms_product_attribute_category;
create table pms_product_attribute_category (
    id              bigint not null,
    name            varchar(64) default null,
    attribute_count int         default '0',
    param_count     int         default '0',
    primary key (id)
);
comment on table pms_product_attribute_category is '产品属性分类表';

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
insert into pms_product_attribute_category
values ('1', '服装-T恤', '2', '5');
insert into pms_product_attribute_category
values ('2', '服装-裤装', '2', '4');
insert into pms_product_attribute_category
values ('3', '手机数码-手机通讯', '2', '4');
insert into pms_product_attribute_category
values ('4', '配件', '0', '0');
insert into pms_product_attribute_category
values ('5', '居家', '0', '0');
insert into pms_product_attribute_category
values ('6', '洗护', '0', '0');
insert into pms_product_attribute_category
values ('10', '测试分类', '0', '0');
insert into pms_product_attribute_category
values ('11', '服装-鞋帽', '3', '0');

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
drop table if exists pms_product_attribute_value;
create table pms_product_attribute_value (
    id                   bigint not null,
    product_id           bigint      default null,
    product_attribute_id bigint      default null,
    value                varchar(64) default null,
    primary key (id)
);
comment on table pms_product_attribute_value is '存储产品参数信息的表';

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
insert into pms_product_attribute_value
values ('1', '9', '1', 'X');
insert into pms_product_attribute_value
values ('2', '10', '1', 'X');
insert into pms_product_attribute_value
values ('3', '11', '1', 'X');
insert into pms_product_attribute_value
values ('4', '12', '1', 'X');
insert into pms_product_attribute_value
values ('5', '13', '1', 'X');
insert into pms_product_attribute_value
values ('6', '14', '1', 'X');
insert into pms_product_attribute_value
values ('7', '18', '1', 'X');
insert into pms_product_attribute_value
values ('8', '7', '1', 'X');
insert into pms_product_attribute_value
values ('9', '7', '1', 'XL');
insert into pms_product_attribute_value
values ('10', '7', '1', 'XXL');
insert into pms_product_attribute_value
values ('11', '22', '7', 'x,xx');
insert into pms_product_attribute_value
values ('12', '22', '24', 'no110');
insert into pms_product_attribute_value
values ('13', '22', '25', '春季');
insert into pms_product_attribute_value
values ('14', '22', '37', '青年');
insert into pms_product_attribute_value
values ('15', '22', '38', '2018年春');
insert into pms_product_attribute_value
values ('16', '22', '39', '长袖');
insert into pms_product_attribute_value
values ('124', '23', '7', '米白色,浅黄色');
insert into pms_product_attribute_value
values ('125', '23', '24', 'no1098');
insert into pms_product_attribute_value
values ('126', '23', '25', '春季');
insert into pms_product_attribute_value
values ('127', '23', '37', '青年');
insert into pms_product_attribute_value
values ('128', '23', '38', '2018年春');
insert into pms_product_attribute_value
values ('129', '23', '39', '长袖');
insert into pms_product_attribute_value
values ('130', '1', '13', null);
insert into pms_product_attribute_value
values ('131', '1', '14', null);
insert into pms_product_attribute_value
values ('132', '1', '15', null);
insert into pms_product_attribute_value
values ('133', '1', '16', null);
insert into pms_product_attribute_value
values ('134', '1', '17', null);
insert into pms_product_attribute_value
values ('135', '1', '18', null);
insert into pms_product_attribute_value
values ('136', '1', '19', null);
insert into pms_product_attribute_value
values ('137', '1', '20', null);
insert into pms_product_attribute_value
values ('138', '1', '21', null);
insert into pms_product_attribute_value
values ('139', '2', '13', null);
insert into pms_product_attribute_value
values ('140', '2', '14', null);
insert into pms_product_attribute_value
values ('141', '2', '15', null);
insert into pms_product_attribute_value
values ('142', '2', '16', null);
insert into pms_product_attribute_value
values ('143', '2', '17', null);
insert into pms_product_attribute_value
values ('144', '2', '18', null);
insert into pms_product_attribute_value
values ('145', '2', '19', null);
insert into pms_product_attribute_value
values ('146', '2', '20', null);
insert into pms_product_attribute_value
values ('147', '2', '21', null);
insert into pms_product_attribute_value
values ('183', '31', '24', null);
insert into pms_product_attribute_value
values ('184', '31', '25', '夏季');
insert into pms_product_attribute_value
values ('185', '31', '37', '青年');
insert into pms_product_attribute_value
values ('186', '31', '38', '2018年夏');
insert into pms_product_attribute_value
values ('187', '31', '39', '短袖');
insert into pms_product_attribute_value
values ('198', '30', '24', null);
insert into pms_product_attribute_value
values ('199', '30', '25', '夏季');
insert into pms_product_attribute_value
values ('200', '30', '37', '青年');
insert into pms_product_attribute_value
values ('201', '30', '38', '2018年夏');
insert into pms_product_attribute_value
values ('202', '30', '39', '短袖');
insert into pms_product_attribute_value
values ('213', '27', '43', '黑色,蓝色');
insert into pms_product_attribute_value
values ('214', '27', '45', '5.8');
insert into pms_product_attribute_value
values ('215', '27', '46', '4G');
insert into pms_product_attribute_value
values ('216', '27', '47', 'Android');
insert into pms_product_attribute_value
values ('217', '27', '48', '3000ml');
insert into pms_product_attribute_value
values ('218', '28', '43', '金色,银色');
insert into pms_product_attribute_value
values ('219', '28', '45', '5.0');
insert into pms_product_attribute_value
values ('220', '28', '46', '4G');
insert into pms_product_attribute_value
values ('221', '28', '47', 'Android');
insert into pms_product_attribute_value
values ('222', '28', '48', '2800ml');
insert into pms_product_attribute_value
values ('223', '29', '43', '金色,银色');
insert into pms_product_attribute_value
values ('224', '29', '45', '4.7');
insert into pms_product_attribute_value
values ('225', '29', '46', '4G');
insert into pms_product_attribute_value
values ('226', '29', '47', 'IOS');
insert into pms_product_attribute_value
values ('227', '29', '48', '1960ml');
insert into pms_product_attribute_value
values ('228', '26', '43', '金色,银色');
insert into pms_product_attribute_value
values ('229', '26', '45', '5.0');
insert into pms_product_attribute_value
values ('230', '26', '46', '4G');
insert into pms_product_attribute_value
values ('231', '26', '47', 'Android');
insert into pms_product_attribute_value
values ('232', '26', '48', '3000');

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
drop table if exists pms_product_category;
create table pms_product_category (
    id            bigint not null,
    parent_id     bigint       default null,
    name          varchar(64)  default null,
    level         int          default null,
    product_count int          default null,
    product_unit  varchar(64)  default null,
    nav_status    int          default null,
    show_status   int          default null,
    sort          int          default null,
    icon          varchar(255) default null,
    keywords      varchar(255) default null,
    description   text,
    primary key (id)
);
comment on table pms_product_category is '产品分类';

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
insert into pms_product_category
values ('1', '0', '服装', '0', '100', '件', '1', '1', '1', null, '服装', '服装分类');
insert into pms_product_category
values ('2', '0', '手机数码', '0', '100', '件', '1', '1', '1', null, '手机数码', '手机数码');
insert into pms_product_category
values ('3', '0', '家用电器', '0', '100', '件', '1', '1', '1', null, '家用电器', '家用电器');
insert into pms_product_category
values ('4', '0', '家具家装', '0', '100', '件', '1', '1', '1', null, '家具家装', '家具家装');
insert into pms_product_category
values ('5', '0', '汽车用品', '0', '100', '件', '1', '1', '1', null, '汽车用品', '汽车用品');
insert into pms_product_category
values ('7', '1', '外套', '1', '100', '件', '1', '1', '0', '', '外套', '外套');
insert into pms_product_category
values ('8', '1', 'T恤', '1', '100', '件', '1', '1', '0', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'T恤', 'T恤');
insert into pms_product_category
values ('9', '1', '休闲裤', '1', '100', '件', '1', '1', '0', null, '休闲裤', '休闲裤');
insert into pms_product_category
values ('10', '1', '牛仔裤', '1', '100', '件', '1', '1', '0', null, '牛仔裤', '牛仔裤');
insert into pms_product_category
values ('11', '1', '衬衫', '1', '100', '件', '1', '1', '0', null, '衬衫', '衬衫分类');
insert into pms_product_category
values ('13', '12', '家电子分类1', '1', '1', 'string', '0', '1', '0', 'string', 'string', 'string');
insert into pms_product_category
values ('14', '12', '家电子分类2', '1', '1', 'string', '0', '1', '0', 'string', 'string', 'string');
insert into pms_product_category
values ('19', '2', '手机通讯', '1', '0', '件', '0', '0', '0', '', '手机通讯', '手机通讯');
insert into pms_product_category
values ('29', '1', '男鞋', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('30', '2', '手机配件', '1', '0', '', '0', '0', '0', '', '手机配件', '手机配件');
insert into pms_product_category
values ('31', '2', '摄影摄像', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('32', '2', '影音娱乐', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('33', '2', '数码配件', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('34', '2', '智能设备', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('35', '3', '电视', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('36', '3', '空调', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('37', '3', '洗衣机', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('38', '3', '冰箱', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('39', '3', '厨卫大电', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('40', '3', '厨房小电', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('41', '3', '生活电器', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('42', '3', '个护健康', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('43', '4', '厨房卫浴', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('44', '4', '灯饰照明', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('45', '4', '五金工具', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('46', '4', '卧室家具', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('47', '4', '客厅家具', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('48', '5', '全新整车', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('49', '5', '车载电器', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('50', '5', '维修保养', '1', '0', '', '0', '0', '0', '', '', '');
insert into pms_product_category
values ('51', '5', '汽车装饰', '1', '0', '', '0', '0', '0', '', '', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
drop table if exists pms_product_category_attribute_relation;
create table pms_product_category_attribute_relation (
    id                   bigint not null,
    product_category_id  bigint default null,
    product_attribute_id bigint default null,
    primary key (id)
);
comment on table pms_product_category_attribute_relation is '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
insert into pms_product_category_attribute_relation
values ('1', '24', '24');
insert into pms_product_category_attribute_relation
values ('5', '26', '24');
insert into pms_product_category_attribute_relation
values ('7', '28', '24');
insert into pms_product_category_attribute_relation
values ('9', '25', '24');
insert into pms_product_category_attribute_relation
values ('10', '25', '25');

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
drop table if exists pms_product_full_reduction;
create table pms_product_full_reduction (
    id           bigint not null,
    product_id   bigint         default null,
    full_price   decimal(10, 2) default null,
    reduce_price decimal(10, 2) default null,
    primary key (id)
);
comment on table pms_product_full_reduction is '产品满减表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
insert into pms_product_full_reduction
values ('1', '7', '100.00', '20.00');
insert into pms_product_full_reduction
values ('2', '8', '100.00', '20.00');
insert into pms_product_full_reduction
values ('3', '9', '100.00', '20.00');
insert into pms_product_full_reduction
values ('4', '10', '100.00', '20.00');
insert into pms_product_full_reduction
values ('5', '11', '100.00', '20.00');
insert into pms_product_full_reduction
values ('6', '12', '100.00', '20.00');
insert into pms_product_full_reduction
values ('7', '13', '100.00', '20.00');
insert into pms_product_full_reduction
values ('8', '14', '100.00', '20.00');
insert into pms_product_full_reduction
values ('9', '18', '100.00', '20.00');
insert into pms_product_full_reduction
values ('10', '7', '200.00', '50.00');
insert into pms_product_full_reduction
values ('11', '7', '300.00', '100.00');
insert into pms_product_full_reduction
values ('14', '22', '0.00', '0.00');
insert into pms_product_full_reduction
values ('16', '24', '0.00', '0.00');
insert into pms_product_full_reduction
values ('34', '23', '0.00', '0.00');
insert into pms_product_full_reduction
values ('44', '31', '0.00', '0.00');
insert into pms_product_full_reduction
values ('46', '32', '0.00', '0.00');
insert into pms_product_full_reduction
values ('48', '33', '0.00', '0.00');
insert into pms_product_full_reduction
values ('55', '34', '0.00', '0.00');
insert into pms_product_full_reduction
values ('56', '30', '0.00', '0.00');
insert into pms_product_full_reduction
values ('59', '27', '0.00', '0.00');
insert into pms_product_full_reduction
values ('60', '28', '500.00', '50.00');
insert into pms_product_full_reduction
values ('61', '28', '1000.00', '120.00');
insert into pms_product_full_reduction
values ('62', '29', '0.00', '0.00');
insert into pms_product_full_reduction
values ('63', '26', '0.00', '0.00');
insert into pms_product_full_reduction
values ('78', '36', '0.00', '0.00');
insert into pms_product_full_reduction
values ('79', '35', '0.00', '0.00');

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
drop table if exists pms_product_ladder;
create table pms_product_ladder (
    id         bigint not null,
    product_id bigint         default null,
    count      int            default null,
    discount   decimal(10, 2) default null,
    price      decimal(10, 2) default null,
    primary key (id)
);
comment on table pms_product_ladder is '产品阶梯价格表(只针对同商品)';

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
insert into pms_product_ladder
values ('1', '7', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('2', '8', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('3', '9', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('4', '10', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('5', '11', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('6', '12', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('7', '13', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('8', '14', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('12', '18', '3', '0.70', '0.00');
insert into pms_product_ladder
values ('14', '7', '4', '0.60', '0.00');
insert into pms_product_ladder
values ('15', '7', '5', '0.50', '0.00');
insert into pms_product_ladder
values ('18', '22', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('20', '24', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('38', '23', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('48', '31', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('50', '32', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('52', '33', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('59', '34', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('60', '30', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('64', '27', '2', '0.80', '0.00');
insert into pms_product_ladder
values ('65', '27', '3', '0.75', '0.00');
insert into pms_product_ladder
values ('66', '28', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('67', '29', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('68', '26', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('83', '36', '0', '0.00', '0.00');
insert into pms_product_ladder
values ('84', '35', '0', '0.00', '0.00');

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
drop table if exists pms_product_operate_log;
create table pms_product_operate_log (
    id                  bigint not null,
    product_id          bigint         default null,
    price_old           decimal(10, 2) default null,
    price_new           decimal(10, 2) default null,
    sale_price_old      decimal(10, 2) default null,
    sale_price_new      decimal(10, 2) default null,
    gift_point_old      int            default null,
    gift_point_new      int            default null,
    use_point_limit_old int            default null,
    use_point_limit_new int            default null,
    operate_man         varchar(64)    default null,
    create_time         date           default null,
    primary key (id)
);

-- ----------------------------
-- Records of pms_product_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
drop table if exists pms_product_vertify_record;
create table pms_product_vertify_record (
    id          serial not null,
    product_id  bigint       default null,
    create_time timestamp    default null,
    vertify_man varchar(64)  default null,
    status      int          default null,
    detail      varchar(255) default null,
    primary key (id)
);
comment on table pms_product_vertify_record is '商品审核记录';

-- ----------------------------
-- Records of pms_product_verify_record
-- ----------------------------
insert into pms_product_vertify_record
values ('1', '1', '2018-04-27 16:36:41', 'test', '1', '验证通过');
insert into pms_product_vertify_record
values ('2', '2', '2018-04-27 16:36:41', 'test', '1', '验证通过');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
drop table if exists pms_sku_stock;
create table pms_sku_stock (
    id              bigint      not null,
    product_id      bigint         default null,
    sku_code        varchar(64) not null,
    price           decimal(10, 2) default null,
    stock           int            default '0',
    low_stock       int            default null,
    pic             varchar(255)   default null,
    sale            int            default null,
    promotion_price decimal(10, 2) default null,
    lock_stock      int            default '0',
    sp_data         varchar(500)   default null,
    primary key (id)
);
comment on table cms_subject_product_relation is 'sku的库存';

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
insert into pms_sku_stock
values ('98', '27', '201808270027001', '2699.00', '97', null, null, null, null, '-24',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('99', '27', '201808270027002', '2999.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
insert into pms_sku_stock
values ('100', '27', '201808270027003', '2699.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('101', '27', '201808270027004', '2999.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
insert into pms_sku_stock
values ('102', '28', '201808270028001', '649.00', '99', null, null, null, null, '-8',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into pms_sku_stock
values ('103', '28', '201808270028002', '699.00', '99', null, null, null, null, '-8',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('104', '28', '201808270028003', '649.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into pms_sku_stock
values ('105', '28', '201808270028004', '699.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('106', '29', '201808270029001', '5499.00', '99', null, null, null, null, '-8',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('107', '29', '201808270029002', '6299.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
insert into pms_sku_stock
values ('108', '29', '201808270029003', '5499.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('109', '29', '201808270029004', '6299.00', '100', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
insert into pms_sku_stock
values ('110', '26', '201806070026001', '3788.00', '499', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into pms_sku_stock
values ('111', '26', '201806070026002', '3999.00', '500', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('112', '26', '201806070026003', '3788.00', '500', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
insert into pms_sku_stock
values ('113', '26', '201806070026004', '3999.00', '500', null, null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
insert into pms_sku_stock
values ('163', '36', '202002210036001', '100.00', '100', '25', null, null, null, '9',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('164', '36', '202002210036002', '120.00', '98', '20', null, null, null, '6',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('165', '36', '202002210036003', '100.00', '100', '20', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('166', '36', '202002210036004', '100.00', '100', '20', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('167', '36', '202002210036005', '100.00', '100', '20', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('168', '36', '202002210036006', '100.00', '100', '20', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('169', '36', '202002210036007', '100.00', '100', '20', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('170', '36', '202002210036008', '100.00', '100', '20', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('171', '35', '202002250035001', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('172', '35', '202002250035002', '240.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('173', '35', '202002250035003', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('174', '35', '202002250035004', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('175', '35', '202002250035005', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('176', '35', '202002250035006', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
insert into pms_sku_stock
values ('177', '35', '202002250035007', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
insert into pms_sku_stock
values ('178', '35', '202002250035008', '200.00', '100', '50', null, null, null, '0',
        '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
drop table if exists sms_coupon;
create table sms_coupon (
    id            bigint not null,
    type          int            default null,
    name          varchar(100)   default null,
    platform      int            default null,
    count         int            default null,
    amount        decimal(10, 2) default null,
    per_limit     int            default null,
    min_point     decimal(10, 2) default null,
    start_time    date           default null,
    end_time      date           default null,
    use_type      int            default null,
    note          varchar(200)   default null,
    publish_count int            default null,
    use_count     int            default null,
    receive_count int            default null,
    enable_time   date           default null,
    code          varchar(64)    default null,
    member_level  int            default null,
    primary key (id)
);
comment on table sms_coupon is '优惠卷表';

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
insert into sms_coupon
values ('2', '0', '全品类通用券', '0', '92', '10.00', '1', '100.00', '2018-08-27 16:40:47', '2018-11-23 16:40:47', '0', '满100减10', '100', '0', '8',
        '2018-08-27 16:40:47', null, null);
insert into sms_coupon
values ('3', '0', '小米手机专用券', '0', '92', '50.00', '1', '1000.00', '2018-08-27 16:40:47', '2018-11-16 16:40:47', '2', '小米手机专用优惠券', '100', '0', '8',
        '2018-08-27 16:40:47', null, null);
insert into sms_coupon
values ('4', '0', '手机品类专用券', '0', '92', '300.00', '1', '2000.00', '2018-08-27 16:40:47', '2018-09-15 16:40:47', '1', '手机分类专用优惠券', '100', '0', '8',
        '2018-08-27 16:40:47', null, null);
insert into sms_coupon
values ('7', '0', 'T恤分类专用优惠券', '0', '93', '50.00', '1', '500.00', '2018-08-27 16:40:47', '2018-08-15 16:40:47', '1', '满500减50', '100', '0', '7',
        '2018-08-27 16:40:47', null, null);
insert into sms_coupon
values ('8', '0', '新优惠券', '0', '100', '100.00', '1', '1000.00', '2018-11-08 00:00:00', '2018-11-27 00:00:00', '0', '测试', '100', '0', '1', null, null,
        null);
insert into sms_coupon
values ('9', '0', '全品类通用券', '0', '100', '5.00', '1', '100.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '1', null, null,
        null);
insert into sms_coupon
values ('10', '0', '全品类通用券', '0', '100', '15.00', '1', '200.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '1', null, null,
        null);
insert into sms_coupon
values ('11', '0', '全品类通用券', '0', '1000', '50.00', '1', '1000.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '1000', '0', '0', null,
        null, null);
insert into sms_coupon
values ('12', '0', '移动端全品类通用券', '1', '1', '10.00', '1', '100.00', '2018-11-08 00:00:00', '2018-11-10 00:00:00', '0', null, '100', '0', '0', null,
        null, null);
insert into sms_coupon
values ('19', '0', '手机分类专用', '0', '100', '100.00', '1', '1000.00', '2018-11-09 00:00:00', '2018-11-17 00:00:00', '1', '手机分类专用', '100', '0', '0', null,
        null, null);
insert into sms_coupon
values ('20', '0', '小米手机专用', '0', '100', '200.00', '1', '1000.00', '2018-11-09 00:00:00', '2018-11-24 00:00:00', '2', '小米手机专用', '100', '0', '0', null,
        null, null);
insert into sms_coupon
values ('21', '0', 'xxx', '0', '100', '10.00', '1', '100.00', '2018-11-09 00:00:00', '2018-11-30 00:00:00', '2', null, '100', '0', '0', null, null,
        null);
insert into sms_coupon
values ('22', '0', 'string', '0', '0', '0.00', '0', '0.00', '2019-08-18 15:36:11', '2019-08-18 15:36:11', '0', 'string', '0', '0', '0',
        '2019-08-18 15:36:11', 'string', '0');
insert into sms_coupon
values ('23', '0', '有效期测试', '0', '100', '10.00', '1', '100.00', '2019-10-05 00:00:00', '2019-10-09 00:00:00', '0', null, '100', '0', '0', null, null,
        null);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
drop table if exists sms_coupon_history;
create table sms_coupon_history (
    id              bigint not null,
    coupon_id       bigint       default null,
    member_id       bigint       default null,
    coupon_code     varchar(64)  default null,
    member_nickname varchar(64)  default null,
    get_type        int          default null,
    create_time     date         default null,
    use_status      int          default null,
    use_time        date         default null,
    order_id        bigint       default null,
    order_sn        varchar(100) default null,
    primary key (id)
);
create index idx_member_id on sms_coupon_history(member_id);
create index idx_coupon_id on sms_coupon_history(coupon_id);
comment on table sms_coupon_history is '优惠券使用、领取历史表';

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
insert into sms_coupon_history
values ('2', '2', '1', '4931048380330002', 'windir', '1', '2018-08-29 14:04:12', '1', '2018-11-12 14:38:47', '12', '201809150101000001');
insert into sms_coupon_history
values ('3', '3', '1', '4931048380330003', 'windir', '1', '2018-08-29 14:04:29', '0', null, null, null);
insert into sms_coupon_history
values ('4', '4', '1', '4931048380330004', 'windir', '1', '2018-08-29 14:04:32', '0', null, null, null);
insert into sms_coupon_history
values ('11', '7', '1', '4931048380330001', 'windir', '1', '2018-09-04 16:21:50', '0', null, null, null);
insert into sms_coupon_history
values ('12', '2', '4', '0340981248320004', 'zhensan', '1', '2018-11-12 14:16:50', '0', null, null, null);
insert into sms_coupon_history
values ('13', '3', '4', '0342977234360004', 'zhensan', '1', '2018-11-12 14:17:10', '0', null, null, null);
insert into sms_coupon_history
values ('14', '4', '4', '0343342928830004', 'zhensan', '1', '2018-11-12 14:17:13', '0', null, null, null);
insert into sms_coupon_history
values ('15', '2', '5', '0351883832180005', 'lisi', '1', '2018-11-12 14:18:39', '0', null, null, null);
insert into sms_coupon_history
values ('16', '3', '5', '0352201672680005', 'lisi', '1', '2018-11-12 14:18:42', '0', null, null, null);
insert into sms_coupon_history
values ('17', '4', '5', '0352505810180005', 'lisi', '1', '2018-11-12 14:18:45', '0', null, null, null);
insert into sms_coupon_history
values ('18', '2', '6', '0356114588380006', 'wangwu', '1', '2018-11-12 14:19:21', '0', null, null, null);
insert into sms_coupon_history
values ('19', '3', '6', '0356382856920006', 'wangwu', '1', '2018-11-12 14:19:24', '0', null, null, null);
insert into sms_coupon_history
values ('20', '4', '6', '0356656798470006', 'wangwu', '1', '2018-11-12 14:19:27', '0', null, null, null);
insert into sms_coupon_history
values ('21', '2', '3', '0363644984620003', 'windy', '1', '2018-11-12 14:20:36', '0', null, null, null);
insert into sms_coupon_history
values ('22', '3', '3', '0363932820300003', 'windy', '1', '2018-11-12 14:20:39', '0', null, null, null);
insert into sms_coupon_history
values ('23', '4', '3', '0364238275840003', 'windy', '1', '2018-11-12 14:20:42', '0', null, null, null);
insert into sms_coupon_history
values ('24', '2', '7', '0385034833070007', 'lion', '1', '2018-11-12 14:24:10', '0', null, null, null);
insert into sms_coupon_history
values ('25', '3', '7', '0385350208650007', 'lion', '1', '2018-11-12 14:24:13', '0', null, null, null);
insert into sms_coupon_history
values ('26', '4', '7', '0385632733900007', 'lion', '1', '2018-11-12 14:24:16', '0', null, null, null);
insert into sms_coupon_history
values ('27', '2', '8', '0388779132990008', 'shari', '1', '2018-11-12 14:24:48', '0', null, null, null);
insert into sms_coupon_history
values ('28', '3', '8', '0388943658810008', 'shari', '1', '2018-11-12 14:24:49', '0', null, null, null);
insert into sms_coupon_history
values ('29', '4', '8', '0389069398320008', 'shari', '1', '2018-11-12 14:24:51', '0', null, null, null);
insert into sms_coupon_history
values ('30', '2', '9', '0390753935250009', 'aewen', '1', '2018-11-12 14:25:08', '0', null, null, null);
insert into sms_coupon_history
values ('31', '3', '9', '0390882954470009', 'aewen', '1', '2018-11-12 14:25:09', '0', null, null, null);
insert into sms_coupon_history
values ('32', '4', '9', '0391025542810009', 'aewen', '1', '2018-11-12 14:25:10', '0', null, null, null);

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
drop table if exists sms_coupon_product_category_relation;
create table sms_coupon_product_category_relation (
    id                    bigint not null,
    coupon_id             bigint       default null,
    product_category_id   bigint       default null,
    product_category_name varchar(200) default null,
    parent_category_name  varchar(200) default null,
    primary key (id)
);
comment on table sms_coupon_product_category_relation is '优惠券和产品分类关系表';

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
insert into sms_coupon_product_category_relation
values ('4', '19', '30', '手机配件', '手机数码');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
drop table if exists sms_coupon_product_relation;
create table sms_coupon_product_relation (
    id           bigint not null,
    coupon_id    bigint       default null,
    product_id   bigint       default null,
    product_name varchar(500) default null,
    product_sn   varchar(200) default null,
    primary key (id)
);
comment on table sms_coupon_product_relation is '优惠券和产品的关系表';

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
insert into sms_coupon_product_relation
values ('9', '21', '33', '小米（MI）小米电视4A ', '4609652');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
drop table if exists sms_flash_promotion;
create table sms_flash_promotion (
    id          serial not null,
    title       varchar(200) default null,
    start_date  date         default null,
    end_date    date         default null,
    status      int          default null,
    create_time timestamp    default null,
    primary key (id)
);
comment on table sms_flash_promotion is '限时购表';

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
insert into sms_flash_promotion
values ('2', '春季家电家具疯狂秒杀1', '2018-11-12', '2018-11-23', '1', '2018-11-16 11:12:13');
insert into sms_flash_promotion
values ('3', '手机特卖', '2018-11-03', '2018-11-10', '1', '2018-11-16 11:11:31');
insert into sms_flash_promotion
values ('4', '春季家电家具疯狂秒杀3', '2018-11-24', '2018-11-25', '1', '2018-11-16 11:12:19');
insert into sms_flash_promotion
values ('5', '春季家电家具疯狂秒杀4', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:24');
insert into sms_flash_promotion
values ('6', '春季家电家具疯狂秒杀5', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:31');
insert into sms_flash_promotion
values ('7', '春季家电家具疯狂秒杀6', '2018-11-16', '2018-11-16', '1', '2018-11-16 11:12:35');
insert into sms_flash_promotion
values ('8', '春季家电家具疯狂秒杀7', '2018-11-16', '2018-11-16', '0', '2018-11-16 11:12:39');
insert into sms_flash_promotion
values ('9', '春季家电家具疯狂秒杀8', '2018-11-16', '2018-11-16', '0', '2018-11-16 11:12:42');
insert into sms_flash_promotion
values ('13', '测试', '2018-11-01', '2018-11-30', '0', '2018-11-19 10:34:24');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
drop table if exists sms_flash_promotion_log;
create table sms_flash_promotion_log (
    id             int not null,
    member_id      int          default null,
    product_id     bigint       default null,
    member_phone   varchar(64)  default null,
    product_name   varchar(100) default null,
    subscribe_time date         default null,
    send_time      date         default null,
    primary key (id)
);
comment on table sms_flash_promotion_log is '限时购通知记录';

-- ----------------------------
-- Records of sms_flash_promotion_log
-- ----------------------------

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
drop table if exists sms_flash_promotion_product_relation;
create table sms_flash_promotion_product_relation (
    id                         bigint not null,
    flash_promotion_id         bigint         default null,
    flash_promotion_session_id bigint         default null,
    product_id                 bigint         default null,
    flash_promotion_price      decimal(10, 2) default null,
    flash_promotion_count      int            default null,
    flash_promotion_limit      int            default null,
    sort                       int            default null,
    primary key (id)
);
comment on table sms_flash_promotion_product_relation is '商品限时购与商品关系表';

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
insert into sms_flash_promotion_product_relation
values ('1', '2', '1', '26', '3000.00', '10', '1', '0');
insert into sms_flash_promotion_product_relation
values ('2', '2', '1', '27', '2000.00', '10', '1', '20');
insert into sms_flash_promotion_product_relation
values ('3', '2', '1', '28', '599.00', '19', '1', '0');
insert into sms_flash_promotion_product_relation
values ('4', '2', '1', '29', '4999.00', '10', '1', '100');
insert into sms_flash_promotion_product_relation
values ('9', '2', '2', '26', '2999.00', '100', '1', '0');
insert into sms_flash_promotion_product_relation
values ('10', '2', '2', '27', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('11', '2', '2', '28', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('12', '2', '2', '29', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('13', '2', '2', '30', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('14', '2', '3', '31', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('15', '2', '3', '32', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('16', '2', '4', '33', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('17', '2', '4', '34', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('18', '2', '5', '36', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('19', '2', '6', '33', null, null, null, null);
insert into sms_flash_promotion_product_relation
values ('20', '2', '6', '34', null, null, null, null);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
drop table if exists sms_flash_promotion_session;
create table sms_flash_promotion_session (
    id          serial not null,
    name        varchar(200) default null,
    start_time  time         default null,
    end_time    time         default null,
    status      int          default null,
    create_time timestamp    default null,
    primary key (id)
);
comment on table sms_flash_promotion_session is '限时购场次表';

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
insert into sms_flash_promotion_session
values ('1', '8:00', '08:00:29', '09:00:33', '1', '2018-11-16 13:22:17');
insert into sms_flash_promotion_session
values ('2', '10:00', '10:00:33', '11:00:33', '1', '2018-11-16 13:22:34');
insert into sms_flash_promotion_session
values ('3', '12:00', '12:00:00', '13:00:22', '1', '2018-11-16 13:22:37');
insert into sms_flash_promotion_session
values ('4', '14:00', '14:00:00', '15:00:00', '1', '2018-11-16 13:22:41');
insert into sms_flash_promotion_session
values ('5', '16:00', '16:00:00', '17:00:00', '1', '2018-11-16 13:22:45');
insert into sms_flash_promotion_session
values ('6', '18:00', '18:00:00', '19:00:00', '1', '2018-11-16 13:21:34');
insert into sms_flash_promotion_session
values ('7', '20:00', '20:00:33', '21:00:33', '0', '2018-11-16 13:22:55');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
drop table if exists sms_home_advertise;
create table sms_home_advertise (
    id          serial not null,
    name        varchar(100) default null,
    type        int          default null,
    pic         varchar(500) default null,
    start_time  date         default null,
    end_time    date         default null,
    status      int          default null,
    click_count int          default null,
    order_count int          default null,
    url         varchar(500) default null,
    note        varchar(500) default null,
    sort        int          default '0',
    primary key (id)
);
comment on table sms_home_advertise is '首页轮播广告表';

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
insert into sms_home_advertise
values ('2', '夏季大热促销', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '2018-11-01 14:01:37',
        '2018-11-15 14:01:37', '1', '0', '0', null, '夏季大热促销', '0');
insert into sms_home_advertise
values ('3', '夏季大热促销1', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '2018-11-13 14:01:37',
        '2018-11-13 14:01:37', '0', '0', '0', null, '夏季大热促销1', '0');
insert into sms_home_advertise
values ('4', '夏季大热促销2', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '2018-11-13 14:01:37',
        '2018-11-13 14:01:37', '1', '0', '0', null, '夏季大热促销2', '0');
insert into sms_home_advertise
values ('9', '电影推荐广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00',
        '2018-11-24 00:00:00', '1', '0', '0', 'www.baidu.com', '电影推荐广告', '100');
insert into sms_home_advertise
values ('10', '汽车促销广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00',
        '2018-11-24 00:00:00', '1', '0', '0', 'xxx', null, '99');
insert into sms_home_advertise
values ('11', '汽车推荐广告', '1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00',
        '2018-11-30 00:00:00', '1', '0', '0', 'xxx', null, '98');

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
drop table if exists sms_home_brand;
create table sms_home_brand (
    id               bigint not null,
    brand_id         bigint      default null,
    brand_name       varchar(64) default null,
    recommend_status int         default null,
    sort             int         default null,
    primary key (id)
);
comment on table sms_home_brand is '首页推荐品牌表';

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
insert into sms_home_brand
values ('1', '1', '万和', '1', '200');
insert into sms_home_brand
values ('2', '2', '三星', '1', '0');
insert into sms_home_brand
values ('6', '6', '小米', '1', '300');
insert into sms_home_brand
values ('8', '5', '方太', '1', '100');
insert into sms_home_brand
values ('31', '49', '七匹狼', '0', '0');
insert into sms_home_brand
values ('32', '50', '海澜之家', '1', '0');
insert into sms_home_brand
values ('33', '51', '苹果', '1', '0');
insert into sms_home_brand
values ('34', '2', '三星', '0', '0');
insert into sms_home_brand
values ('35', '3', '华为', '1', '0');
insert into sms_home_brand
values ('36', '4', '格力', '1', '0');
insert into sms_home_brand
values ('37', '5', '方太', '1', '0');
insert into sms_home_brand
values ('38', '1', '万和', '1', '0');
insert into sms_home_brand
values ('39', '21', 'OPPO', '1', '0');

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
drop table if exists sms_home_new_product;
create table sms_home_new_product (
    id               bigint not null,
    product_id       bigint      default null,
    product_name     varchar(64) default null,
    recommend_status int         default null,
    sort             int         default null,
    primary key (id)
);
comment on table sms_home_new_product is '新鲜好物表';

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
insert into sms_home_new_product
values ('2', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '200');
insert into sms_home_new_product
values ('8', '26', '华为 HUAWEI P20 ', '0', '0');
insert into sms_home_new_product
values ('9', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '0');
insert into sms_home_new_product
values ('10', '28', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '1', '0');
insert into sms_home_new_product
values ('11', '29', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '1', '0');
insert into sms_home_new_product
values ('12', '30', 'HLA海澜之家简约动物印花短袖T恤', '1', '0');

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
drop table if exists sms_home_recommend_product;
create table sms_home_recommend_product (
    id               bigint not null,
    product_id       bigint      default null,
    product_name     varchar(64) default null,
    recommend_status int         default null,
    sort             int         default null,
    primary key (id)
);
comment on table sms_home_recommend_product is '人气推荐商品表';

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
insert into sms_home_recommend_product
values ('3', '26', '华为 HUAWEI P20 ', '1', '0');
insert into sms_home_recommend_product
values ('4', '27', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '1', '0');
insert into sms_home_recommend_product
values ('5', '28', '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '1', '0');
insert into sms_home_recommend_product
values ('6', '29', 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', '1', '0');
insert into sms_home_recommend_product
values ('7', '30', 'HLA海澜之家简约动物印花短袖T恤', '1', '100');

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
drop table if exists sms_home_recommend_subject;
create table sms_home_recommend_subject (
    id               bigint not null,
    subject_id       bigint      default null,
    subject_name     varchar(64) default null,
    recommend_status int         default null,
    sort             int         default null,
    primary key (id)
);
comment on table sms_home_recommend_subject is '首页推荐专题表';

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
insert into sms_home_recommend_subject
values ('14', '1', 'polo衬衫的也时尚', '1', '0');
insert into sms_home_recommend_subject
values ('15', '2', '大牌手机低价秒', '1', '0');
insert into sms_home_recommend_subject
values ('16', '3', '晓龙845新品上市', '1', '0');
insert into sms_home_recommend_subject
values ('17', '4', '夏天应该穿什么', '1', '0');
insert into sms_home_recommend_subject
values ('18', '5', '夏季精选', '1', '100');
insert into sms_home_recommend_subject
values ('19', '6', '品牌手机降价', '1', '0');

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
drop table if exists ums_admin;
create table ums_admin (
    id          serial not null,
    username    varchar(64)  default null,
    password    varchar(64)  default null,
    icon        varchar(500) default null,
    email       varchar(100) default null,
    nick_name   varchar(200) default null,
    note        varchar(500) default null,
    create_time timestamp    default null,
    login_time  date         default null,
    status      int          default '1',
    primary key (id)
);
comment on table ums_admin is '后台用户表';

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
insert into ums_admin (username, password, icon, email, nick_name, note, create_time, login_time, status)
values ('admin', '$2a$10$.E1FokumK5GIXWgKlg.Hc.i/0/2.qdAwYFL1zc5QHdyzpXOr38RZO',
        'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg',
        'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-04-20 12:45:16', '1');

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
drop table if exists ums_admin_login_log;
create table ums_admin_login_log (
    id          serial not null,
    admin_id    bigint       default null,
    create_time timestamp    default null,
    ip          varchar(64)  default null,
    address     varchar(100) default null,
    user_agent  varchar(100) default null,
    primary key (id)
);
comment on table ums_admin_login_log is '后台用户登录日志表';

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
drop table if exists ums_admin_permission_relation;
create table ums_admin_permission_relation (
    id            serial not null,
    admin_id      bigint default null,
    permission_id bigint default null,
    type          int    default null,
    primary key (id)
);
comment on table ums_admin_permission_relation is '后台用户和权限关系表(除角色中定义的权限以外的加减权限)';

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
drop table if exists ums_admin_role_relation;
create table ums_admin_role_relation (
    id       serial not null,
    admin_id bigint default null,
    role_id  bigint default null,
    primary key (id),
    unique (admin_id, role_id)
);
comment on table ums_admin_role_relation is '后台用户和角色关系表';

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
insert into ums_admin_role_relation(admin_id, role_id)
values (1, 3);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
drop table if exists ums_growth_change_history;
create table ums_growth_change_history (
    id           serial not null,
    member_id    bigint       default null,
    create_time  date         default null,
    change_type  int          default null,
    change_count int          default null,
    operate_man  varchar(100) default null,
    operate_note varchar(200) default null,
    source_type  int          default null,
    primary key (id)
);
comment on table ums_growth_change_history is '成长值变化历史记录表';

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
insert into ums_growth_change_history (member_id, create_time, change_type, change_count, operate_man, operate_note, source_type)
values (1, '2018-08-29 17:16:35', '0', '1000', 'test', '测试使用', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
drop table if exists ums_integration_change_history;
create table ums_integration_change_history (
    id           serial not null,
    member_id    bigint       default null,
    create_time  date         default null,
    change_type  int          default null,
    change_count int          default null,
    operate_man  varchar(100) default null,
    operate_note varchar(200) default null,
    source_type  int          default null,
    primary key (id)
);
comment on table ums_integration_change_history is '积分变化历史记录表';

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
drop table if exists ums_integration_consume_setting;
create table ums_integration_consume_setting (
    id                    serial not null,
    deduction_per_amount  int default null,
    max_percent_per_order int default null,
    use_unit              int default null,
    coupon_status         int default null,
    primary key (id)
);
comment on table ums_integration_consume_setting is '积分消费设置';

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
insert into ums_integration_consume_setting (deduction_per_amount, max_percent_per_order, use_unit, coupon_status)
values (100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
drop table if exists ums_member;
create table ums_member (
    id                     serial not null,
    member_level_id        bigint       default null,
    username               varchar(64)  default null,
    password               varchar(64)  default null,
    nickname               varchar(64)  default null,
    phone                  varchar(64)  default null,
    status                 int          default null,
    create_time            date         default null,
    icon                   varchar(500) default null,
    gender                 int          default null,
    birthday               date         default null,
    city                   varchar(64)  default null,
    job                    varchar(100) default null,
    personalized_signature varchar(200) default null,
    source_type            int          default null,
    integration            int          default null,
    growth                 int          default null,
    lucky_count            int          default null,
    history_integration    int          default null,
    primary key (id),
    unique (username),
    unique (phone)
);
comment on table ums_member is '会员表';

-- ----------------------------
-- Records of ums_member
-- ----------------------------
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windir', '18061581849', '1', '2018-08-02 10:35:44', null,
        '1', '2009-06-01', '上海', '学生', 'test', null, '5000', null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', '1', '2018-08-03 16:46:38', null,
        null, null, null, null, null, null, null, null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', '1', '2018-11-12 14:12:04',
        null, null, null, null, null, null, null, null, null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', '1', '2018-11-12 14:12:38', null,
        null, null, null, null, null, null, null, null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', '1', '2018-11-12 14:13:09', null,
        null, null, null, null, null, null, null, null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', '1', '2018-11-12 14:21:39', null,
        null, null, null, null, null, null, null, null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', '1', '2018-11-12 14:22:00', null,
        null, null, null, null, null, null, null, null, null, null);
insert into ums_member (member_level_id, username, password, nickname, phone, status, create_time, icon, gender, birthday, city, job,
                        personalized_signature, source_type, integration, growth, lucky_count, history_integration)
values ('4', 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', '1', '2018-11-12 14:22:55', null,
        null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
drop table if exists ums_member_level;
create table ums_member_level (
    id                     serial not null,
    name                   varchar(100)   default null,
    growth_point           int            default null,
    default_status         int            default null,
    free_freight_point     decimal(10, 2) default null,
    comment_growth_point   int            default null,
    privilege_free_freight int            default null,
    privilege_sign_in      int            default null,
    privilege_comment      int            default null,
    privilege_promotion    int            default null,
    privilege_member_price int            default null,
    privilege_birthday     int            default null,
    note                   varchar(200)   default null,
    primary key (id)
);
comment on table ums_member_level is '会员等级表';

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
insert into ums_member_level (name, growth_point, default_status, free_freight_point, comment_growth_point,
                              privilege_free_freight, privilege_sign_in, privilege_comment, privilege_promotion,
                              privilege_member_price, privilege_birthday, note)
values ('黄金会员', '1000', '0', '199.00', '5', '1', '1', '1', '1', '1', '1', null);
insert into ums_member_level (name, growth_point, default_status, free_freight_point, comment_growth_point,
                              privilege_free_freight, privilege_sign_in, privilege_comment, privilege_promotion,
                              privilege_member_price, privilege_birthday, note)
values ('白金会员', '5000', '0', '99.00', '10', '1', '1', '1', '1', '1', '1', null);
insert into ums_member_level (name, growth_point, default_status, free_freight_point, comment_growth_point,
                              privilege_free_freight, privilege_sign_in, privilege_comment, privilege_promotion,
                              privilege_member_price, privilege_birthday, note)
values ('钻石会员', '15000', '0', '69.00', '15', '1', '1', '1', '1', '1', '1', null);
insert into ums_member_level (name, growth_point, default_status, free_freight_point, comment_growth_point,
                              privilege_free_freight, privilege_sign_in, privilege_comment, privilege_promotion,
                              privilege_member_price, privilege_birthday, note)
values ('普通会员', '1', '1', '199.00', '20', '1', '1', '1', '1', '0', '0', null);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
drop table if exists ums_member_login_log;
create table ums_member_login_log (
    id          serial not null,
    member_id   bigint      default null,
    create_time timestamp   default null,
    ip          varchar(64) default null,
    city        varchar(64) default null,
    login_type  int         default null,
    province    varchar(64) default null,
    primary key (id)
);
comment on table ums_member_login_log is '会员登录记录';

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
drop table if exists ums_member_member_tag_relation;
create table ums_member_member_tag_relation (
    id        serial not null,
    member_id bigint default null,
    tag_id    bigint default null,
    primary key (id)
);
comment on table ums_member_member_tag_relation is '用户和标签关系表';

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
drop table if exists ums_member_product_category_relation;
create table ums_member_product_category_relation (
    id                  serial not null,
    member_id           bigint default null,
    product_category_id bigint default null,
    primary key (id)
);
comment on table ums_member_product_category_relation is '会员与产品分类关系表（用户喜欢的分类）';

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
drop table if exists ums_member_receive_address;
create table ums_member_receive_address (
    id             serial not null,
    member_id      bigint       default null,
    name           varchar(100) default null,
    phone_number   varchar(64)  default null,
    default_status int          default null,
    post_code      varchar(100) default null,
    province       varchar(100) default null,
    city           varchar(100) default null,
    region         varchar(100) default null,
    detail_address varchar(128) default null,
    primary key (id)
);
comment on table ums_member_receive_address is '会员收货地址表';

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
insert into ums_member_receive_address (member_id, name, phone_number, default_status, post_code, province, city, region, detail_address)
values ('1', '大梨', '18033441849', '0', '518000', '广东省', '深圳市', '南山区', '科兴科学园');
insert into ums_member_receive_address (member_id, name, phone_number, default_status, post_code, province, city, region, detail_address)
values ('1', '大梨', '18033441849', '0', '518000', '广东省', '深圳市', '福田区', '清水河街道');
insert into ums_member_receive_address (member_id, name, phone_number, default_status, post_code, province, city, region, detail_address)
values ('1', '大梨', '18033441849', '1', '518000', '广东省', '深圳市', '福田区', '东晓街道');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
drop table if exists ums_member_rule_setting;
create table ums_member_rule_setting (
    id                  serial not null,
    continue_sign_day   int            default null,
    continue_sign_point int            default null,
    consume_per_point   decimal(10, 2) default null,
    low_order_amount    decimal(10, 2) default null,
    max_point_per_order int            default null,
    type                int            default null,
    primary key (id)
);
comment on table ums_member_rule_setting is '会员积分成长规则表';

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
drop table if exists ums_member_statistics_info;
create table ums_member_statistics_info (
    id                    serial not null,
    member_id             bigint         default null,
    consume_amount        decimal(10, 2) default null,
    order_count           int            default null,
    coupon_count          int            default null,
    comment_count         int            default null,
    return_order_count    int            default null,
    login_count           int            default null,
    attend_count          int            default null,
    fans_count            int            default null,
    collect_product_count int            default null,
    collect_subject_count int            default null,
    collect_topic_count   int            default null,
    collect_comment_count int            default null,
    invite_friend_count   int            default null,
    recent_order_time     date           default null,
    primary key (id)
);
comment on table ums_member_statistics_info is '会员统计信息';

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
drop table if exists ums_member_tag;
create table ums_member_tag (
    id                  serial not null,
    name                varchar(100)   default null,
    finish_order_count  int            default null,
    finish_order_amount decimal(10, 2) default null,
    primary key (id)
);
comment on table ums_member_tag is '用户标签表';

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
drop table if exists ums_member_task;
create table ums_member_task (
    id          serial not null,
    name        varchar(100) default null,
    growth      int          default null,
    integration int          default null,
    type        int          default null,
    primary key (id)
);
comment on table ums_member_task is '会员任务表';

-- ----------------------------
-- Table structure for ums_menu--
-- ----------------------------
drop table if exists ums_menu;
create table ums_menu (
    id          serial not null,
    parent_id   bigint       default null,
    create_time timestamp    default null,
    title       varchar(100) default null,
    level       int          default null,
    sort        int          default null,
    name        varchar(100) default null,
    icon        varchar(200) default null,
    hidden      int          default null,
    primary key (id)
);
comment on table ums_menu is '后台菜单表';

-- ----------------------------
-- Records of ums_menu--
-- ----------------------------
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('0', '2020-02-02 14:50:36', '商品', '0', '0', 'pms', 'product', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('1', '2020-02-02 14:51:50', '商品列表', '1', '0', 'product', 'product-list', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('1', '2020-02-02 14:52:44', '添加商品', '1', '0', 'addProduct', 'product-add', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('1', '2020-02-02 14:53:51', '商品分类', '1', '0', 'productCate', 'product-cate', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('1', '2020-02-02 14:54:51', '商品类型', '1', '0', 'productAttr', 'product-attr', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('1', '2020-02-02 14:56:29', '品牌管理', '1', '0', 'brand', 'product-brand', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('0', '2020-02-02 16:54:07', '订单', '0', '0', 'oms', 'order', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('7', '2020-02-02 16:55:18', '订单列表', '1', '0', 'order', 'product-list', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('7', '2020-02-02 16:56:46', '订单设置', '1', '0', 'orderSetting', 'order-setting', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('7', '2020-02-02 16:57:39', '退货申请处理', '1', '0', 'returnApply', 'order-return', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('7', '2020-02-02 16:59:40', '退货原因设置', '1', '0', 'returnReason', 'order-return-reason', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('0', '2020-02-04 16:18:00', '营销', '0', '0', 'sms', 'sms', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-04 16:19:22', '秒杀活动列表', '1', '0', 'flash', 'sms-flash', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-04 16:20:16', '优惠券列表', '1', '0', 'coupon', 'sms-coupon', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-07 16:22:38', '品牌推荐', '1', '0', 'homeBrand', 'product-brand', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-07 16:23:14', '新品推荐', '1', '0', 'homeNew', 'sms-new', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-07 16:26:38', '人气推荐', '1', '0', 'homeHot', 'sms-hot', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-07 16:28:16', '专题推荐', '1', '0', 'homeSubject', 'sms-subject', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('12', '2020-02-07 16:28:42', '广告列表', '1', '0', 'homeAdvertise', 'sms-ad', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('0', '2020-02-07 16:29:13', '权限', '0', '0', 'ums', 'ums', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('20', '2020-02-07 16:29:51', '用户列表', '1', '0', 'admin', 'ums-admin', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('20', '2020-02-07 16:30:13', '角色列表', '1', '0', 'role', 'ums-role', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('20', '2020-02-07 16:30:53', '菜单列表', '1', '0', 'menu', 'ums-menu', '0');
insert into ums_menu (parent_id, create_time, title, level, sort, name, icon, hidden)
values ('20', '2020-02-07 16:31:13', '资源列表', '1', '0', 'resource', 'ums-resource', '0');

-- ----------------------------
-- Table structure forums_permission--
-- ----------------------------
drop table if exists ums_permission;
create table ums_permission (
    id          serial not null,
    pid         bigint       default null,
    name        varchar(100) default null,
    value       varchar(200) default null,
    icon        varchar(500) default null,
    type        int          default null,
    uri         varchar(200) default null,
    status      int          default null,
    create_time timestamp    default null,
    sort        int          default null,
    primary key (id)
);
comment on table ums_permission is '后台用户权限表';

-- ----------------------------
-- Records of ums_permission--
-- ----------------------------
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('0', '商品', null, null, '0', null, '1', '2018-09-29 16:15:14', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('1', '商品列表', 'pms:product:read', null, '1', '/pms/product/index', '1', '2018-09-29 16:17:01', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('1', '添加商品', 'pms:product:create', null, '1', '/pms/product/add', '1', '2018-09-29 16:18:51', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('1', '商品分类', 'pms:productCategory:read', null, '1', '/pms/productCate/index', '1', '2018-09-29 16:23:07', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('1', '商品类型', 'pms:productAttribute:read', null, '1', '/pms/productAttr/index', '1', '2018-09-29 16:24:43', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('1', '品牌管理', 'pms:brand:read', null, '1', '/pms/brand/index', '1', '2018-09-29 16:25:45', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('2', '编辑商品', 'pms:product:update', null, '2', '/pms/product/updateProduct', '1', '2018-09-29 16:34:23', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('2', '删除商品', 'pms:product:delete', null, '2', '/pms/product/delete', '1', '2018-09-29 16:38:33', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('4', '添加商品分类', 'pms:productCategory:create', null, '2', '/pms/productCate/create', '1', '2018-09-29 16:43:23', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('4', '修改商品分类', 'pms:productCategory:update', null, '2', '/pms/productCate/update', '1', '2018-09-29 16:43:55', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('4', '删除商品分类', 'pms:productCategory:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:44:38', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('5', '添加商品类型', 'pms:productAttribute:create', null, '2', '/pms/productAttr/create', '1', '2018-09-29 16:45:25', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('5', '修改商品类型', 'pms:productAttribute:update', null, '2', '/pms/productAttr/update', '1', '2018-09-29 16:48:08', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('5', '删除商品类型', 'pms:productAttribute:delete', null, '2', '/pms/productAttr/delete', '1', '2018-09-29 16:48:44', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('6', '添加品牌', 'pms:brand:create', null, '2', '/pms/brand/add', '1', '2018-09-29 16:49:34', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('6', '修改品牌', 'pms:brand:update', null, '2', '/pms/brand/update', '1', '2018-09-29 16:50:55', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('6', '删除品牌', 'pms:brand:delete', null, '2', '/pms/brand/delete', '1', '2018-09-29 16:50:59', '0');
insert into ums_permission (pid, name, value, icon, type, uri, status, create_time, sort)
values ('0', '首页', null, null, '0', null, '1', '2018-09-29 16:51:57', '0');

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
drop table if exists ums_resource;
create table ums_resource (
    id          serial not null,
    create_time timestamp    default null,
    name        varchar(200) default null,
    url         varchar(200) default null,
    description varchar(500) default null,
    category_id bigint       default null,
    primary key (id)
);
comment on table ums_resource is '后台资源表';

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-04 17:04:55', '商品品牌管理', '/brand/**', null, '1');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/**', null, '1');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', null, '1');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', null, '1');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-04 17:09:16', '商品管理', '/product/**', null, '1');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-04 17:09:53', '商品库存管理', '/sku/**', null, '1');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-05 14:43:37', '订单管理', '/order/**', '', '2');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', '2');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', '2');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', '2');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', '2');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', '3');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:44:56', ' 商品优选管理', '/preferenceArea/**', '', '5');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', '5');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-08-24 13:43:54', '登录后获取用户信息', '/admin/info', '后台用户登录需要配置', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2020-08-24 13:44:37', '后台用户登出', '/admin/logout', '后台用户登出需要配置', '4');
insert into ums_resource (create_time, name, url, description, category_id)
values ('2021-08-03 00:17:30', '会员用户等级列表', '/memberLevel/list', '会员用户等级列表', '4');

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
drop table if exists ums_resource_category;
create table ums_resource_category (
    id          serial not null,
    create_time timestamp    default null,
    name        varchar(200) default null,
    sort        int          default null,
    primary key (id)
);
comment on table ums_resource_category is '资源分类表';

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
insert into ums_resource_category (create_time, name, sort)
values ('2020-02-05 10:21:44', '商品模块', '0');
insert into ums_resource_category (create_time, name, sort)
values ('2020-02-05 10:22:34', '订单模块', '0');
insert into ums_resource_category (create_time, name, sort)
values ('2020-02-05 10:22:48', '营销模块', '0');
insert into ums_resource_category (create_time, name, sort)
values ('2020-02-05 10:23:04', '权限模块', '0');
insert into ums_resource_category (create_time, name, sort)
values ('2020-02-07 16:34:27', '内容模块', '0');
insert into ums_resource_category (create_time, name, sort)
values ('2020-02-07 16:35:49', '其他模块', '0');

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
drop table if exists ums_role;
create table ums_role (
    id          serial not null,
    name        varchar(100) default null,
    description varchar(500) default null,
    admin_count int          default null,
    create_time timestamp    default null,
    status      int          default '1',
    sort        int          default '0',
    primary key (id)
);
comment on table ums_role is '后台用户角色表';

-- ----------------------------
-- Records of ums_role
-- ----------------------------
insert into ums_role (name, description, admin_count, create_time, status, sort)
values ('商品管理员', '只能查看及操作商品', '0', '2020-02-03 16:50:37', '1', '0');
insert into ums_role (name, description, admin_count, create_time, status, sort)
values ('订单管理员', '只能查看及操作订单', '0', '2018-09-30 15:53:45', '1', '0');
insert into ums_role (name, description, admin_count, create_time, status, sort)
values ('超级管理员', '拥有所有查看和操作功能', '0', '2020-02-02 15:11:05', '1', '0');

-- ----------------------------
-- Table structure forums_role_menu_relation
-- ----------------------------
drop table if exists ums_role_menu_relation;
create table ums_role_menu_relation (
    id      serial not null,
    role_id bigint default null,
    menu_id bigint default null,
    primary key (id),
    unique (role_id, menu_id)
);
comment on table ums_role_menu_relation is '后台角色菜单关系表';

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
insert into ums_role_menu_relation (role_id, menu_id)
values ('1', '1');
insert into ums_role_menu_relation (role_id, menu_id)
values ('1', '2');
insert into ums_role_menu_relation (role_id, menu_id)
values ('1', '3');
insert into ums_role_menu_relation (role_id, menu_id)
values ('1', '4');
insert into ums_role_menu_relation (role_id, menu_id)
values ('1', '5');
insert into ums_role_menu_relation (role_id, menu_id)
values ('1', '6');
insert into ums_role_menu_relation (role_id, menu_id)
values ('2', '7');
insert into ums_role_menu_relation (role_id, menu_id)
values ('2', '8');
insert into ums_role_menu_relation (role_id, menu_id)
values ('2', '9');
insert into ums_role_menu_relation (role_id, menu_id)
values ('2', '10');
insert into ums_role_menu_relation (role_id, menu_id)
values ('2', '11');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '1');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '2');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '3');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '4');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '5');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '6');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '7');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '8');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '9');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '10');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '11');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '12');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '13');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '14');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '16');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '17');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '18');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '19');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '20');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '21');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '22');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '23');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '24');
insert into ums_role_menu_relation (role_id, menu_id)
values ('3', '25');

-- ----------------------------
-- Table structure forums_role_permission_relation
-- ----------------------------
drop table if exists ums_role_permission_relation;
create table ums_role_permission_relation (
    id            serial not null,
    role_id       bigint default null,
    permission_id bigint default null,
    primary key (id),
    unique (role_id, permission_id)
);
comment on table ums_role_permission_relation is '后台用户角色和权限关系表';

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
insert into ums_role_permission_relation (role_id, permission_id)
values ('1', '1');
insert into ums_role_permission_relation (role_id, permission_id)
values ('1', '2');
insert into ums_role_permission_relation (role_id, permission_id)
values ('1', '3');
insert into ums_role_permission_relation (role_id, permission_id)
values ('1', '7');
insert into ums_role_permission_relation (role_id, permission_id)
values ('1', '8');
insert into ums_role_permission_relation (role_id, permission_id)
values ('2', '4');
insert into ums_role_permission_relation (role_id, permission_id)
values ('2', '9');
insert into ums_role_permission_relation (role_id, permission_id)
values ('2', '10');
insert into ums_role_permission_relation (role_id, permission_id)
values ('2', '11');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '5');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '6');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '12');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '13');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '14');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '15');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '16');
insert into ums_role_permission_relation (role_id, permission_id)
values ('3', '17');

-- ----------------------------
-- Table structure forums_role_resource_relation
-- ----------------------------
drop table if exists ums_role_resource_relation;
create table ums_role_resource_relation (
    id          serial not null,
    role_id     bigint default null,
    resource_id bigint default null,
    primary key (id)
);
comment on table ums_role_resource_relation is '后台角色资源关系表';

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '1');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '2');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '3');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '4');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '5');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '6');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '23');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '24');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '31');
insert into ums_role_resource_relation (role_id, resource_id)
values ('1', '32');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '8');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '9');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '10');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '11');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '12');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '31');
insert into ums_role_resource_relation (role_id, resource_id)
values ('2', '32');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '1');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '2');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '3');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '4');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '5');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '6');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '8');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '9');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '10');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '11');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '12');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '13');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '14');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '15');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '16');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '17');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '18');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '19');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '20');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '21');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '22');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '23');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '24');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '25');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '26');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '27');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '28');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '29');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '31');
insert into ums_role_resource_relation (role_id, resource_id)
values ('3', '32');
