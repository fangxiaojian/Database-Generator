${gen.setType("serviceImpl")}
package ${entity.packages.serviceImpl};

import ${entity.packages.entity.full};
import ${entity.packages.dao.full};
import ${entity.packages.service.full};
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.minstone.app.ale.datacenter.model.common.AleCommonFieldBean;
import com.minstone.app.ale.datacenter.model.common.UndertakerManBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Service("${entity.name.service.firstLower}")
@Transactional
public class ${entity.name.serviceImpl} implements ${entity.name.service} {

    @Autowired
    ${entity.name.dao} ${entity.name.dao.firstLower};

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${entity.name.entity} add(${entity.name.entity} ${entity.name.entity.firstLower}) {
        ${entity.name.dao.firstLower}.insert(${entity.name.entity.firstLower});
        return ${entity.name.entity.firstLower};
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${entity.name.entity} detail(String code) {
        LambdaQueryWrapper<${entity.name.entity}> extractWrapper = new LambdaQueryWrapper<${entity.name.entity}>().eq(AleCommonFieldBean::getCode, code);
        ${entity.name.entity} ${entity.name.entity.firstLower} = ${entity.name.dao.firstLower}.selectOne(extractWrapper);
        return ${entity.name.entity.firstLower};
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public ${entity.name.entity} update(${entity.name.entity} statementPleaModel) {
        LambdaUpdateWrapper<${entity.name.entity}> extractWrapper = new LambdaUpdateWrapper<${entity.name.entity}>()
                .eq(AleCommonFieldBean::getCode, ${entity.name.entity}.getCode());
        ${entity.name.dao.firstLower}.update(${entity.name.entity.firstLower}, extractWrapper);
        return ${entity.name.entity.firstLower};
    }
}