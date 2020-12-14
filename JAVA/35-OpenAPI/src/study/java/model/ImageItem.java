package study.java.model;

public class ImageItem {
	private String collection = null;
	private String thumbnail_url = null;
	private String image_url = null;
	private int width = 0;
	private int height = 0;
	private String display_sitename = null;
	private String doc_url = null;
	private String datetime = null;

	public ImageItem(String collection, String thumbnail_url, String image_url, int width, int height,
			String display_sitename, String doc_url, String datetime) {
		super();
		this.collection = collection;
		this.thumbnail_url = thumbnail_url;
		this.image_url = image_url;
		this.width = width;
		this.height = height;
		this.display_sitename = display_sitename;
		this.doc_url = doc_url;
		this.datetime = datetime;
	}

	public String getCollection() {
		return collection;
	}

	public void setCollection(String collection) {
		this.collection = collection;
	}

	public String getThumbnail_url() {
		return thumbnail_url;
	}

	public void setThumbnail_url(String thumbnail_url) {
		this.thumbnail_url = thumbnail_url;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public String getDisplay_sitename() {
		return display_sitename;
	}

	public void setDisplay_sitename(String display_sitename) {
		this.display_sitename = display_sitename;
	}

	public String getDoc_url() {
		return doc_url;
	}

	public void setDoc_url(String doc_url) {
		this.doc_url = doc_url;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	@Override
	public String toString() {
		return "ImageItem [collection=" + collection + ", thumbnail_url=" + thumbnail_url + ", image_url=" + image_url
				+ ", width=" + width + ", height=" + height + ", display_sitename=" + display_sitename + ", doc_url="
				+ doc_url + ", datetime=" + datetime + "]";
	}
	


}
