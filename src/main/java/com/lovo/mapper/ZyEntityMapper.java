package com.lovo.mapper;

import com.lovo.bean.ZyEntity;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ZyEntityMapper {
	
	/**按区域查询资源
	 * @param area 区域
	 * @return 资源集合
	 */
    @Select({
        "select",
        "pk_id, f_zyName, f_zyAdd, f_zyType, f_zyURL",
        "from t_zy",
        "where f_zyAdd = #{area}"
    })
    @ResultMap("BaseResultMap")
	public List<ZyEntity> findByArea(String area);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_zy
     *
     * @mbggenerated
     */
    @Delete({
        "delete from t_zy",
        "where pk_id = #{pkId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer pkId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_zy
     *
     * @mbggenerated
     */
    @Insert({
        "insert into t_zy (f_zyName, ",
        "f_zyAdd, f_zyType, ",
        "f_zyURL)",
        "values (#{fZyname,jdbcType=VARCHAR}, ",
        "#{fZyadd,jdbcType=VARCHAR}, #{fZytype,jdbcType=VARCHAR}, ",
        "#{fZyurl,jdbcType=VARCHAR})"
    })
    public void addzy(ZyEntity zy);
    @Insert({
        "insert into t_zy (pk_id, f_zyName, ",
        "f_zyAdd, f_zyType, ",
        "f_zyURL)",
        "values (#{pkId,jdbcType=INTEGER}, #{fZyname,jdbcType=VARCHAR}, ",
        "#{fZyadd,jdbcType=VARCHAR}, #{fZytype,jdbcType=VARCHAR}, ",
        "#{fZyurl,jdbcType=VARCHAR})"
    })
    int insert(ZyEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_zy
     *
     * @mbggenerated
     */
    int insertSelective(ZyEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_zy
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "pk_id, f_zyName, f_zyAdd, f_zyType, f_zyURL",
        "from t_zy",
        "where pk_id = #{pkId,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    ZyEntity selectByPrimaryKey(Integer pkId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_zy
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ZyEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_zy
     *
     * @mbggenerated
     */
    @Update({
        "update t_zy",
        "set f_zyName = #{fZyname,jdbcType=VARCHAR},",
          "f_zyAdd = #{fZyadd,jdbcType=VARCHAR},",
          "f_zyType = #{fZytype,jdbcType=VARCHAR},",
          "f_zyURL = #{fZyurl,jdbcType=VARCHAR}",
        "where pk_id = #{pkId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(ZyEntity record);
}