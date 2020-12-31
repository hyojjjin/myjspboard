DROP TABLE member;
CREATE TABLE member (
    memberid VARCHAR2(50) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    password VARCHAR2(10) NOT NULL,
    regdate DATE NOT NULL
);
SELECT * FROM member;
DROP table article;
CREATE TABLE article (
    article_no NUMBER GENERATED AS IDENTITY,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER,
    PRIMARY KEY (article_no)
);
SELECT * FROM article;
SELECT * FROM article_content;
SELECT COUNT(*) FROM article;

CREATE TABLE article_content (
    article_no NUMBER PRIMARY KEY,
    content VARCHAR2(4000)
);

INSERT INTO article (write_id,......) 
VALUES (...);

-- 11g
INSERT INTO article (article_no, write_id,......) 
VALUES (article_seq.nextval, ...);

CREATE SEQUENCE article_seq;
CREATE TABLE article (
    article_no NUMBER,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnd NUMBER,
    PRIMARY KEY (article_no)
);

-- page 처리
SELECT count(*) FROM article;
INSERT INTO article (writer_id, writer_name, title, regdate, moddate, read_cnt)
VALUES ('a', 'a', 'a', sysdate, sysdate, 0);
COMMIT;

SELECT * FROM (
SELECT article_no, title, ROW_NUMBER() OVER (ORDER BY article_no DESC) rn 
FROM article
--ORDER BY article_no DESC
)
WHERE rn BETWEEN 6 AND 10;




-- 댓글
-- 11g
CREATE SEQUENCE reply_seq;
CREATE TABLE reply (
    replyid NUMBER,
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    PRIMARY KEY (replyid)
);
INSERT INTO reply (replyid, memberid, article_no, body, regdate)
VALUES (reply_seq.nextval, ' ', 0, ' ', SYSDATE);
-- 12c
DROP TABLE reply;
CREATE TABLE reply (
    replyid NUMBER GENERATED AS IDENTITY,
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    PRIMARY KEY (replyid)
);
INSERT INTO reply (memberid, article_no, body, regdate)
VALUES (' ', 0, ' ', SYSDATE);


SELECT * FROM reply;

SELECT replyid, memberid, article_no, body, regdate
FROM reply
WHERE article_no=103
ORDER BY replyid DESC;