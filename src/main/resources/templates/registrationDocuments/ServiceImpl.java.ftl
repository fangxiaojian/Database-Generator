${gen.setType("serviceImpl")}
package ${entity.packages.serviceImpl};

import com.minstone.app.ale.common.service.BaseReisterFormServiceImpl;
import ${entity.packages.entity.full};
import ${entity.packages.service.full};
import org.springframework.stereotype.Service;

/**
 * Service: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Service
public class ${entity.name.serviceImpl} extends BaseReisterFormServiceImpl<${entity.name.entity}> implements ${entity.name.service} {

}