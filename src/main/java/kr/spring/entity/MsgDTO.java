package kr.spring.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@AllArgsConstructor 
@NoArgsConstructor 
@Data //Getter Setter
public class MsgDTO {
	private String memID;
    private Criteria cri;
}
