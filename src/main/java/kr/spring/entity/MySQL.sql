
-- 커뮤니티프로젝트--


--좋아요--
CREATE TABLE CM_LIKE (
    IDX INT NOT NULL,
    MEMID VARCHAR(20) NOT NULL,
    LIKEAVAILABLE INT DEFAULT 1,
    PRIMARY KEY (IDX, MEMID)
);

--DROP TABLE CM_LIKE;--
--DELETE FROM CM_LIKE;--

SELECT * FROM CM_LIKE;


--커뮤니티 게시판--
CREATE TABLE CM_BOARD(
   IDX INT NOT NULL,
   MEMID VARCHAR(20) NOT NULL,
   TITLE VARCHAR(100) NOT NULL,
   CONTENT VARCHAR(2000) NOT NULL,
   WRITER VARCHAR(30) NOT NULL,
   INDATE DATETIME DEFAULT NOW(),
   COUNT INT DEFAULT 0,
   LIKECOUNT INT DEFAULT 0,  --좋아요수--
   IMGPATH VARCHAR(500), 
   -- 댓글기능 추가 --
   BOARDGROUP INT,     -- 어떤 그룹에 댓글을 달았는지 알수있는 --
   BOARDSEQUENCE INT,  -- 같은 그룹안에서 댓글의 순서를 저장하는 변수 --
   BOARDLEVEL INT,     -- 1단계(원본글댓글) 2단계(댓글에댓글) 인지에 대한 정보 --   
   BOARDAVAILABLE INT, -- 삭제된 글인지 여부 판별한다 --
   PRIMARY KEY(IDX)
);

DROP TABLE CM_BOARD;

SELECT * FROM CM_BOARD;

DELETE FROM CM_BOARD WHERE IDX BETWEEN 118 AND 120;


-- 회원--
CREATE TABLE CM_MEMBER(
	MEMIDX INT AUTO_INCREMENT,
	MEMID VARCHAR(20) NOT NULL,
	MEMPASSWORD VARCHAR(20) NOT NULL,
	MEMNAME VARCHAR(20) NOT NULL,
	MEMNICKNAME VARCHAR(20) NOT NULL,
	MEMAGE INT,
	MEMGENDER VARCHAR(20),
	MEMEMAIL VARCHAR(50),
	MEMPROFILE VARCHAR(50), 
	MEMSTATUS INT DEFAULT 0, 
	PRIMARY KEY(MEMIDX)
);

DROP TABLE CM_MEMBER;
DELETE FROM CM_MEMBER;

SELECT * FROM CM_MEMBER;


-- 댓글 --
CREATE TABLE CM_COMMENT(
	CMTIDX INT AUTO_INCREMENT,         
	IDX INT NOT NULL,                  
	CMTCONTENT VARCHAR(2000) NOT NULL, 
	MEMID VARCHAR(20) NOT NULL,       
	MEMNAME VARCHAR(30) NOT NULL,     
	MEMNICKNAME VARCHAR(30) NOT NULL,     
	MEMPROFILE VARCHAR(50),            
	CMTINDATE DATETIME DEFAULT NOW(), 
	CMTAVAILABLE INT DEFAULT 1,       
	PRIMARY KEY(CMTIDX)
);

DROP TABLE CM_COMMENT;

SELECT * FROM CM_COMMENT;

DELETE FROM CM_COMMENT;

SELECT * FROM CM_LIKE WHERE IDX = 49;



--좌석--
CREATE TABLE CM_SEAT(
	SEATNUM INT NOT NULL,   
	SEATNAME VARCHAR(20) NOT NULL, 
	SEATAVAILABLE INT DEFAULT 0,   
	PRIMARY KEY(SEATNUM)
);

SELECT * FROM CM_SEAT;
DROP TABLE CM_SEAT;
DELETE FROM CM_SEAT;

INSERT INTO CM_SEAT(SEATNUM, SEATNAME) VALUES
(1, '01번'),
(2, '02번'),
(3, '03번'),
(4, '04번'),
(5, '05번'),
(6, '06번'),
(7, '07번'),
(8, '08번'),
(9, '09번'),
(10, '10번'),







INSERT INTO CM_SEAT(SEATNUM, SEATNAME, SEATAVAILABLE) VALUES
(11, 'no11', 1);



--좌석예약정보--
CREATE TABLE CM_RESERVATION(
	RIDX INT AUTO_INCREMENT,  
	SEATNUM INT NOT NULL, 
	SEATNAME VARCHAR(20) NOT NULL, 
	MEMID VARCHAR(20) NOT NULL, 
	MEMNAME VARCHAR(20) NOT NULL,
	MEMNICKNAME VARCHAR(20) NOT NULL,
	STARTTIME DATETIME DEFAULT NOW(),
	ENDTIME DATETIME DEFAULT NOW(),     
	ENDTIMESTATUS INT DEFAULT 0,   
	PRIMARY KEY(RIDX)
);


SELECT * FROM CM_RESERVATION;


DELETE FROM CM_RESERVATION;
DROP TABLE CM_RESERVATION;


SELECT * FROM CM_RESERVATION WHERE MEMID = "admin" AND ENDTIME IS NULL ORDER BY SEATNUM DESC LIMIT 1

SELECT * FROM CM_RESERVATION WHERE MEMID = "admin";
SELECT * FROM CM_RESERVATION WHERE MEMID = "admin" ORDER BY RIDX DESC LIMIT 1

SELECT * FROM CM_MEMBER;
DELETE FROM CM_MEMBER WHERE MEMID ="admin";

--리뉴얼 --
INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('admin','1234','관리자', '스프링관리자', 20, '남자', 'admin@gmail.com');


INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('samsung','1234','이재용', '9만전자가즈아', 20, '남자', 'samsung@gmail.com');

INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('apple','1234','Jobs', '스마트폰은 아이폰', 20, '남자', 'apple@gmail.com');

INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('NVIDIA','1234','Jensen Huang', 'GPU를 선물로 줄꼐요', 20, '남자', 'NVIDIA@gmail.com');

INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('JAVA','1234','James Gosling', '나는야 자바의아버지', 20, '남자', 'JAVA@gmail.com');

INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('spring','1234','Rod Johnson', '스프링의창시자', 20, '남자', 'spring@gmail.com');

INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('korea','1234','서울이', '케이팝데몬헌터스', 20, '남자', 'korea@gmail.com');


INSERT INTO CM_MEMBER (MEMID, MEMPASSWORD, MEMNAME, MEMNICKNAME, MEMAGE, MEMGENDER, MEMEMAIL)
VALUES ('tesla','1234','Elon Musk', '자율주행', 20, '남자', 'tesla@gmail.com');

DELETE FROM CM_MEMBER;

SELECT * FROM CM_MEMBER;


DELETE FROM CM_BOARD WHERE MEMID = "NVIDIA";


INSERT INTO CM_BOARD
SELECT IFNULL(MAX(IDX)+1,1), 'admin', '학부모 상담 주간 안내', '다음 주 월요일부터 금요일까지 학부모 상담 주간이 진행됩니다.', '스프링관리자', NOW(),0,0, null, IFNULL(MAX(BOARDGROUP)+1,1), 0, 0, 1
FROM CM_BOARD;




INSERT INTO CM_BOARD 
SELECT IFNULL(MAX(IDX)+1,1),
       '스프링관리자', 
       '공지사항 1: 새로운 기능과 서비스 개선 안내', 
       '1번 공지사항: 이번 업데이트로 새로운 기능이 추가되고 기존 서비스가 개선되었습니다. 자세한 내용은 공지사항 페이지를 참고해주세요.', 
       '스프링관리자', 
       NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 
FROM CM_BOARD;

INSERT INTO CM_BOARD 
SELECT IFNULL(MAX(IDX)+1,1),
       '스프링관리자', 
       '알림 2: 서버 점검 및 사용자 안내', 
       '2번 알림: 예정된 서버 점검 일정과 이용자 주의 사항을 안내드립니다. 점검 시간 동안 서비스 이용에 제한이 있을 수 있습니다.', 
       '스프링관리자', 
       NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 
FROM CM_BOARD;



INSERT INTO CM_BOARD SELECT IFNULL(MAX(IDX)+1,1),'admin','공지사항 1','1번 공지사항 안내드립니다','스프링관리자',NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 FROM CM_BOARD;
INSERT INTO CM_BOARD SELECT IFNULL(MAX(IDX)+1,1),'admin','알림 2','2번 알림 전달드립니다','스프링관리자',NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 FROM CM_BOARD;
INSERT INTO CM_BOARD SELECT IFNULL(MAX(IDX)+1,1),'admin','행사 안내 3','3번 행사 일정 안내입니다','스프링관리자',NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 FROM CM_BOARD;
INSERT INTO CM_BOARD SELECT IFNULL(MAX(IDX)+1,1),'admin','업데이트 4','4번 시스템 업데이트 내용 안내','스프링관리자',NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 FROM CM_BOARD;
INSERT INTO CM_BOARD SELECT IFNULL(MAX(IDX)+1,1),'admin','공지 5','5번 공지 관련 안내','스프링관리자',NOW(),0,0,NULL,IFNULL(MAX(BOARDGROUP)+1,1),0,0,1 FROM CM_BOARD;



--리뉴얼--
CREATE TABLE CM_BOOK(
	BKNUM INT NOT NULL AUTO_INCREMENT, 
	BKTITLE VARCHAR(50) NOT NULL,
	BKAUTHOR VARCHAR(30) NOT NULL,
	BKCOMPANY VARCHAR(50) NOT NULL,
	BKISBN VARCHAR(30) NOT NULL,
	BKCATEGORY VARCHAR(30) NOT NULL,
	BKCALLNUMBER VARCHAR(30) NOT NULL,
	BKCOUNT INT DEFAULT 0,
	PRIMARY KEY(BKNUM)
)

SELECT * FROM CM_BOOK;

DELETE FROM CM_BOOK;
DROP TABLE CM_BOOK;

INSERT INTO CM_BOOK (BKTITLE, BKAUTHOR, BKCOMPANY, BKISBN, BKCATEGORY, BKCALLNUMBER, BKCOUNT) VALUES
('채식주의자', '한강', '창비', '9788936433536', '소설', '813.7 한강 채', 1);

INSERT INTO CM_BOOK (BKTITLE, BKAUTHOR, BKCOMPANY, BKISBN, BKCATEGORY, BKCALLNUMBER, BKCOUNT) VALUES
('희랍어 시간', '한강', '문학동네', '9788954616515', '소설', '813.7 한강 희', 1);

INSERT INTO CM_BOOK (BKTITLE, BKAUTHOR, BKCOMPANY, BKISBN, BKCATEGORY, BKCALLNUMBER, BKCOUNT) VALUES
('흰', '한강', '창비', '9788936434274', '에세이', '814.7 한강 흰', 1);


INSERT INTO CM_BOOK (BKTITLE, BKAUTHOR, BKCOMPANY, BKISBN, BKCATEGORY, BKCALLNUMBER, BKCOUNT) VALUES
('천문학 개론', 'Roger Freedman', 'Freeman', '9781319119277', '과학', '520 F83u', 1);


--Message--
CREATE TABLE CM_MESSAGE(
	MSGIDX INT NOT NULL AUTO_INCREMENT, 
	TOID VARCHAR(20) NOT NULL, 
	FROMID VARCHAR(20) NOT NULL, 
	MSGTITLE VARCHAR(100) NOT NULL,
	MSGCONTENT VARCHAR(2000) NOT NULL,
	MSGDATE DATETIME DEFAULT NOW(),
	MSGIMGPATH VARCHAR(500), 
	READSTATUS INT DEFAULT 0,   --읽음유무--
	ARRIVESTATUS INT DEFAULT 0, --도착메세지유무--
	DELTOID INT DEFAULT 0,     --받는사람이 삭제--
	DELFROMID INT DEFAULT 0,   --보낸사람이 삭제--
	PRIMARY KEY(MSGIDX)
)



SELECT ARRIVESTATUS FROM CM_MESSAGE WHERE TOID = "admin";

SELECT * FROM CM_MESSAGE;

UPDATE CM_MESSAGE SET ARRIVESTATUS = 0 WHERE TOID = "admin";
SELECT COUNT(*) FROM CM_MESSAGE WHERE TOID = "admin" AND ARRIVESTATUS = 0;

DELETE FROM CM_MESSAGE;
DROP TABLE CM_MESSAGE;


INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '시스템 안정화를 위한 내일 새벽 2시 정기 점검 안내',
    '내일 새벽 2시부터 서비스 안정화 및 장비 점검을 위한 정기 시스템 점검이 진행될 예정입니다. 작업 시간 동안 일부 서비스 이용이 제한될 수 있으니 양해 부탁드립니다. 더 나은 서비스 환경 제공을 위한 필수 작업이오니 참고 부탁드립니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '신규 기능 업데이트 완료 및 개선 사항 상세 안내',
    '이번 신규 기능 업데이트가 성공적으로 마무리되었습니다. 사용 편의성 향상을 위해 다양한 기능이 추가되었으며, 세부 변경 사항은 안내문을 통해 확인하실 수 있습니다. 앞으로도 더 나은 서비스 제공을 위해 지속적으로 개선하겠습니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '사용자 의견을 반영한 UI 개편 및 사용성 개선 보고',
    '여러분의 의견을 바탕으로 UI가 대폭 개선되었습니다. 더 직관적이고 편리한 화면 구성을 통해 서비스 이용 경험이 한층 더 높아졌습니다. 추가 의견이 있다면 언제든지 전달해주시면 감사하겠습니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '보안 강화 조치에 따른 비밀번호 변경 권장 안내',
    '최근 계정 보안 강화를 위한 점검을 실시한 결과, 비밀번호 변경 필요성이 확인되었습니다. 안전한 서비스 이용을 위해 주기적인 비밀번호 변경을 권장드립니다. 특히 여러 사이트에서 동일 비밀번호 사용 시 변경을 강력히 추천드립니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '최근 발생한 서비스 응답 지연 현상 해결 안내',
    '일부 서비스에서 발생하던 응답 지연 문제가 해결되었습니다. 문제 원인을 분석해 조치했으며 현재는 정상적으로 이용 가능합니다. 이용 중 불편을 드려 죄송하며, 재발 방지를 위해 지속적으로 시스템을 점검하겠습니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '이번 주 금요일 예정된 정기 서버 점검 일정 안내',
    '이번 주 금요일에 정기 서버 점검이 진행될 예정입니다. 점검 시간 동안 일부 기능이 제한되거나 접속이 원활하지 않을 수 있으니 참고 부탁드립니다. 더 좋은 서비스 환경 구축을 위한 작업입니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '사용자 활동 로그 정책 변경에 대한 상세 안내',
    '보안 강화를 위해 사용자 활동 로그 정책이 개정되었습니다. 이번 개정은 개인정보 보호와 서비스 최적화를 위한 조치이며, 변경된 내용은 별도 공지를 통해 확인 가능합니다. 서비스 이용에 참고해주시기 바랍니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '일시 중단되었던 기능 정상화 완료 안내',
    '일시적 오류로 인해 이용할 수 없던 특정 기능이 정상화되었습니다. 오류 원인을 분석 및 수정하여 현재는 정상적으로 이용 가능합니다. 불편을 겪으신 분들께 진심으로 사과드립니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'samsung',
    '최신 보안 패치 적용을 통한 서비스 보안 강화 안내',
    '보안 취약점 개선을 위해 최신 보안 패치를 적용했습니다. 서비스 안정성과 안전성 강화를 위한 필수 조치이며 앞으로도 지속적으로 점검이 진행될 예정입니다. 안심하고 서비스 이용을 부탁드립니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'korea',
    '접속자 증가로 인한 일시적 서비스 지연 안내',
    '현재 접속자 수가 일시적으로 증가함에 따라 일부 기능이 평소보다 느리게 동작할 수 있습니다. 서버 자원을 즉시 확장·조정 중이며 최대한 빠르게 정상화될 예정입니다. 이용에 불편을 드려 죄송합니다.'
);






INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '시스템 점검 예정 안내 – 서비스 이용 관련 중요 공지', 
'오는 금요일 새벽 1시부터 시스템 점검이 진행될 예정입니다. 이용에 참고 부탁드립니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '신규 기능 배포에 따른 서비스 이용 방법 변경 안내', 
'금일 업데이트된 신규 기능의 사용 방법이 변경되었으니 공지사항을 확인해주세요.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '서버 성능 개선 작업 일정 및 영향 범위 안내', 
'보다 안정적인 서비스를 위해 서버 성능 개선 작업을 진행합니다. 작업 시간 동안 일부 기능 사용이 제한될 수 있습니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '보안 정책 강화에 따른 사용자 인증 절차 변경 공지', 
'보안 강화를 위해 로그인 시 추가 인증 절차가 도입될 예정입니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '데이터 백업 작업 사전 안내 – 서비스 일시 중단 예정', 
'정기 데이터 백업으로 인해 일부 서비스가 잠시 중단됩니다. 자세한 시간은 추후 안내드립니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '긴급 업데이트 적용에 따른 일시적 접속 지연 현상 안내', 
'보안 패치 적용으로 인해 잠시 접속 지연이 발생할 수 있습니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '사용자 의견 반영 결과 및 향후 개선 업데이트 계획 공유', 
'최근 수집한 사용자 의견을 기반으로 개선 사항을 정리하여 다음 업데이트에 반영할 예정입니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '서비스 장애 복구 완료 보고 및 재발 방지 대책 안내', 
'금일 발생한 서비스 장애가 정상적으로 복구되었습니다. 상세 원인 및 대책을 공유드립니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '정기 보안 점검 일정 공지 – 개인정보 보호 관련 안내', 
'개인정보 보호 강화를 위해 정기 보안 점검을 실시합니다. 점검 중 일부 기능이 제한될 수 있습니다.');

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES ('samsung', 'admin', '서비스 최적화를 위한 시스템 환경 설정 변경 예정 안내', 
'더 나은 사용 환경을 위해 시스템 환경 설정 변경 작업이 예정되어 있으니 참고 부탁드립니다.');



SELECT * FROM CM_MESSAGE WHERE FROMID = "admin" ORDER BY MSGIDX DESC



INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'korea',
    '접속자 증가로 인한 일시적 서비스 지연 안내',
    '현재 접속자 수가 일시적으로 증가하여 일부 기능이 지연될 수 있습니다. 서버 확장을 진행 중이며 곧 정상화될 예정입니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'admin',
    'tesla',
    '서버 자원 조정 안내',
    '서비스 안정화를 위해 서버 자원 조정 작업을 진행하고 있습니다. 작업 동안 일부 서비스 이용이 느릴 수 있습니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'korea',
    'admin',
    '일시적 서비스 응답 지연 공지',
    '트래픽 증가로 인해 서비스 응답 속도가 다소 느릴 수 있습니다. 빠른 조치를 위해 최적화 작업을 수행하고 있습니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'korea',
    'admin',
    '서비스 안정화 작업 중',
    '일부 기능에서 지연 현상이 발생하고 있어 안정화 작업을 진행 중입니다. 이용에 불편을 드려 죄송합니다.'
);

INSERT INTO CM_MESSAGE (TOID, FROMID, MSGTITLE, MSGCONTENT)
VALUES (
    'korea',
    'admin',
    '트래픽 급증 관련 안내',
    '현재 예상치 못한 트래픽 증가로 인해 서비스 이용이 일시적으로 지연되고 있습니다. 최대한 빠르게 정상화하겠습니다.'
);

