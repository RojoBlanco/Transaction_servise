package ru.croc.transactions_service;

import jakarta.servlet.ServletContext;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import ru.croc.ctp.jxfw.core.config.XfwCoreConfig;
import ru.croc.ctp.jxfw.core.facade.webclient.file.LocalResourceStore;
import ru.croc.ctp.jxfw.core.facade.webclient.file.ResourceStore;
import ru.croc.ctp.jxfw.jpa.config.XfwJpaConfig;

import java.io.File;

@Import({XfwCoreConfig.class, XfwJpaConfig.class})
@SpringBootApplication
public class TransactionsServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(TransactionsServiceApplication.class, args);

    }

    @Bean
    public ResourceStore resourceStore(ServletContext servletContext) {
        var rootDirAbsolutePath = ((File) servletContext
                .getAttribute("jakarta.servlet.context.tempdir"))
                .getAbsolutePath();

        return new LocalResourceStore(rootDirAbsolutePath, 100L);
    }
}
