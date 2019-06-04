package com.lovo.service;

import java.util.List;

import com.lovo.bean.ModelEntity;

/**预案模板业务接口
 * @author Administrator
 *
 */
public interface IModelService {
	/**添加预案模板
	 * @param model 模板对象
	 */
	public void savaModel(ModelEntity model);
	
	/**根据预案模板id删除预案模板
	 * @param id 预案模板id
	 */
	public void delModel(Integer id);
	
	/**根据模板类型分类查询模板
	 * @param type 模板类型
	 * @return 返回模板集合
	 */
	public List<ModelEntity> findByMBType(String type);
	
	/**根据模板类型和等级分类查询模板
	 * @param type 模板类型
	 * @param rank 模板等级
	 * @return 返回模板集合
	 */
	public List<ModelEntity> findByTypeAndRank(String type,String rank);
	
	/**根据模板id修改模板信息
	 * @param id 模板id
	 * @param docterNum 医院人数
	 * @param anbNm  救护车数量
	 * @param firNum  消防队人数
	 * @param inferNum  消防车数量
	 */
	public void updateModel(Integer id,Integer docterNum,Integer anbNm,Integer firNum, Integer inferNum);
	
	/**根据模板ID查询模板对象
	 * @param id 模板ID
	 * @return 对应模板对象
	 */
	public ModelEntity findModelById(Integer id);
	

}
