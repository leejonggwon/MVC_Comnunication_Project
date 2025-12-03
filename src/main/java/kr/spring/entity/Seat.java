package kr.spring.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor 
@NoArgsConstructor 
@Data 
public class Seat {
	private int seatNum;
	private String seatName;
	private int seatAvailable;
}
