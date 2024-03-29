package com.lovo.mapper;

import com.lovo.bean.ModelEntity;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ModelEntityMapper {
    /**
     * 根据模板id删除模板
     * 
     *
     * @mbggenerated
     */
    @Delete({
        "delete from t_model",
        "where pk_mbid = #{pkMbid,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer fkMbid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_model
     *
     * @mbggenerated
     */
    @Insert({
        "insert into t_model (f_mbName, ",
        "f_mbType, f_mbRank, ",
        "f_mbDocNum, f_mbAmbNum, ",
        "f_mbFirNum, f_mbInferNum, ",
        "f_mbMeaker, f_mbMakerTel)",
        "values ( #{fMbname,jdbcType=VARCHAR}, ",
        "#{fMbtype,jdbcType=VARCHAR}, #{fMbrank,jdbcType=VARCHAR}, ",
        "#{fMbdocnum,jdbcType=INTEGER}, #{fMbambnum,jdbcType=INTEGER}, ",
        "#{fMbfirnum,jdbcType=INTEGER}, #{fMbinfernum,jdbcType=INTEGER}, ",
        "#{fMbmeaker,jdbcType=VARCHAR}, #{fMbmakertel,jdbcType=VARCHAR})"
    })
    int insert(ModelEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_model
     *
     * @mbggenerated
     */
    int insertSelective(ModelEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_model
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "pk_mbid, f_mbName, f_mbType, f_mbRank, f_mbDocNum, f_mbAmbNum, f_mbFirNum, f_mbInferNum, ",
        "f_mbMeaker, f_mbMakerTel",
        "from t_model",
        "where pk_mbid = #{fkMbid,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    ModelEntity selectByPrimaryKey(Integer fkMbid);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_model
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ModelEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_model
     *
     * @mbggenerated
     */
    @Update({
        "update t_model",
        "set f_mbName = #{fMbname,jdbcType=VARCHAR},",
          "f_mbType = #{fMbtype,jdbcType=VARCHAR},",
          "f_mbRank = #{fMbrank,jdbcType=VARCHAR},",
          "f_mbDocNum = #{fMbdocnum,jdbcType=INTEGER},",
          "f_mbAmbNum = #{fMbambnum,jdbcType=INTEGER},",
          "f_mbFirNum = #{fMbfirnum,jdbcType=INTEGER},",
          "f_mbInferNum = #{fMbinfernum,jdbcType=INTEGER},",
          "f_mbMeaker = #{fMbmeaker,jdbcType=VARCHAR},",
          "f_mbMakerTel = #{fMbmakertel,jdbcType=VARCHAR}",
        "where pk_mbid = #{fkMbid,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(ModelEntity record);
    
    
   /* @Select({
        "select",
        "pk_mbid, f_mbName, f_mbType, f_mbRank, f_mbDocNum, f_mbAmbNum, f_mbFirNum, f_mbInferNum, ",
        "f_mbMeaker, f_mbMakerTel",
        "from t_model where",
        "f_mbType = #{type,jdbcType=VARCHAR}"
    })
    @ResultMap("BaseResultMap")*/
    public List<ModelEntity> findByType(@Param("type")String type);
    
    
     @Select({
    "select",
    "pk_mbid, f_mbName, f_mbType, f_mbRank, f_mbDocNum, f_mbAmbNum, f_mbFirNum, f_mbInferNum, ",
    "f_mbMeaker, f_mbMakerTel",
    "from t_model where",
    "f_mbType = #{type,jdbcType=VARCHAR} and f_mbRank = #{rank,jdbcType=VARCHAR}"
})
@ResultMap("BaseResultMap")
    public List<ModelEntity> findByTypeAndRank(@Param("type")String type,@Param("rank")String rank);
    
}