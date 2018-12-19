package com.aaa.util.lk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.aaa.dao.lk.ParentDao;
import com.aaa.entity.TreeNode;

@Component
public class LayuiTreeUtils {
	
	@Autowired
	private ParentDao pDao;
	
	public List<TreeNode> getTree(Integer r_id) {
		List<Map<String, Object>> list = pDao.queryByParentm_id(r_id, 0);
		return packagTreeNodes(list,r_id);
	}

	/**
	 * 封装list为树状菜单的子节点
	 * 
	 * @param list
	 * @return
	 */
	private List<TreeNode> packagTreeNodes(List<Map<String, Object>> list,Integer r_id) {
		List<TreeNode> treelist = new ArrayList<TreeNode>();

		if (0 < list.size()) {

			for (Map<String, Object> map : list) {
				// 封装一个树节点
				TreeNode node = new TreeNode();

				Set<String> keySet = map.keySet();

				for (String key : keySet) {
					switch (key) {
					case "id":
						node.setId(ObjTrans.toInteger(map.get(key)));
						break;
					case "title":
						node.setTitle(ObjTrans.toStr(map.get(key)));
						break;
					case "icon":
						node.setIcon(ObjTrans.toStr(map.get(key)));
						break;
					case "href":
						node.setHref(ObjTrans.toStr(map.get(key)));
						break;
					case "spread":
						node.setSpread(Boolean.parseBoolean(map.get(key).toString()));
						break;
					}
				}

				// 当前节点的id作为父节点,获取子节点
				List<Map<String, Object>> childs = pDao
					.queryByParentm_id(r_id, ObjTrans.toInteger(map.get("id")));

				// 如果存在子节点,封装子节点信息
				if (0 < childs.size()) {
					node.setSpread(false);//false--关闭
					List<TreeNode> childlist = packagTreeNodes(childs,r_id);
					node.setChildren(childlist);
				} else {
					node.setSpread(false);
				}

				treelist.add(node);
			}
		}
		return treelist;
	}

}
