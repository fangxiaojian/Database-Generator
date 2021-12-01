${gen.setType("service")}
package ${entity.packages.service};

import com.minstone.app.ale.common.service.WorkflowTemplate;
import ${entity.packages.entity.full};

/**
 * Service: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
public interface ${entity.name.service} extends WorkflowTemplate<${entity.name.entity}> {

}