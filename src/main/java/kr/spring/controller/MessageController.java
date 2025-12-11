package kr.spring.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.spring.entity.Criteria;
import kr.spring.entity.Member;
import kr.spring.entity.Message;

import kr.spring.entity.PageMaker;
import kr.spring.service.MessageService;

@Controller 
@RequestMapping("/message/*")
public class MessageController {
	
	@Autowired
	private MessageService service;
	
	//보낸메세지 메세지 체크삭제
	@PostMapping("/deleteRecordMsg2")
	public String deleteRecordMsg2(@RequestParam List<Integer> idxList, Criteria cri, RedirectAttributes rttr) {
		System.out.println(idxList);
		service.deleteRecordMsg2(idxList);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());	
		System.out.println("보낸메세지 체크박스 삭제기능 ");
		return "redirect:/message/msgRecordList";
		}
	
	
	//보낸메세지함 메세지삭제하기
	@PostMapping("/RecordDeleteMsg")
	public String RecordDeleteMsg(int msgIdx, Criteria cri, RedirectAttributes rttr) {
		service.recordDeleteMsg(msgIdx);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());	
		
		System.out.println("보낸메세지삭제");
		return "redirect:/message/msgRecordList";
	}
	
	

	//메세지 상세보기
	@RequestMapping("/msgRecordContent")                                          
	public String msgRecordContent(@RequestParam("msgIdx") int msgIdx, Model model, @ModelAttribute("cri") Criteria cri) {
		//@RequestParam 쿼리스트링이나 폼 데이터에서 하나의 값을 가져올 때 사용하는 어노테이션
		
		System.out.println("게시글 상세보기 기능수행");
		Message vo = service.msgContent(msgIdx); 
		model.addAttribute("vo", vo); 
	
	return "message/msgRecordContent";
	}
	

	
	//보낸메세지 조회기능
	@RequestMapping("/msgRecordList")
	public String msgRecordList(HttpSession session, Model model, Criteria cri) {
		
		Member mvo = (Member)session.getAttribute("mvo");
		String memID = mvo.getMemID();
		
		cri.setMemID(memID); //Criteria값도 함께 입력하기 위해서 
		
		List<Message> msgRecordList= service.msgRecordList(cri);
		
		//페이징 처리에 필요한 PageMaker 객체도 생성해야한다
		PageMaker pageMaker = new PageMaker();	
		
		//PageMaker가 페이징 기법을 하기위해 Criteria 정보가 필요하다 
		pageMaker.setCri(cri);       	
		
		int recordTotalCount= service.recordTotalCount(cri);
		
		int recordReadStatusTotalCount = service.recordReadStatusTotalCount(cri);
		
		//totalCount는 서비스를 통해 totalCount 메소드를 통해 구한다
		pageMaker.setTotalCount(recordTotalCount);

		model.addAttribute("msgRecordList", msgRecordList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("recordTotalCount", recordTotalCount);
		model.addAttribute("recordReadStatusTotalCount", recordReadStatusTotalCount);

		
		System.out.println("보낸메세지 조회 기능");
		
		return "message/msgRecordList";
	}

	
	//**@RequestParam() 을 붙여야 하는 이유는: 
	//1. 요청 데이터를 어떻게 매핑할지 스프링에게 알려주기 위해,
	//2. 특히 List 같은 복합 타입일 때 명확한 매핑이 필요하기 때문
	
	//메세지삭제2
	@PostMapping("/deleteMsg2")
	public String deleteMsg2(@RequestParam List<Integer> idxList, Criteria cri, RedirectAttributes rttr) {
		System.out.println(idxList);
		service.deleteMsg2(idxList);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());	
		
		return "redirect:/message/msgList";
	}
	

	//메세지삭제
	@PostMapping("/deleteMsg")
	public String deleteMsg(int msgIdx, Criteria cri, RedirectAttributes rttr) {
		
		service.deleteMsg(msgIdx);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());	
		
		return "redirect:/message/msgList";
	}
	
	//메세지보내기
	@PostMapping("/sendMsg")
	public String sendMsg(Message sendM, Criteria cri, RedirectAttributes rttr, HttpServletRequest request) {
		
		 // 파일 업로드 경로
	    String savePath = request.getServletContext().getRealPath("/resources/message");
	    File dir = new File(savePath);
	    if (!dir.exists()) dir.mkdirs();

	    MultipartRequest multi = null;
	    int fileMaxSize = 5000 * 1024 * 10;
	    DefaultFileRenamePolicy def = new DefaultFileRenamePolicy();

	    try {
	        multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", def);

	        // MultipartRequest에서 폼 값 읽기
	        sendM.setToID(multi.getParameter("toID"));
	        sendM.setFromID(multi.getParameter("fromID"));
	        sendM.setMsgTitle(multi.getParameter("msgTitle"));
	        sendM.setMsgContent(multi.getParameter("msgContent"));

	        // 업로드된 파일명 가져오기
	        String filename = multi.getFilesystemName("msgImgpath");
	        sendM.setMsgImgpath(filename);

	    } catch (IOException e) {
	        e.printStackTrace();
	        rttr.addFlashAttribute("msg", "파일 업로드 실패");
	        return "redirect:/message/sendMsgForm";
	    }

		
		service.sendMsg(sendM);
		
		rttr.addFlashAttribute("result", sendM.getToID());
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("type",cri.getType());
		rttr.addAttribute("keyword",cri.getKeyword());

		return "redirect:/message/msgList";
	}
	
	
	//메세지 쓰기 페이지를 이동
	@RequestMapping("/ListToSendMsgForm")
	public String ListToSendMsgForm(Model model, HttpSession session, @ModelAttribute("cri") Criteria cri) {
		
		Member mvo = (Member)session.getAttribute("mvo");
		model.addAttribute("mvo", mvo);

		return "message/sendMsgForm";
	}	
	
	
	//메세지 쓰기 페이지를 이동
	@RequestMapping("/sendMsgForm")
	public String sendMsgForm(@RequestParam("toID") String toID, Model model, HttpSession session, @ModelAttribute("cri") Criteria cri) {
		
		Member mvo = (Member)session.getAttribute("mvo");
		model.addAttribute("mvo", mvo);
		
		//답장하기에서 toID가 넘어오는 경우
		if(toID != null) {
			model.addAttribute("toID", toID);
		}
		
		return "message/sendMsgForm";
	}	
	
	
	//메세지 상세보기
	@RequestMapping("/msgContent")                                          
	public String msgContent(@RequestParam("msgIdx") int msgIdx, Model model, @ModelAttribute("cri") Criteria cri) {
		//@RequestParam 쿼리스트링이나 폼 데이터에서 하나의 값을 가져올 때 사용하는 어노테이션
		
		System.out.println("게시글 상세보기 기능수행");
		Message vo = service.msgContent(msgIdx); 
		model.addAttribute("vo", vo); 
		
		//readStatus 0 → 1 
		service.readStatus1(msgIdx);
		
		return "message/msgContent";
	}
	
	
	//메세지리스트 페이지로 이동
	@RequestMapping("/msgList")
	public String msgList(Model model, HttpSession session, Criteria cri) {
		
		//현재로그인정보 
		Member mvo = (Member)session.getAttribute("mvo"); 
		String memID = mvo.getMemID();
		
		//dto에 setMemID데이터를 입력
		cri.setMemID(memID);	

		List<Message> msgList = service.msgList(cri);
		
		//페이징 처리에 필요한 PageMaker 객체도 생성해야한다
		PageMaker pageMaker = new PageMaker();	
		
		//PageMaker가 페이징 기법을 하기위해 Criteria 정보가 필요하다 
		pageMaker.setCri(cri);       	
		
		int msgTotalCount= service.totalCount(cri);
		int readStatus0TotalCount = service.readStatus0TotalCount(cri);
		
		
		//totalCount는 서비스를 통해 totalCount 메소드를 통해 구한다
		pageMaker.setTotalCount(msgTotalCount); 
		
		model.addAttribute("msgList", msgList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("msgTotalCount", msgTotalCount);
		model.addAttribute("readStatus0TotalCount", readStatus0TotalCount);
		
		//arriveStatus 0 → 1
		service.arriveStatus1(memID);
		
		return "message/msgList";
	}
	
	
	

	
}
