package com.softwarevax.sca.service.order;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

/**
 * @author twcao
 * @title: PortalApplication
 * @projectName sca-parent
 * @description: 书籍
 * @date 2021/6/1520:44
 */
@EnableDiscoveryClient
@SpringBootApplication(scanBasePackages = "com.softwarevax.sca")
@MapperScan("com.softwarevax.sca.service.order.mapper")
public class OrderApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrderApplication.class);
    }
}
