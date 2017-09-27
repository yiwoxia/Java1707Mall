package com.situ.mall.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
	/**商品id*/
	private Integer id;
	/**分类id对应category表*/
	private Integer category_id;
	private String name;
	private String main_image;
	private String sub_images;
	private String detail;
	private Integer stock;
	private Integer status;
	private BigDecimal price;
	private String subtitle;
	private Date create_time;
	private Date update_time;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public Product(Integer category_id) {
		super();
		this.category_id = category_id;
	}



	public Product(Integer id, Integer category_id, String name, String main_image, String sub_images, String detail,
			BigDecimal price, Integer stock, Integer status, Date create_time, Date update_time, String subtitle) {
		super();
		this.id = id;
		this.category_id = category_id;
		this.name = name;
		this.main_image = main_image;
		this.sub_images = sub_images;
		this.detail = detail;
		this.price = price;
		this.stock = stock;
		this.status = status;
		this.create_time = create_time;
		this.update_time = update_time;
		this.subtitle = subtitle;
	}



	public Integer getStatus() {
		return status;
	}




	public void setStatus(Integer status) {
		this.status = status;
	}


	

	public String getSubtitle() {
		return subtitle;
	}



	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMain_image() {
		return main_image;
	}
	public void setMain_image(String main_image) {
		this.main_image = main_image;
	}
	public String getSub_images() {
		return sub_images;
	}
	public void setSub_images(String sub_images) {
		this.sub_images = sub_images;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}




	@Override
	public String toString() {
		return "Product [id=" + id + ", category_id=" + category_id + ", name=" + name + ", main_image=" + main_image
				+ ", sub_images=" + sub_images + ", detail=" + detail + ", price=" + price + ", stock=" + stock
				+ ", status=" + status + ", create_time=" + create_time + ", update_time=" + update_time + "]";
	}

	
	
	
	
}
