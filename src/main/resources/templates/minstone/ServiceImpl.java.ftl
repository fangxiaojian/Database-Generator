${gen.setType("serviceImpl")}
package ${entity.packages.serviceImpl};

import com.minstone.app.ale.common.service.BaseDocService;
import com.minstone.app.ale.coreapi.bean.core.CommonWorkFlowBean;
import com.minstone.app.ale.coreapi.service.core.CaseInfoService;
import ${entity.packages.entity.full};
import ${entity.packages.service.full};
import com.minstone.app.ale.datacenter.utils.DocIdealUtils;
import com.minstone.app.applyform.model.ApplyForm;
import com.minstone.app.applyform.service.ApplyFormService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Service: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@Service
@Slf4j
public class ${entity.name.serviceImpl} extends BaseDocService<${entity.name.entity}> implements ${entity.name.service} {

    @Autowired
    private ApplyFormService applyFormService;

    @Autowired
    CaseInfoService caseInfoService;

    /**
     * 获取表单信息
     * @param flowInid 流程ID
     * @return 查询结果
     */
    @Override
    public ${entity.name.entity} getBusinessObject(Long flowInid) {
        ${entity.name.entity} doc = applyFormService.loadContentByFlowInId(flowInid, ${entity.name.entity}.class);
        doc.setDocExtend(applyFormService.loadDocExtendByFlowInid(flowInid));
        return doc;
    }

    /**
     * 流程办结，如果存在特殊业务处理的需要重写父类的办结方法
     * @param applyForm
     * @param commonWorkFlowBean
     * @param doc
     */
    @Override
    protected void onFinish(ApplyForm applyForm, CommonWorkFlowBean commonWorkFlowBean, ${entity.name.entity} doc) {
        boolean idea = DocIdealUtils.getIdea(commonWorkFlowBean.getIdeaBeanList());
        if (idea) {
            //审批通过，同步变更后大承办结构信息到案件表中，ale_case_undertaker,需要在 ale-case-service 中开发
        }
    }

    /***
    *  非办结的业务方法，如果存在个性化业务需要重写这个方法
    * @param applyForm
    * @param commonOaWorkFlow
    * @param doc
    */
    @Override
    protected void onSend(ApplyForm applyForm, CommonWorkFlowBean commonOaWorkFlow, ${entity.name.entity} doc) {
        //发起审批后需要修改案件承办机构变更状态为审批中，只需要第一次发起的时候调用，需要在ale-case-service中实现
    }

}