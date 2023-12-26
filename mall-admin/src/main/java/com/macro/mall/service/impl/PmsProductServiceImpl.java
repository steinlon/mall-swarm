package com.macro.mall.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.dao.CmsPreferenceAreaProductRelationDao;
import com.macro.mall.dao.CmsSubjectProductRelationDao;
import com.macro.mall.dao.PmsMemberPriceDao;
import com.macro.mall.dao.PmsProductAttributeValueDao;
import com.macro.mall.dao.PmsProductDao;
import com.macro.mall.dao.PmsProductFullReductionDao;
import com.macro.mall.dao.PmsProductLadderDao;
import com.macro.mall.dao.PmsProductVertifyRecordDao;
import com.macro.mall.dao.PmsSkuStockDao;
import com.macro.mall.dto.PmsProductParam;
import com.macro.mall.dto.PmsProductQueryParam;
import com.macro.mall.dto.PmsProductResult;
import com.macro.mall.mapper.CmsPreferenceAreaProductRelationMapper;
import com.macro.mall.mapper.CmsSubjectProductRelationMapper;
import com.macro.mall.mapper.PmsMemberPriceMapper;
import com.macro.mall.mapper.PmsProductAttributeValueMapper;
import com.macro.mall.mapper.PmsProductFullReductionMapper;
import com.macro.mall.mapper.PmsProductLadderMapper;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.mapper.PmsSkuStockMapper;
import com.macro.mall.model.CmsPreferenceAreaProductRelationExample;
import com.macro.mall.model.CmsSubjectProductRelationExample;
import com.macro.mall.model.PmsMemberPriceExample;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductAttributeValueExample;
import com.macro.mall.model.PmsProductExample;
import com.macro.mall.model.PmsProductFullReductionExample;
import com.macro.mall.model.PmsProductLadderExample;
import com.macro.mall.model.PmsProductVertifyRecord;
import com.macro.mall.model.PmsSkuStock;
import com.macro.mall.model.PmsSkuStockExample;
import com.macro.mall.service.PmsProductService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 商品管理Service实现类
 */
@Slf4j
@AllArgsConstructor
@Service
public class PmsProductServiceImpl implements PmsProductService {

    private final PmsProductMapper productMapper;
    private final PmsMemberPriceDao memberPriceDao;
    private final PmsMemberPriceMapper memberPriceMapper;
    private final PmsProductLadderDao productLadderDao;
    private final PmsProductLadderMapper productLadderMapper;
    private final PmsProductFullReductionDao productFullReductionDao;
    private final PmsProductFullReductionMapper productFullReductionMapper;
    private final PmsSkuStockDao skuStockDao;
    private final PmsSkuStockMapper skuStockMapper;
    private final PmsProductAttributeValueDao productAttributeValueDao;
    private final PmsProductAttributeValueMapper productAttributeValueMapper;
    private final CmsSubjectProductRelationDao subjectProductRelationDao;
    private final CmsSubjectProductRelationMapper subjectProductRelationMapper;
    private final CmsPreferenceAreaProductRelationDao preferenceAreaProductRelationDao;
    private final CmsPreferenceAreaProductRelationMapper preferenceAreaProductRelationMapper;
    private final PmsProductDao productDao;
    private final PmsProductVertifyRecordDao productVertifyRecordDao;

    @Override
    public int create(final PmsProductParam productParam) {
        //创建商品
        int success = 0;
        productParam.setId(null);
        productMapper.insertSelective(productParam);
        //根据促销类型设置价格：会员价格、阶梯价格、满减价格
        final Long productId = productParam.getId();
        //会员价格
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), productId);
        //阶梯价格
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), productId);
        //满减价格
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), productId);
        //处理sku的编码
        handleSkuStockCode(productParam.getSkuStockList(), productId);
        //添加sku库存信息
        relateAndInsertList(skuStockDao, productParam.getSkuStockList(), productId);
        //添加商品参数,添加自定义商品规格
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), productId);
        //关联专题
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), productId);
        //关联优选
        relateAndInsertList(preferenceAreaProductRelationDao, productParam.getPreferenceAreaProductRelationList(), productId);
        success = 1;
        return success;
    }

    private void handleSkuStockCode(final List<PmsSkuStock> skuStockList, final Long productId) {
        if (CollectionUtils.isEmpty(skuStockList)) {
            return;
        }
        for (int i = 0; i < skuStockList.size(); i++) {
            final PmsSkuStock skuStock = skuStockList.get(i);
            if (!StringUtils.hasLength(skuStock.getSkuCode())) {
                final SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                final StringBuilder sb = new StringBuilder();
                //日期
                sb.append(sdf.format(new Date()));
                //四位商品id
                sb.append(String.format("%04d", productId));
                //三位索引id
                sb.append(String.format("%03d", i + 1));
                skuStock.setSkuCode(sb.toString());
            }
        }
    }

    @Override
    public PmsProductResult getUpdateInfo(final Long id) {
        return productDao.getUpdateInfo(id);
    }

    @Override
    public int update(final Long id, final PmsProductParam productParam) {
        int success = 0;
        //更新商品信息
        productParam.setId(id);
        productMapper.updateByPrimaryKeySelective(productParam);
        //会员价格
        PmsMemberPriceExample pmsMemberPriceExample = new PmsMemberPriceExample();
        pmsMemberPriceExample.createCriteria().andProductIdEqualTo(id);
        memberPriceMapper.deleteByExample(pmsMemberPriceExample);
        relateAndInsertList(memberPriceDao, productParam.getMemberPriceList(), id);
        //阶梯价格
        PmsProductLadderExample ladderExample = new PmsProductLadderExample();
        ladderExample.createCriteria().andProductIdEqualTo(id);
        productLadderMapper.deleteByExample(ladderExample);
        relateAndInsertList(productLadderDao, productParam.getProductLadderList(), id);
        //满减价格
        PmsProductFullReductionExample fullReductionExample = new PmsProductFullReductionExample();
        fullReductionExample.createCriteria().andProductIdEqualTo(id);
        productFullReductionMapper.deleteByExample(fullReductionExample);
        relateAndInsertList(productFullReductionDao, productParam.getProductFullReductionList(), id);
        //修改sku库存信息
        handleUpdateSkuStockList(id, productParam);
        //修改商品参数,添加自定义商品规格
        PmsProductAttributeValueExample productAttributeValueExample = new PmsProductAttributeValueExample();
        productAttributeValueExample.createCriteria().andProductIdEqualTo(id);
        productAttributeValueMapper.deleteByExample(productAttributeValueExample);
        relateAndInsertList(productAttributeValueDao, productParam.getProductAttributeValueList(), id);
        //关联专题
        CmsSubjectProductRelationExample subjectProductRelationExample = new CmsSubjectProductRelationExample();
        subjectProductRelationExample.createCriteria().andProductIdEqualTo(id);
        subjectProductRelationMapper.deleteByExample(subjectProductRelationExample);
        relateAndInsertList(subjectProductRelationDao, productParam.getSubjectProductRelationList(), id);
        //关联优选
        CmsPreferenceAreaProductRelationExample preferenceAreaExample = new CmsPreferenceAreaProductRelationExample();
        preferenceAreaExample.createCriteria().andProductIdEqualTo(id);
        preferenceAreaProductRelationMapper.deleteByExample(preferenceAreaExample);
        relateAndInsertList(preferenceAreaProductRelationDao, productParam.getPreferenceAreaProductRelationList(), id);
        success = 1;
        return success;
    }

    private void handleUpdateSkuStockList(final Long id, final PmsProductParam productParam) {
        //当前的sku信息
        final List<PmsSkuStock> currSkuList = productParam.getSkuStockList();
        //当前没有sku直接删除
        if (CollUtil.isEmpty(currSkuList)) {
            final PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
            skuStockExample.createCriteria().andProductIdEqualTo(id);
            skuStockMapper.deleteByExample(skuStockExample);
            return;
        }
        //获取初始sku信息
        final PmsSkuStockExample skuStockExample = new PmsSkuStockExample();
        skuStockExample.createCriteria().andProductIdEqualTo(id);
        final List<PmsSkuStock> oriStuList = skuStockMapper.selectByExample(skuStockExample);
        //获取新增sku信息
        final List<PmsSkuStock> insertSkuList = currSkuList.stream().filter(item -> item.getId() == null).collect(Collectors.toList());
        //获取需要更新的sku信息
        final List<PmsSkuStock> updateSkuList = currSkuList.stream().filter(item -> item.getId() != null).collect(Collectors.toList());
        final List<Long> updateSkuIds = updateSkuList.stream().map(PmsSkuStock::getId).collect(Collectors.toList());
        //获取需要删除的sku信息
        final List<PmsSkuStock> removeSkuList = oriStuList.stream().filter(item -> !updateSkuIds.contains(item.getId())).collect(Collectors.toList());
        handleSkuStockCode(insertSkuList, id);
        handleSkuStockCode(updateSkuList, id);
        //新增sku
        if (CollUtil.isNotEmpty(insertSkuList)) {
            relateAndInsertList(skuStockDao, insertSkuList, id);
        }
        //删除sku
        if (CollUtil.isNotEmpty(removeSkuList)) {
            final List<Long> removeSkuIds = removeSkuList.stream().map(PmsSkuStock::getId).collect(Collectors.toList());
            final PmsSkuStockExample removeExample = new PmsSkuStockExample();
            removeExample.createCriteria().andIdIn(removeSkuIds);
            skuStockMapper.deleteByExample(removeExample);
        }
        //修改sku
        if (CollUtil.isNotEmpty(updateSkuList)) {
            for (PmsSkuStock pmsSkuStock : updateSkuList) {
                skuStockMapper.updateByPrimaryKeySelective(pmsSkuStock);
            }
        }

    }

    @Override
    public List<PmsProduct> list(final PmsProductQueryParam productQueryParam, final Integer pageSize, final Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        final PmsProductExample productExample = new PmsProductExample();
        final PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (productQueryParam.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }
        if (productQueryParam.getVerifyStatus() != null) {
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }
        if (StringUtils.hasLength(productQueryParam.getKeyword())) {
            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
        }
        if (StringUtils.hasLength(productQueryParam.getProductSn())) {
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }
        if (productQueryParam.getBrandId() != null) {
            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
        }
        if (productQueryParam.getProductCategoryId() != null) {
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }
        return productMapper.selectByExample(productExample);
    }

    @Override
    public int updateVerifyStatus(final List<Long> ids, final Integer verifyStatus, final String detail) {
        final PmsProduct product = new PmsProduct();
        product.setVerifyStatus(verifyStatus);
        final PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        final List<PmsProductVertifyRecord> list = new ArrayList<>();
        final int count = productMapper.updateByExampleSelective(product, example);
        //修改完审核状态后插入审核记录
        for (Long id : ids) {
            PmsProductVertifyRecord record = new PmsProductVertifyRecord();
            record.setProductId(id);
            record.setCreateTime(new Date());
            record.setDetail(detail);
            record.setStatus(verifyStatus);
            record.setVertifyMan("test");
            list.add(record);
        }
        productVertifyRecordDao.insertList(list);
        return count;
    }

    @Override
    public int updatePublishStatus(final List<Long> ids, final Integer publishStatus) {
        final PmsProduct record = new PmsProduct();
        record.setPublishStatus(publishStatus);
        final PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateRecommendStatus(final List<Long> ids, final Integer recommendStatus) {
        final PmsProduct record = new PmsProduct();
        record.setRecommandStatus(recommendStatus);
        final PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateNewStatus(final List<Long> ids, final Integer newStatus) {
        final PmsProduct record = new PmsProduct();
        record.setNewStatus(newStatus);
        final PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public int updateDeleteStatus(final List<Long> ids, final Integer deleteStatus) {
        final PmsProduct record = new PmsProduct();
        record.setDeleteStatus(deleteStatus);
        final PmsProductExample example = new PmsProductExample();
        example.createCriteria().andIdIn(ids);
        return productMapper.updateByExampleSelective(record, example);
    }

    @Override
    public List<PmsProduct> list(final String keyword) {
        final PmsProductExample productExample = new PmsProductExample();
        final PmsProductExample.Criteria criteria = productExample.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (StringUtils.hasLength(keyword)) {
            criteria.andNameLike("%" + keyword + "%");
            productExample.or().andDeleteStatusEqualTo(0).andProductSnLike("%" + keyword + "%");
        }
        return productMapper.selectByExample(productExample);
    }

    /**
     * 建立和插入关系表操作
     */
    private void relateAndInsertList(final Object dao, final List<?> dataList, final Long productId) {
        try {
            if (CollectionUtils.isEmpty(dataList)) {
                return;
            }
            for (Object item : dataList) {
                final Method setId = item.getClass().getMethod("setId", Long.class);
                setId.invoke(item, (Long) null);
                final Method setProductId = item.getClass().getMethod("setProductId", Long.class);
                setProductId.invoke(item, productId);
            }
            final Method insertList = dao.getClass().getMethod("insertList", List.class);
            insertList.invoke(dao, dataList);
        } catch (Exception e) {
            log.warn("创建产品出错:{}", e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

}
