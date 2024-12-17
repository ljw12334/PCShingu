package com.pcmall.javaClass;

public class CpuDto {

	private int id = 0;
	private String name = "";
	private String kind = "";
	private String gen = "";
	private String modifier = "";
	private String socket = "";
	private int core = 0;
	private int thread = 0;
	private String builtInGraphics = "";
	
	private int priceOrigin = 0;
	private int priceSell = 0;
	private int discountRate = 0;
	private String image = "";
	private int stock = 0;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public String getSocket() {
		return socket;
	}
	public void setSocket(String socket) {
		this.socket = socket;
	}
	public int getCore() {
		return core;
	}
	public void setCore(int core) {
		this.core = core;
	}
	public int getThread() {
		return thread;
	}
	public void setThread(int thread) {
		this.thread = thread;
	}
	public String getBuiltInGraphics() {
		return builtInGraphics;
	}
	public void setBuiltInGraphics(String builtInGraphics) {
		this.builtInGraphics = builtInGraphics;
	}
	public int getPriceOrigin() {
		return priceOrigin;
	}
	public void setPriceOrigin(int priceOrigin) {
		this.priceOrigin = priceOrigin;
	}
	public int getPriceSell() {
		return priceSell;
	}
	public void setPriceSell(int priceSell) {
		this.priceSell = priceSell;
	}
	public int getDiscountRate() {
		return discountRate;
	}
	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
}
