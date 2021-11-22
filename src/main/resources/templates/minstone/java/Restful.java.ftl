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
 * Restful：${entity.comment}
 *
 * @author ${developer.author}
 * @date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Api(tags = "${table.comment}")
@RestController
@RequestMapping("/doc/${table.name}")
public class ${entity.name.controller}{

    @Autowired
    private final ${entity.name.service} ${entity.name.service.firstLower};

    @PostMapping(value = "add")
    @ApiOperation(value = "新增${table.comment}")
    public ResponseResultBean<${entity.name.entity}> add(
        @ApiParam(name = "${table.name}", value = "${table.comment}")
        @RequestBody ${entity.name.entity} ${entity.name.entity.firstLower}) {
        return ResponseResultBean.success(${entity.name.service.firstLower}.add(${entity.name.entity.firstLower}));
    }

    @PostMapping(value = "update")
    @ApiOperation(value = "更新${table.comment}")
    public ResponseResultBean<${entity.name.entity}> update(
        @ApiParam(name = "${table.name}", value = "${table.comment}")
        @RequestBody ${entity.name.entity} ${entity.name.entity.firstLower}) {
        if(StringUtil.isEmpty(${entity.name.entity.firstLower}.getCode())){
            return ResponseResultBean.serverError("code不能为空");
        }
        return ResponseResultBean.success(${entity.name.service.firstLower}.update(${entity.name.entity.firstLower}));
    }

    @GetMapping(value = "detail")
    @ApiOperation(value = "获取${table.comment}")
    public ResponseResultBean<${entity.name.entity}> detail(
        @ApiParam(name = "code", value = "唯一标识 code",required = true)
        @RequestParam("code") String code) {
        if(StringUtil.isEmpty(code)){
            return ResponseResultBean.serverError("code不能为空");
        }
        return ResponseResultBean.success(${entity.name.service.firstLower}.detail(${entity.name.entity.firstLower}));
    }

}
