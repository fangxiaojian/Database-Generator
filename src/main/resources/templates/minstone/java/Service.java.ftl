${gen.setType("service")}
package ${entity.packages.service};

import ${entity.packages.entity.full};

/**
 * Service: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${entity.name.service} {

    /**
    * add
    * @param ${entity.name.entity.firstLower} model
    * @return result
    */
    ${entity.name.entity} add(${entity.name.entity} ${entity.name.entity.firstLower});

    /**
    * getDetailByCode
    * @param code
    * @return result
    */
    ${entity.name.entity} detail(String code);

    /**
    * update
    * @param ${entity.name.entity.firstLower} model
    * @return result
    */
    ${entity.name.entity} update(${entity.name.entity} ${entity.name.entity.firstLower});
}