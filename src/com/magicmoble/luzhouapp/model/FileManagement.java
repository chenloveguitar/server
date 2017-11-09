package com.magicmoble.luzhouapp.model;

public class FileManagement {

	private Integer id;//主键
	private String FileName;//文件名称
	private String createTime;//创建时间
	private Integer parentId;//父级文件夹
	private Integer isFolder;//是否是目录 1是 0 不是
	private String absolutePath;//是否是目录 1是 0 不是
	private String itemId;//业务数据id
	private String type;//类型 upload 为 上传 relevance 为其他业务关联
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	private String file_name;//文件名称
	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public Integer getParent_id() {
		return parent_id;
	}

	public void setParent_id(Integer parent_id) {
		this.parent_id = parent_id;
	}

	public Integer getIs_folder() {
		return is_folder;
	}

	public void setIs_folder(Integer is_folder) {
		this.is_folder = is_folder;
	}

	public String getAbsolute_path() {
		return absolute_path;
	}

	public void setAbsolute_path(String absolute_path) {
		this.absolute_path = absolute_path;
	}

	public String getItem_id() {
		return item_id;
	}

	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}



	private String create_time;//创建时间
	private Integer parent_id;//父级文件夹
	private Integer is_folder;//是否是目录 1是 0 不是
	private String absolute_path;//是否是目录 1是 0 不是
	private String item_id;//业务数据id

	public FileManagement() {
		super();
	}

	public FileManagement(Integer id, String fileName, String createTime, Integer parentId, Integer isFolder,String absolutePath,String itemId) {
		super();
		this.id = id;
		this.FileName = fileName;
		this.createTime = createTime;
		this.parentId = parentId;
		this.isFolder = isFolder;
		this.absolutePath = absolutePath;
		this.itemId = itemId;
	}

	public FileManagement(String fileName, String createTime, Integer parentId, Integer isFolder,String absolutePath,String itemId) {
		super();
		this.FileName = fileName;
		this.createTime = createTime;
		this.parentId = parentId;
		this.isFolder = isFolder;
		this.absolutePath = absolutePath;
		this.itemId = itemId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFileName() {
		return FileName;
	}

	public void setFileName(String fileName) {
		FileName = fileName;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getIsFolder() {
		return isFolder;
	}

	public void setIsFolder(Integer isFolder) {
		this.isFolder = isFolder;
	}

	public String getAbsolutePath() {
		return absolutePath;
	}

	public void setAbsolutePath(String absolutePath) {
		this.absolutePath = absolutePath;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	
	

	@Override
	public String toString() {
		return "FileManagement [id=" + id + ", FileName=" + FileName + ", createTime=" + createTime + ", parentId="
				+ parentId + ", isFolder=" + isFolder + "]";
	}
	
	

}
