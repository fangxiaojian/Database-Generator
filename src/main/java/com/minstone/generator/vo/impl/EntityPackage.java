package com.minstone.generator.vo.impl;

import com.minstone.generator.config.Settings;
import lombok.Getter;
import org.apache.commons.lang.StringUtils;

import java.util.HashSet;
import java.util.stream.Collectors;

/**
 * 实体类对象的包信息
 *
 * @author HouKunLin
 * @date 2020/7/5 0005 15:12
 */
@Getter
public class EntityPackage {
    /**
     * 实体类字段所需要导入的包列表
     */
    private final HashSet<String> list = new HashSet<>();
    private String toString = "";
    /**
     * 实体类包名信息
     */
    private EntityPackageInfo entity;
    /**
     * 实体类包名信息
     */
    private EntityPackageInfo model;
    /**
     * Service 包名信息
     */
    private EntityPackageInfo service;
    /**
     * ServiceImpl 包名信息
     */
    private EntityPackageInfo serviceImpl;
    /**
     * Dao 包名信息
     */
    private EntityPackageInfo dao;
    /**
     * mapper 包名信息
     */
    private EntityPackageInfo mapper;
    /**
     * Controller 包名信息
     */
    private EntityPackageInfo controller;
    /**
     * restful 包名信息
     */
    private EntityPackageInfo restful;

    public void add(String fullPackageName) {
        if (fullPackageName.startsWith("java.lang.")) {
            return;
        }
        list.add(fullPackageName);
    }

    public void clear() {
        list.clear();
        toString = "";
    }

    @Override
    public String toString() {
        if (StringUtils.isBlank(toString)) {
            toString = list.stream().map(item -> String.format("import %s;\n", item)).collect(Collectors.joining());
        }
        return toString;
    }

    public void initMore(Settings settings, EntityName entityName) {
        this.entity = new EntityPackageInfo(settings.getEntityPackage(), entityName.getEntity());
        this.model = new EntityPackageInfo(settings.getModelPackage(), entityName.getEntity());
        this.service = new EntityPackageInfo(settings.getServicePackage(), entityName.getService());
        this.serviceImpl = new EntityPackageInfo(settings.getServiceImplPackage(), entityName.getServiceImpl());
        this.dao = new EntityPackageInfo(settings.getDaoPackage(), entityName.getDao());
        this.mapper = new EntityPackageInfo(settings.getMapperPackage(), entityName.getDao());
        this.controller = new EntityPackageInfo(settings.getControllerPackage(), entityName.getController());
        this.restful = new EntityPackageInfo(settings.getRestfulPackage(), entityName.getController());
    }
}
