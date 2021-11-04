package com.softwarevax.sca.gateway.config.swagger;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class GatewaySwaggerResourceProvider implements SwaggerResourcesProvider {

    /**
     * swagger2默认的url后缀
     */
    private static final String SWAGGER2URL = "/v2/api-docs";

    @Autowired
    private ServiceConfig serviceConfig;

    @Override
    public List<SwaggerResource> get() {
        List<SwaggerResource> resources = new ArrayList<>();
        Set<String> dealUrl = new HashSet<>();
        List<ServiceInfo> service = serviceConfig.getService();
        if(CollectionUtils.isEmpty(service)) {
            return resources;
        }
        service.forEach(instance -> {
            // 拼接url：/serviceId/v2/api-info
            String url = "/" + instance.getValue() + SWAGGER2URL;
            if (dealUrl.contains(url)) {
                return;
            }
            dealUrl.add(url);
            SwaggerResource swaggerResource = new SwaggerResource();
            swaggerResource.setUrl(url);
            swaggerResource.setName(instance.getName());
            resources.add(swaggerResource);
        });
        return resources;
    }
}
