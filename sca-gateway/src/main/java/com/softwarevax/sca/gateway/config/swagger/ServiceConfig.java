package com.softwarevax.sca.gateway.config.swagger;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Data
@Configuration
@ConfigurationProperties(prefix = "swagger")
public class ServiceConfig {

    private List<ServiceInfo> service;

}
