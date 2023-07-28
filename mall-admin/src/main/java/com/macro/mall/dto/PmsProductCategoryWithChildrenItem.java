package com.macro.mall.dto;

import com.macro.mall.model.PmsProductCategory;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class PmsProductCategoryWithChildrenItem extends PmsProductCategory {

    @ApiModelProperty("子级分类")
    private List<PmsProductCategory> children;
}
