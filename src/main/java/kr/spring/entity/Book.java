package kr.spring.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor 
@NoArgsConstructor 
@Data 
public class Book {
	
	private int bkNum;
	private String bkTitle; 
	private String bkAuthor;
	private String bkCompany;
	private String bkIsbn; 
	private String bkCategory; 
	private String bkCallNumber; 
	private int bkCount; 

}
