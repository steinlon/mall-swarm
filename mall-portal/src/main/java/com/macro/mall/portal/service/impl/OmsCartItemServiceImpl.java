package com.macro.mall.portal.service.impl;

import cn.hutool.core.collection.CollUtil;
import com.google.common.collect.Lists;
import com.macro.mall.mapper.OmsCartItemMapper;
import com.macro.mall.model.OmsCartItem;
import com.macro.mall.model.OmsCartItemExample;
import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.dao.PortalProductDao;
import com.macro.mall.portal.domain.CartProduct;
import com.macro.mall.portal.domain.CartPromotionItem;
import com.macro.mall.portal.service.OmsCartItemService;
import com.macro.mall.portal.service.OmsPromotionService;
import com.macro.mall.portal.service.UmsMemberService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 购物车管理Service实现类
 */
@AllArgsConstructor
@Service
public class OmsCartItemServiceImpl implements OmsCartItemService {

    private final OmsCartItemMapper cartItemMapper;
    private final PortalProductDao productDao;
    private final OmsPromotionService promotionService;
    private final UmsMemberService memberService;

    @Override
    public int add(final OmsCartItem cartItem) {
        final UmsMember currentMember = memberService.getCurrentMember();
        cartItem.setMemberId(currentMember.getId());
        cartItem.setMemberNickname(currentMember.getNickname());
        cartItem.setDeleteStatus(0);
        final OmsCartItem existCartItem = getCartItem(cartItem);
        if (existCartItem == null) {
            cartItem.setCreateDate(new Date());
            return cartItemMapper.insert(cartItem);
        } else {
            cartItem.setModifyDate(new Date());
            existCartItem.setQuantity(existCartItem.getQuantity() + cartItem.getQuantity());
            return cartItemMapper.updateByPrimaryKey(existCartItem);
        }
    }

    /**
     * 根据会员id,商品id和规格获取购物车中商品
     */
    private OmsCartItem getCartItem(final OmsCartItem cartItem) {
        final OmsCartItemExample example = new OmsCartItemExample();
        OmsCartItemExample.Criteria criteria = example.createCriteria().andMemberIdEqualTo(cartItem.getMemberId())
                .andProductIdEqualTo(cartItem.getProductId()).andDeleteStatusEqualTo(0);
        if (!StringUtils.isEmpty(cartItem.getProductSkuId())) {
            criteria.andProductSkuIdEqualTo(cartItem.getProductSkuId());
        }
        final List<OmsCartItem> cartItemList = cartItemMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(cartItemList)) {
            return cartItemList.get(0);
        }
        return null;
    }

    @Override
    public List<OmsCartItem> list(final Long memberId) {
        final OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andMemberIdEqualTo(memberId);
        return cartItemMapper.selectByExample(example);
    }

    @Override
    public List<CartPromotionItem> listPromotion(final Long memberId, final List<Long> cartIds) {
        List<OmsCartItem> cartItemList = list(memberId);
        if (CollUtil.isNotEmpty(cartIds)) {
            cartItemList = cartItemList.stream().filter(item -> cartIds.contains(item.getId())).collect(Collectors.toList());
        }
        final List<CartPromotionItem> cartPromotionItemList = Lists.newArrayList();
        if (!CollectionUtils.isEmpty(cartItemList)) {
            cartPromotionItemList.addAll(promotionService.calcCartPromotion(cartItemList));
        }
        return cartPromotionItemList;
    }

    @Override
    public int updateQuantity(final Long id, final Long memberId, final Integer quantity) {
        final OmsCartItem cartItem = new OmsCartItem();
        cartItem.setQuantity(quantity);
        final OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andDeleteStatusEqualTo(0)
                .andIdEqualTo(id).andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(cartItem, example);
    }

    @Override
    public int delete(final Long memberId, final List<Long> ids) {
        final OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        final OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andIdIn(ids).andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record, example);
    }

    @Override
    public CartProduct getCartProduct(final Long productId) {
        return productDao.getCartProduct(productId);
    }

    @Override
    public int updateAttr(final OmsCartItem cartItem) {
        //删除原购物车信息
        final OmsCartItem updateCart = new OmsCartItem();
        updateCart.setId(cartItem.getId());
        updateCart.setModifyDate(new Date());
        updateCart.setDeleteStatus(1);
        cartItemMapper.updateByPrimaryKeySelective(updateCart);
        cartItem.setId(null);
        add(cartItem);
        return 1;
    }

    @Override
    public int clear(final Long memberId) {
        final OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        final OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record, example);
    }
}
