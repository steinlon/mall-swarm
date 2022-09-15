package com.macro.mall.portal.service.impl;

import com.macro.mall.model.UmsMember;
import com.macro.mall.portal.domain.MemberProductCollection;
import com.macro.mall.portal.repository.MemberProductCollectionRepository;
import com.macro.mall.portal.service.MemberCollectionService;
import com.macro.mall.portal.service.UmsMemberService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

/**
 * 会员收藏Service实现类
 */
@AllArgsConstructor
@Service
public class MemberCollectionServiceImpl implements MemberCollectionService {

    private final MemberProductCollectionRepository productCollectionRepository;
    private final UmsMemberService memberService;

    @Override
    public int add(final MemberProductCollection productCollection) {
        int count = 0;
        final UmsMember member = memberService.getCurrentMember();
        productCollection.setMemberId(member.getId());
        productCollection.setMemberNickname(member.getNickname());
        productCollection.setMemberIcon(member.getIcon());
        final MemberProductCollection findCollection = productCollectionRepository
                .findByMemberIdAndProductId(productCollection.getMemberId(), productCollection.getProductId());
        if (findCollection == null) {
            productCollectionRepository.save(productCollection);
            count = 1;
        }
        return count;
    }

    @Override
    public int delete(final Long productId) {
        final UmsMember member = memberService.getCurrentMember();
        return productCollectionRepository.deleteByMemberIdAndProductId(member.getId(), productId);
    }

    @Override
    public Page<MemberProductCollection> list(final Integer pageNum, final Integer pageSize) {
        final UmsMember member = memberService.getCurrentMember();
        final Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        return productCollectionRepository.findByMemberId(member.getId(), pageable);
    }

    @Override
    public MemberProductCollection detail(final Long productId) {
        final UmsMember member = memberService.getCurrentMember();
        return productCollectionRepository.findByMemberIdAndProductId(member.getId(), productId);
    }

    @Override
    public void clear() {
        final UmsMember member = memberService.getCurrentMember();
        productCollectionRepository.deleteAllByMemberId(member.getId());
    }
}
