${gen.setType("entity")}
package ${entity.packages.entity};

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.minstone.app.ale.datacenter.model.common.AleCommonFieldBean;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;
import org.springframework.format.annotation.DateTimeFormat;
${entity.packages}

import java.io.Serializable;

/**
* 实体类：${entity.comment}<#if table.comment?trim?length gt 0 && entity.comment != table.comment> (${table.comment})</#if>
*
* @author ${developer.author}
* @date ${date.toString("yyyy-MM-dd HH:mm:ss")}
*/
@ApiModel(value = "${table.comment}")
@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
@JsonIgnoreProperties(ignoreUnknown = true)
@TableName("${table.name}")
public class ${entity.name.entity} extends AleCommonFieldBean implements Serializable {
<#list fields as field>
    <#if field.selected>

        /**
        * ${field.comment}
        */
        <#if field.primaryKey>
            @TableId(type = IdType.ASSIGN_ID)
        </#if>
        <#if field.typeName == "Date">
            @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
            @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
        </#if>
        @ApiModelProperty(value = "${field.comment}")
        private ${field.typeName} ${field.name};
    </#if>
</#list>
}