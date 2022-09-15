package com.macro.mall.portal.service.impl;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.util.StrUtil;
import com.github.pagehelper.PageHelper;
import com.macro.mall.mapper.PmsBrandMapper;
import com.macro.mall.mapper.PmsProductAttributeMapper;
import com.macro.mall.mapper.PmsProductAttributeValueMapper;
import com.macro.mall.mapper.PmsProductCategoryMapper;
import com.macro.mall.mapper.PmsProductFullReductionMapper;
import com.macro.mall.mapper.PmsProductLadderMapper;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.mapper.PmsSkuStockMapper;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductAttribute;
import com.macro.mall.model.PmsProductAttributeExample;
import com.macro.mall.model.PmsProductAttributeValue;
import com.macro.mall.model.PmsProductAttributeValueExample;
import com.macro.mall.model.PmsProductCategory;
import com.macro.mall.model.PmsProductCategoryExample;
import com.macro.mall.model.PmsProductExample;
import com.macro.mall.model.PmsProductFullReduction;
import com.macro.mall.model.PmsProductFullReductionExample;
import com.macro.mall.model.PmsProductLadder;
import com.macro.mall.model.PmsProductLadderExample;
import com.macro.mall.model.PmsSkuStock;
import com.macro.mall.model.PmsSkuStockExample;
import com.macro.mall.portal.dao.PortalProductDao;
import com.macro.mall.portal.domain.PmsPortalProductDetail;
import com.macro.mall.portal.domain.PmsProductCategoryNode;
import com.macro.mall.portal.service.PmsPortalProductService;
import lombok.AllArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 前台订单管理Service实现类
 */
@AllArgsConstructor
@Service
public class PmsPortalProductServiceImpl implements PmsPortalProductService {

    private final PmsProductMapper productMapper;
    private final PmsProductCategoryMapper productCategoryMapper;
    private final PmsBrandMapper brandMapper;
    private final PmsProductAttributeMapper productAttributeMapper;
    private final PmsProductAttributeValueMapper productAttributeValueMapper;
    private final PmsSkuStockMapper skuStockMapper;
    private final PmsProductLadderMapper productLadderMapper;
    private final PmsProductFullReductionMapper productFullReductionMapper;
    private final PortalProductDao portalProductDao;

    @Override
    public List<PmsProduct> search(
            final String keyword,
            final Long brandId,
            final Long productCategoryId,
            final Integer pageNum,
            final Integer pageSize,
            final Integer sort) {
        PageHelper.startPage(pageNum, pageSize);
        final PmsProductExample example = new PmsProductExample();
        final PmsProductExample.Criteria criteria = example.createCriteria();
        criteria.andDeleteStatusEqualTo(0);
        if (StrUtil.isNotEmpty(keyword)) {
            criteria.andNameLike("%" + keyword + "%");
        }
        if (brandId != null) {
            criteria.andBrandIdEqualTo(brandId);
        }
        if (productCategoryId != null) {
            criteria.andProductCategoryIdEqualTo(productCategoryId);
        }
        //1->按新品；2->按销量；3->价格从低到高；4->价格从高到低
        if (sort == 1) {
            example.setOrderByClause("id desc");
        } else if (sort == 2) {
            example.setOrderByClause("sale desc");
        } else if (sort == 3) {
            example.setOrderByClause("price asc");
        } else if (sort == 4) {
            example.setOrderByClause("price desc");
        }
        return productMapper.selectByExample(example);
    }

    @Override
    public List<PmsProductCategoryNode> categoryTreeList() {
        final PmsProductCategoryExample example = new PmsProductCategoryExample();
        final List<PmsProductCategory> allList = productCategoryMapper.selectByExample(example);
        return allList.stream()
                .filter(item -> item.getParentId().equals(0L))
                .map(item -> covert(item, allList))
                .collect(Collectors.toList());
    }

    @Override
    public PmsPortalProductDetail detail(final Long id) {
        final PmsPortalProductDetail result = new PmsPortalProductDetail();
        //获取商品信息
        final PmsProduct product = productMapper.selectByPrimaryKey(id);
        result.setProduct(product);
        //获取品牌信息
        final PmsBrand brand = brandMapper.selectByPrimaryKey(product.getBrandId());
        result.setBrand(brand);
        //获取商品属性信息
        final PmsProductAttributeExample attributeExample = new PmsProductAttributeExample();
        attributeExample.createCriteria().andProductAttributeCategoryIdEqualTo(product.getProductAttributeCategoryId());
        final List<PmsProductAttribute> productAttributeList = productAttributeMapper.selectByExample(attributeExample);
        result.setProductAttributeList(productAttributeList);
        //获取商品属性值信息
        if (CollUtil.isNotEmpty(productAttributeList)) {
            final List<Long> attributeIds = productAttributeList.stream().map(PmsProductAttribute::getId).collect(Collectors.toList());
            final PmsProductAttributeValueExample attributeValueExample = new PmsProductAttributeValueExample();
            attributeValueExample.createCriteria()
                    .andProductIdEqualTo(product.getId())
                    .andProductAttributeIdIn(attributeIds);
            final List<PmsProductAttributeValue> productAttributeValueList = productAttributeValueMapper.selectByExample(attributeValueExample);
            result.setProductAttributeValueList(productAttributeValueList);
        }
        //获取商品SKU库存信息
        final PmsSkuStockExample skuExample = new PmsSkuStockExample();
        skuExample.createCriteria().andProductIdEqualTo(product.getId());
        final List<PmsSkuStock> skuStockList = skuStockMapper.selectByExample(skuExample);
        result.setSkuStockList(skuStockList);
        //商品阶梯价格设置
        if (product.getPromotionType() == 3) {
            final PmsProductLadderExample ladderExample = new PmsProductLadderExample();
            ladderExample.createCriteria().andProductIdEqualTo(product.getId());
            final List<PmsProductLadder> productLadderList = productLadderMapper.selectByExample(ladderExample);
            result.setProductLadderList(productLadderList);
        }
        //商品满减价格设置
        if (product.getPromotionType() == 4) {
            final PmsProductFullReductionExample fullReductionExample = new PmsProductFullReductionExample();
            fullReductionExample.createCriteria().andProductIdEqualTo(product.getId());
            final List<PmsProductFullReduction> productFullReductionList = productFullReductionMapper.selectByExample(fullReductionExample);
            result.setProductFullReductionList(productFullReductionList);
        }
        //商品可用优惠券
        result.setCouponList(portalProductDao.getAvailableCouponList(product.getId(), product.getProductCategoryId()));
        return result;
    }


    /**
     * 初始对象转化为节点对象
     */
    private PmsProductCategoryNode covert(final PmsProductCategory item, final List<PmsProductCategory> allList) {
        final PmsProductCategoryNode node = new PmsProductCategoryNode();
        BeanUtils.copyProperties(item, node);
        final List<PmsProductCategoryNode> children = allList.stream()
                .filter(subItem -> subItem.getParentId().equals(item.getId()))
                .map(subItem -> covert(subItem, allList))
                .collect(Collectors.toList());
        node.setChildren(children);
        return node;
    }
}
