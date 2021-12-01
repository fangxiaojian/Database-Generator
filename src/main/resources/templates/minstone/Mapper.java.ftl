${gen.setType("dao")}
package ${entity.packages.dao};

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import ${entity.packages.entity.full};

/**
 * mapper: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Mapper
public interface ${entity.name.dao} extends BaseMapper<${entity.name.entity}> {
}