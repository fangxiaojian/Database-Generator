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
     * Service 后缀
     */
    private String serviceSuffix = "Service";
    /**
     * ServiceImpl 后缀
     */
    private String serviceImplSuffix = "ServiceImpl";
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
     * Service 包名
     */
    private String servicePackage = "com.minstone.app.ale.datacenter.service";
    /**
     * ServiceImpl 包名
     */
    private String serviceImplPackage = "com.minstone.app.ale.datacenter.service.impl";
    /**
     * Controller 包名
     */
    private String controllerPackage = "com.minstone.app.ale.datacenter.restful";
    /**
     * Mapper XML 包名
     */
    private String xmlPackage = "mapper";
    /**
     * 文书类名
     */
    private String entityName;
    /**
     * 文书名
     */
    private String entityComment;

    public String getSourcesPathAt(String filename) {
        return sourcesPath + "/" + filename;
    }

    public String getJavaPathAt(String filename) {
        return javaPath + "/" + filename;
    }
}
