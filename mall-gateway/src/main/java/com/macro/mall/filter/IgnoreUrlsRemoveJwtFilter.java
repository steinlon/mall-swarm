package com.macro.mall.filter;

import com.macro.mall.common.constant.AuthConstant;
import com.macro.mall.config.IgnoreUrlsConfig;
import lombok.AllArgsConstructor;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;
import org.springframework.web.server.ServerWebExchange;
import org.springframework.web.server.WebFilter;
import org.springframework.web.server.WebFilterChain;
import reactor.core.publisher.Mono;

import java.net.URI;
import java.util.List;

/**
 * 白名单路径访问时需要移除JWT请求头
 */
@AllArgsConstructor
@Component
public class IgnoreUrlsRemoveJwtFilter implements WebFilter {

    private final IgnoreUrlsConfig ignoreUrlsConfig;

    @Override
    public Mono<Void> filter(final ServerWebExchange exchange, final WebFilterChain chain) {
        final URI uri = exchange.getRequest().getURI();
        final PathMatcher pathMatcher = new AntPathMatcher();
        //白名单路径移除JWT请求头
        final List<String> ignoreUrls = ignoreUrlsConfig.getUrls();
        for (String ignoreUrl : ignoreUrls) {
            if (pathMatcher.match(ignoreUrl, uri.getPath())) {
                final ServerHttpRequest request = exchange.getRequest().mutate().header(AuthConstant.JWT_TOKEN_HEADER, "").build();
                final ServerWebExchange newExchange = exchange.mutate().request(request).build();
                return chain.filter(newExchange);
            }
        }
        return chain.filter(exchange);
    }
}
