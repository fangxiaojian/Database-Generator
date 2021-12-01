${gen.setType("controller")}
package ${entity.packages.controller};

import ${entity.packages.entity.full};
import ${entity.packages.service.full};

import com.github.pagehelper.util.StringUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Restful: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Api(tags = "${table.comment}")
@RestController
@RequestMapping("/doc/${entity.name.firstLower}")
public class ${entity.name.controller}{

    @Autowired
    ${entity.name.service} ${entity.name.service.firstLower};

    @PostMapping(value = "add")
    @ApiOperation(value = "add ${table.comment}")
    public ResponseResultBean<${entity.name.entity}> add(
        @ApiParam(name = "${entity.name.entity.firstLower}", value = "${table.comment}")
        @RequestBody ${entity.name.entity} ${entity.name.entity.firstLower}) {
        return ResponseResultBean.success(${entity.name.service.firstLower}.add(${entity.name.entity.firstLower}));
    }

    @PostMapping(value = "update")
    @ApiOperation(value = "update ${table.comment}")
    public ResponseResultBean<${entity.name.entity}> update(
        @ApiParam(name = "${entity.name.entity.firstLower}", value = "${table.comment}")
        @RequestBody ${entity.name.entity} ${entity.name.entity.firstLower}) {
        if(StringUtil.isEmpty(${entity.name.entity.firstLower}.getCode())){
            return ResponseResultBean.serverError("code is not null");
        }
        return ResponseResultBean.success(${entity.name.service.firstLower}.update(${entity.name.entity.firstLower}));
    }

    @GetMapping(value = "detail")
    @ApiOperation(value = "getDetail ${table.comment}")
    public ResponseResultBean<${entity.name.entity}> detail(
        @ApiParam(name = "code", value = "code",required = true)
        @RequestParam("code") String code) {
        if(StringUtil.isEmpty(code)){
            return ResponseResultBean.serverError("code is not null");
        }
        return ResponseResultBean.success(${entity.name.service.firstLower}.detail(code));
    }

}
