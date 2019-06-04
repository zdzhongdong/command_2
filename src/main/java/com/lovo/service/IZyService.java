package com.lovo.service;

import java.util.List;

import com.lovo.bean.ZyEntity;

/**资源接口
 * @author Administrator
 *
 */
public interface IZyService {

	
	/**按区域查询资源
	 * @param area 区域
	 * @return 资源集合
	 */
	public List<ZyEntity> findByArea(String area);
	/**按类型查询资源
	 * @param type 资源类型
	 * @return 资源集合
	 */
	public List<ZyEntity> findByType(String type);
	
	public void add(ZyEntity zy);

}
