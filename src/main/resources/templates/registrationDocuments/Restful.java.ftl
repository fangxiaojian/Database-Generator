${gen.setType("controller")}
package ${entity.packages.controller};

import com.minstone.app.ale.basic.bean.ResponseResultBean;
import com.minstone.app.ale.datacenter.model.common.CommonCaseDocForm;
import com.minstone.app.ale.datacenter.model.common.CommonCaseFormDto;
import ${entity.packages.entity.full};
import ${entity.packages.service.full};
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Restful: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Api(tags = "${entity.comment}")
@RestController
@RequestMapping("/doc/${entity.name.firstLower}")
public class ${entity.name.controller}{

    @Autowired
    ${entity.name.service} ${entity.name.service.firstLower};

    @GetMapping(value = "detail")
    @ApiOperation(value = "获取${entity.comment}详情")
    public ResponseResultBean<CommonCaseDocForm<${entity.name.entity}>> detail(
        @ApiParam(name = "formId", value = "表单id")
        @RequestParam("formId") String formId) {
            return ResponseResultBean.success(${entity.name.service.firstLower}.detail(formId));
    }

    @PostMapping(value = "saveOrUpdate")
    @ApiOperation(value = "保存或修改${entity.comment}")
    public ResponseResultBean<CommonCaseDocForm<${entity.name.entity}>> saveOrUpdate(@RequestBody CommonCaseFormDto<${entity.name.entity}> commonCaseFormDto) {
            return ResponseResultBean.success(${entity.name.service.firstLower}.saveOrUpdate(commonCaseFormDto));
    }

}
