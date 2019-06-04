package com.lovo.service;

import java.util.List;

import com.lovo.bean.PublicEntity;

/**公共模块接口
 * @author 14530
 *
 */
public interface IPublicService {
	/**添加公共模块
	 * @param pe 公共模块对象
	 */
	public void addPublic(PublicEntity pe);
	
	/**根据ID删除公共模块对象
	 * @param id 公共模块对象ID
	 */
	public void delPublic (Integer id);
	
	/**根据ID修改公共模块对象key
	 * @param id 公共模块对象id
	 * @param key 修改后的key值
	 */
	public void updatePublic (Integer id,Integer key);
	
	/**根据ID查询公共模块对象
	 * @param id 公共模块对象ID
	 * @return 公共模块对象
	 */
	public PublicEntity findById(Integer id);
	
	/**查询所有公共模块对象
	 * @return 对象集合
	 */
	public List<PublicEntity> findAll();

}
