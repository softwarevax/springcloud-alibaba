package com.softwarevax.sca.service.portal;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author twcao
 * @title: PortalApplication
 * @projectName sca-parent
 * @description: 门户
 * @date 2021/6/1520:44
 */
@EnableDiscoveryClient
@SpringBootApplication
public class PortalApplication {

    public static void main(String[] args) {
        SpringApplication.run(PortalApplication.class);
    }
}
