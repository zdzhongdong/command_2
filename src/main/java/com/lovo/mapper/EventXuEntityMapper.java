package com.lovo.mapper;

import com.lovo.bean.EventXuEntity;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface EventXuEntityMapper {
	/**
	 * 查询事件的续报(根据事件排序)
	 * @param page 当前是第几页
	 * @param eventid 事件主报编号
	 * @return 事件续报集合
	 */
	 @Select({
	        "select",
	        "pk_continue_id, fk_thingNum, f_adress, fk_type, fk_level, f_alarmPeople, f_alarmPhone, ",
	        "f_continueTime, f_area, f_injured, f_houseNum, f_lossMoney",
	        "from t_eventxu",
	        "where fk_thingNum = #{eventid} order by f_continueTime"
	    })
	    @ResultMap("BaseResultMap")
		public List<EventXuEntity> findByEventId(String eventid);
		
		/**
		 * 添加续报
		 * @param eventxubean 续报对象
		 */
		public void addEventXu(EventXuEntity eventxubean);
	
	
	
	
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_eventxu
     *
     * @mbggenerated
     */
    @Delete({
        "delete from t_eventxu",
        "where pk_continue_id = #{pkContinueId,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer pkContinueId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_eventxu
     *
     * @mbggenerated
     */
    @Insert({
        "insert into t_eventxu (pk_continue_id, fk_thingNum, ",
        "f_adress, fk_type, ",
        "fk_level, f_alarmPeople, ",
        "f_alarmPhone, f_continueTime, ",
        "f_area, f_injured, f_houseNum, ",
        "f_lossMoney)",
        "values (#{pkContinueId,jdbcType=INTEGER}, #{fkThingnum,jdbcType=VARCHAR}, ",
        "#{fAdress,jdbcType=VARCHAR}, #{fkType,jdbcType=INTEGER}, ",
        "#{fkLevel,jdbcType=INTEGER}, #{fAlarmpeople,jdbcType=VARCHAR}, ",
        "#{fAlarmphone,jdbcType=VARCHAR}, #{fContinuetime,jdbcType=VARCHAR}, ",
        "#{fArea,jdbcType=REAL}, #{fInjured,jdbcType=INTEGER}, #{fHousenum,jdbcType=INTEGER}, ",
        "#{fLossmoney,jdbcType=REAL})"
    })
    int insert(EventXuEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_eventxu
     *
     * @mbggenerated
     */
    int insertSelective(EventXuEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_eventxu
     *
     * @mbggenerated
     */
    @Select({
        "select",
        "pk_continue_id, fk_thingNum, f_adress, fk_type, fk_level, f_alarmPeople, f_alarmPhone, ",
        "f_continueTime, f_area, f_injured, f_houseNum, f_lossMoney",
        "from t_eventxu",
        "where pk_continue_id = #{pkContinueId,jdbcType=INTEGER}"
    })
    @ResultMap("BaseResultMap")
    EventXuEntity selectByPrimaryKey(Integer pkContinueId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_eventxu
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(EventXuEntity record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_eventxu
     *
     * @mbggenerated
     */
    @Update({
        "update t_eventxu",
        "set fk_thingNum = #{fkThingnum,jdbcType=VARCHAR},",
          "f_adress = #{fAdress,jdbcType=VARCHAR},",
          "fk_type = #{fkType,jdbcType=INTEGER},",
          "fk_level = #{fkLevel,jdbcType=INTEGER},",
          "f_alarmPeople = #{fAlarmpeople,jdbcType=VARCHAR},",
          "f_alarmPhone = #{fAlarmphone,jdbcType=VARCHAR},",
          "f_continueTime = #{fContinuetime,jdbcType=VARCHAR},",
          "f_area = #{fArea,jdbcType=REAL},",
          "f_injured = #{fInjured,jdbcType=INTEGER},",
          "f_houseNum = #{fHousenum,jdbcType=INTEGER},",
          "f_lossMoney = #{fLossmoney,jdbcType=REAL}",
        "where pk_continue_id = #{pkContinueId,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(EventXuEntity record);
}