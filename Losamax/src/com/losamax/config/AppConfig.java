package com.losamax.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ImportResource("classpath:application-context.xml")
@ComponentScan(basePackages = { "com.losamax.dao", "com.losamax.services" })
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = { "com.losamax.dao" })
public class AppConfig {

}
