import com.wmeimob.tkmybatis.base.CrudService;

import java.util.List;

public interface ${classInfo.className}Service extends CrudService<Long, ${classInfo.className}> {

    List<${classInfo.className}> page(${classInfo.className}QueryParam param);

    ${classInfo.className} detail(Long id);

    ${classInfo.className} add(${classInfo.className}AddParam param);

    ${classInfo.className} upd(${classInfo.className}UpdParam param);

    void del(Long id);


}