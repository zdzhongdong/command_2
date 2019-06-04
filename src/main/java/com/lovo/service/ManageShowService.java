package com.lovo.service;

import java.util.List;

import com.lovo.bean.ManageShowEntity;

/**资源调度进展详情接口
 * @author 14530
 *
 */
public interface ManageShowService {
	/**查询所有进程详情
	 * @return 返回所有进展详情
	 */
	public List<ManageShowEntity> findAllManageshow(String zyType,String thingsId);
	
	/**根据事件编号查询事件详情
	 * @param thingsid 事件编号
	 * @return 详情对象
	 */
	public ManageShowEntity findById(String thingsid);
	
	/**根据调度表id修改 负责人，负责人电话，和处理状态
	 * @param ddId 调度表id
	 * @param mainpeo负责人
	 * @param mainpeotel负责人电话
	 * @param stuse处理状态
	 */
	public void updateManageShow(Integer ddId,String mainpeo,String mainpeotel);

}
