${gen.setType("controller")}
package ${entity.packages.controller};

import com.minstone.app.ale.basic.bean.ResponseResultBean;
import com.minstone.app.ale.datacenter.coreapi.bean.core.CommonCaseDocDto;
import com.minstone.app.ale.datacenter.coreapi.bean.core.CommonDocFlowDealBean;
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

    @GetMapping(value = "getFlowDeal")
    @ApiOperation(value = "获取 ${entity.comment} 详细信息")
    public ResponseResultBean<CommonDocFlowDealBean<${entity.name.entity}>> getDocFlowDeal(
        @ApiParam(name = "flowInid", value = "流程实例id")
        @RequestParam("flowInid") Long flowInid) {
        CommonDocFlowDealBean<${entity.name.entity}> docFlowDealBean = ${entity.name.service.firstLower}.getDocFlowDeal(flowInid);
            return ResponseResultBean.success(docFlowDealBean);
    }

    @PostMapping(value = "loadWorkFlow")
    @ApiOperation(value = "${entity.comment}审批流程（拟稿、保存、发送下一步）")
    public ResponseResultBean<CommonDocFlowDealBean<${entity.name.entity}>> loadWorkFlow(@RequestBody CommonCaseDocDto<${entity.name.entity}> commonCaseDocDto) {
         return ResponseResultBean.success(${entity.name.service.firstLower}.loadWorkFlow(commonCaseDocDto));
    }

}
