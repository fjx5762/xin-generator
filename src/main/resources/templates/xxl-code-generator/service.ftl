import com.wmeimob.tkmybatis.base.CrudService;

import java.util.List;

public interface ${classInfo.className}Service extends CrudService<Long, ${classInfo.className}> {

    List<${classInfo.className}> page(${classInfo.className}Param param);

    ${classInfo.className} detail(Long id);

    ${classInfo.className} add(${classInfo.className}Param param);

    ${classInfo.className} upd(${classInfo.className}Param param);

    void del(Long id);


}