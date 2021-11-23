${gen.setType("service")}
package ${entity.packages.service};

import ${entity.packages.entity.full};

/**
 * Service：${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${entity.name.service} {

    /**
    * 新增记录
    * @param ${entity.name.entity.firstLower} 实例对象
    * @return 查询结果
    */
    ${entity.name.entity} add(${entity.name.entity} ${entity.name.entity.firstLower});

    /**
    * 根据 code 获取记录详情
    * @param code 唯一标识
    * @return 查询结果
    */
    ${entity.name.entity} detail(String code);

    /**
    * 更新记录
    * @param ${entity.name.entity.firstLower} 实例对象
    * @return 查询结果
    */
    ${entity.name.entity} update(${entity.name.entity} ${entity.name.entity.firstLower});
}