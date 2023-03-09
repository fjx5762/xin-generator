package ink.unicode.xin.generator.mapper;

import java.io.Serializable;
import java.util.List;

public interface BaseMapper<T, E extends Serializable> {
    int deleteByPrimaryKey(E id);

    int insert(T record);

    int insertSelective(T record);

    T selectByPrimaryKey(E id);

    int updateByPrimaryKeySelective(T record);

    int updateByPrimaryKey(T record);

    List<T> selectListByPage(T record);

    List<T> selectPageListByParams(Object params);

    Integer selectPageCountByParams(Object params);

    List<T> selectList(Object params);

    T selectOne(Object params);
}
