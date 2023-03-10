import com.wmeimob.util.JsonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Api(tags = {"${classInfo.classComment}"})
@Slf4j
@RestController
@RequestMapping("/api/${classInfo.className?uncap_first}")
@RequiredArgsConstructor
public class ${classInfo.className}Controller {

    private final ${classInfo.className}Service ${classInfo.className?uncap_first}Service;


    @ApiOperation("分页查询")
    @GetMapping("/page")
    public JsonResult<List<${classInfo.className}>> page(${classInfo.className}Param param) {
        return JsonResult.ok(${classInfo.className?uncap_first}Service.page(param));
    }

    @ApiOperation("详情")
    @ApiImplicitParams(
    @ApiImplicitParam(name = "id", value = "主键id")
    )
    @GetMapping()
    public JsonResult<${classInfo.className}> detail(@RequestParam(value = "id") Long id) {
        return JsonResult.ok(${classInfo.className?uncap_first}Service.detail(id));
    }

    @ApiOperation("新增")
    @PostMapping()
    public JsonResult<${classInfo.className}> add(@RequestBody @Valid ${classInfo.className}Param param) {
        return JsonResult.ok(${classInfo.className?uncap_first}Service.add(param));
    }

    @ApiOperation("更新")
    @PutMapping()
    public JsonResult<${classInfo.className}> upd(@RequestBody @Valid ${classInfo.className}Param param) {
        return JsonResult.ok(${classInfo.className?uncap_first}Service.upd(param));
    }

    @ApiOperation("删除")
    @ApiImplicitParams(
    @ApiImplicitParam(name = "id", value = "主键id")
    )
    @DeleteMapping()
    public JsonResult<Void> del(@RequestParam(value = "id") Long id) {
        ${classInfo.className?uncap_first}Service.del(id);
        return JsonResult.ok();
    }


}