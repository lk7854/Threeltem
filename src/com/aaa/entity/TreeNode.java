package com.aaa.entity;

import java.util.List;

public class TreeNode {

	private Integer id; // //节点标识值。
	private String title; // 节点文本。
	private String icon; // 节点图标
	private boolean spread; // 节点状态
	private String href;//跳转路径
	
	private List<TreeNode> children; // 子节点

	public TreeNode() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public String getHref() {
		return href;
	}


	public void setHref(String href) {
		this.href = href;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public boolean getSpread() {
		return spread;
	}

	public void setSpread(boolean spread) {
		this.spread = spread;
	}

	public List<TreeNode> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}


	@Override
	public String toString() {
		return "TreeNode [id=" + id + ", title=" + title + ", icon=" + icon
				+ ", spread=" + spread + ", href=" + href +  ", children=" + children + "]";
	}


	public TreeNode(Integer id, String title, String icon, boolean spread,
			String href, List<TreeNode> children) {
		super();
		this.id = id;
		this.title = title;
		this.icon = icon;
		this.spread = spread;
		this.href = href;
		this.children = children;
	}
	
}
