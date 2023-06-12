package com.cssl.pojo;

import java.util.Date;

public class House {
	private Integer id;
	private Integer street_id;
	private Integer user_id;
	private Integer type_id;
	private String title;
	private String descript;
	private Integer price;
	private Date pubdate;
	private Integer floorage;
	private String contant;
	private String image;
	private Street street;
	private Users users;
	private Type type;
	private District district;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStreet_id() {
		return street_id;
	}

	public void setStreet_id(Integer street_id) {
		this.street_id = street_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getType_id() {
		return type_id;
	}

	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Date getPubdate() {
		return pubdate;
	}

	public void setPubdate(Date pubdate) {
		this.pubdate = pubdate;
	}

	public Integer getFloorage() {
		return floorage;
	}

	public void setFloorage(Integer floorage) {
		this.floorage = floorage;
	}

	public String getContant() {
		return contant;
	}

	public void setContant(String contant) {
		this.contant = contant;
	}

	public Street getStreet() {
		return street;
	}

	public void setStreet(Street street) {
		this.street = street;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public District getDistrict() {
		return district;
	}

	public void setDistrict(District district) {
		this.district = district;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public House(Integer id, Integer street_id, Integer user_id, Integer type_id, String title, String descript,
			Integer price, Date pubdate, Integer floorage, String contant, String image, Street street, Users users,
			Type type, District district) {
		super();
		this.id = id;
		this.street_id = street_id;
		this.user_id = user_id;
		this.type_id = type_id;
		this.title = title;
		this.descript = descript;
		this.price = price;
		this.pubdate = pubdate;
		this.floorage = floorage;
		this.contant = contant;
		this.image = image;
		this.street = street;
		this.users = users;
		this.type = type;
		this.district = district;
	}

	public House() {
		super();
	}

	@Override
	public String toString() {
		return "House [id=" + id + ", street_id=" + street_id + ", user_id=" + user_id + ", type_id=" + type_id
				+ ", title=" + title + ", descript=" + descript + ", price=" + price + ", pubdate=" + pubdate
				+ ", floorage=" + floorage + ", contant=" + contant + ", image=" + image + ", street=" + street
				+ ", users=" + users + ", type=" + type + ", district=" + district + "]";
	}

}
