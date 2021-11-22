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
    public ResponseResultBean<${entity.name.model}> add(
        @ApiParam(name = "${table.name}", value = "${table.comment}")
        @RequestBody ${entity.name.model} ${entity.name.model.firstLower}) {
        return ResponseResultBean.success(${entity.name.service.firstLower}.add(${entity.name.model.firstLower}));
    }

    @PostMapping(value = "update")
    @ApiOperation(value = "更新${table.comment}")
    public ResponseResultBean<${entity.name.model}> update(
        @ApiParam(name = "${table.name}", value = "${table.comment}")
        @RequestBody ${entity.name.model} ${entity.name.model.firstLower}) {
        if(StringUtil.isEmpty(${entity.name.model.firstLower}.getCode())){
            return ResponseResultBean.serverError("code不能为空");
        }
        return ResponseResultBean.success(${entity.name.service.firstLower}.update(${entity.name.model.firstLower}));
    }

    @GetMapping(value = "detail")
    @ApiOperation(value = "获取${table.comment}")
    public ResponseResultBean<${entity.name.model}> detail(
        @ApiParam(name = "code", value = "唯一标识 code",required = true)
        @RequestParam("code") String code) {
        if(StringUtil.isEmpty(code)){
            return ResponseResultBean.serverError("code不能为空");
        }
        return ResponseResultBean.success(${entity.name.service.firstLower}.detail(${entity.name.model.firstLower}));
    }

}
