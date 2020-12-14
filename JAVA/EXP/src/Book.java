public class Book {
	private String title;
	private int price;
	private String author;
	private String publisher;
	private String pubDate;
	public Book(String title, int price, String author, String publisher, String pubDate) {
		super();
		this.title = title;
		this.price = price;
		this.author = author;
		this.publisher = publisher;
		this.pubDate = pubDate;}
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	public String getAuthor() {return author;}
	public void setAuthor(String author) {this.author = author;}
	public String getPublisher() {return publisher;}
	public void setPublisher(String publisher) {this.publisher = publisher;}
	public String getPubDate() {return pubDate;}
	public void setPubDate(String pubDate) {this.pubDate = pubDate;}
	@Override
	public String toString() {
		return "Book [title=" + title + ", price=" + price + ", author=" + author + ", publisher=" + publisher
				+ ", pubDate=" + pubDate + "]";	}}