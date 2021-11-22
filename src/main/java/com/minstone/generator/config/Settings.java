package com.minstone.generator.config;

import lombok.Data;

/**
 * 设置信息
 *
 * @author HouKunLin
 * @date 2020/4/3 0003 14:56
 */
@Data
public class Settings {
    /**
     * 项目路径
     */
    private String projectPath;
    /**
     * Java代码路径
     */
    private String javaPath = "src/main/java";
    /**
     * 资源文件路径
     */
    private String sourcesPath = "src/main/resources";
    /**
     * Entity 后缀
     */
    private String entitySuffix = "Model";
    /**
     * Dao 后缀
     */
    private String daoSuffix = "Mapper";
    /**
     * Controller 后缀
     */
    private String controllerSuffix = "Restful";
    /**
     * Entity 包名
     */
    private String entityPackage = "com.minstone.app.ale.datacenter.model";
    /**
     * Dao 包名
     */
    private String daoPackage = "com.minstone.app.ale.datacenter.mapper";
    /**
     * Controller 包名
     */
    private String controllerPackage = "com.minstone.app.ale.datacenter.restful";
    /**
     * Mapper XML 包名
     */
    private String xmlPackage = "mapper";

    /**
     * model 后缀
     */
    private String modelSuffix = "Model";
    /**
     * model 包名
     */
    private String modelPackage = "com.minstone.app.ale.datacenter.model";
    /**
     * restful 后缀
     */
    private String restfulSuffix = "Restful";
    /**
     * restful 包名
     */
    private String restfulPackage = "com.minstone.app.ale.datacenter.restful";
    /**
     * Service 后缀
     */
    private String serviceSuffix = "Service";
    /**
     * Service 包名
     */
    private String servicePackage = "com.minstone.app.ale.datacenter.coreapi.service.core";
    /**
     * ServiceImpl 后缀
     */
    private String serviceImplSuffix = "ServiceImpl";
    /**
     * ServiceImpl 包名
     */
    private String serviceImplPackage = "com.minstone.app.ale.datacenter.coreservice.service.core.impl";
    /**
     * Mapper 后缀
     */
    private String mapperSuffix = "Mapper";
    /**
     * Mapper 包名
     */
    private String mapperPackage = "com.minstone.app.ale.datacenter.mapper";

    public String getSourcesPathAt(String filename) {
        return sourcesPath + "/" + filename;
    }

    public String getJavaPathAt(String filename) {
        return javaPath + "/" + filename;
    }
}
