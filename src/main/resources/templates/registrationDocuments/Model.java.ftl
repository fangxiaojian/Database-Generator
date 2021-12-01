${gen.setType("entity")}
package ${entity.packages.entity};

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
${entity.packages}

/**
 * Model: ${entity.comment}
 *
 * @Author ${developer.author}
 * @Email ${developer.email}
 * @Date ${date.toString("yyyy-MM-dd HH:mm:ss")}
 */
@ApiModel(value = "${entity.comment}")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIgnoreProperties(ignoreUnknown = true)
public class ${entity.name.entity} implements Serializable {
    /* 实体类样式参考
    //时间样式
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")
    @ApiModelProperty(value = "陈述申辩结束时间 yyyy-MM-dd HH:mm:ss")
    private Date defenseTimeEnd;

    //通用样式
    @ApiModelProperty(value = "陈述申辩地点")
    private String defenseAddress;
    */
}