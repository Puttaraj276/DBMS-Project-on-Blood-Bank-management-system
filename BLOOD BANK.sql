DROP TABLE DONOR CASCADE CONSTRAINTS;
DROP TABLE BLOODBAG CASCADE CONSTRAINTS;
DROP TABLE BLOODBANK CASCADE CONSTRAINTS;
DROP TABLE BBMANAGER CASCADE CONSTRAINTS;
DROP TABLE HOSPITAL CASCADE CONSTRAINTS;
DROP TABLE RECEPTIONIST CASCADE CONSTRAINTS;
DROP TABLE PATIENT CASCADE CONSTRAINTS;
DROP TABLE RECIEVES CASCADE CONSTRAINTS;

SELECT * FROM DONOR;
SELECT * FROM BLOODBAG;
SELECT * FROM RECEPTIONIST;
SELECT * FROM HOSPITAL;
SELECT * FROM BBMANAGER;
SELECT * FROM BLOODBANK;
SELECT * FROM PATIENT;
select * from recieves;

CREATE TABLE BBManager (
    manager_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    phone_number VARCHAR(20),
    address VARCHAR(100) 
);

create table user(
    user_id INT PRIMARY KEY,
    username varchar(20),
    email varchar(30)
);

create table post(
    post_id int PRIMARY KEY,
    title varchar(30),
    content varchar(50),
    created_at DATE,
    user_id int,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE COMMENT(
     COMMENT_ID INT PRIMARY KEY,
     POST_ID INT REFERENCES POST(POST_ID),
     USER_ID INT REFERENCES USER(USER_ID),
     TEXT VARCHAR(50)
);


CREATE TABLE BloodBank (
    bank_id INT PRIMARY KEY,
    Bname VARCHAR(50),
    phone_number VARCHAR(20),
    address VARCHAR(100),
    ISSUE_DATE DATE,
    manager_id int,
    FOREIGN KEY (manager_id) REFERENCES BBmanager(manager_id)   
);

CREATE TABLE Receptionist (
    receptionist_id INT PRIMARY KEY,
    Rname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    phone_number VARCHAR(20),
    address VARCHAR(100),
    bank_id INT,
    SALARY INT,
    FOREIGN KEY (bank_id) REFERENCES BloodBank(bank_id)
);

CREATE TABLE Donor (
    donor_id INT PRIMARY KEY,
    Dname VARCHAR(50),
    RID INT,
    gender VARCHAR(10),
    age INT,
    phone_number VARCHAR(20),
    address VARCHAR(100),
    FOREIGN KEY (RID) REFERENCES RECEPTIONIST(RECEPTIONIST_ID)
);

CREATE TABLE Hospital (
    hospital_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);

CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    phone_number int,
    address VARCHAR(100),
    hospital_id INT,
    BLOODTYPE VARCHAR(10),
    FOREIGN KEY (hospital_id) REFERENCES Hospital(hospital_id)
);

CREATE TABLE BloodBag (
    bag_id INT PRIMARY KEY,
    collection_date DATE,
    expiration_date DATE,
    blood_type VARCHAR(10),
    donor_id INT,
    bank_id INT,
    patient_id int,
    FOREIGN KEY (donor_id) REFERENCES Donor(donor_id),
    FOREIGN KEY (bank_id) REFERENCES BloodBank(bank_id),
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID)
);





CREATE TABLE RECIEVES 
(
HID INT,
BID INT,
PRIMARY KEY(HID,BID),
FOREIGN KEY (HID) REFERENCES HOSPITAL(HOSPITAL_ID),
FOREIGN KEY (BID) REFERENCES BLOODBANK(BANK_ID)
);



INSERT INTO BBManager VALUES(1,'SOMU','MALE',67,987654321,'MADASANAL');
INSERT INTO BBManager VALUES(2,'PAVITRA','FEMALE',56,987654321,'GONASAGI');
INSERT INTO BBManager VALUES(3,'SAGAR','MALE',36,987654321,'ARAKERI');
INSERT INTO BBManager VALUES(4,'RAMU','MALE',19,987654321,'MORABAGI');
INSERT INTO BBManager VALUES(5,'HARMAN','FEMALE',25,987654321,'MADASANAL');

insert into BloodBank VALUES(1,'ROTATRY',8431538580,'AMARGOL','',3);
insert into BloodBank VALUES(2,'FRIENDS',8431538580,'NAVANAGAR','',4);
insert into BloodBank VALUES(3,'SANKALP',8431538580,'KOLAR','',2);
insert into BloodBank VALUES(4,'ATHAR',8431538580,'KEMPAL','',5);
insert into BloodBank VALUES(5,'NATIONAL',8431538580,'HEBSUR','',1);

INSERT INTO Receptionist VALUES(1,'SUNIL','MALE',29,123456789,'BABAR',1,25000);
INSERT INTO Receptionist VALUES(2,'GANGU','FEMALE',29,123456789,'BABAR',3,18000);
INSERT INTO Receptionist VALUES(3,'manju','MALE',29,123456789,'BABAR',4,21000);
INSERT INTO Receptionist VALUES(4,'SMRITI','FEMALE',29,123456789,'BABAR',2,17000);
INSERT INTO Receptionist VALUES(5,'ravi','MALE',29,123456789,'BABAR',5,26000);

insert into Donor values(1,'AJEET',1,'MALE',20,9731197666,'GADAG');
insert into Donor values(2,'SUSHMA',1,'FEMALE',20,9731197666,'BALLARI');
insert into Donor values(3,'ARMAN',4,'MALE',20,9731197666,'BANKOK');
insert into Donor values(4,'ROHAN',1,'MALE',20,9731197666,'BIJAPUR');
insert into Donor values(5,'SHREYA',5,'FEMALE',20,9731197666,'KERUR');
insert into Donor values(6,'SUPRI',3,'FEMALE',20,9731197666,'GADAG');
insert into Donor values(7,'PERRY',3,'FEMALE',20,9731197666,'GADAG');
insert into Donor values(8,'KUMAR',2,'MALE',20,973119066,'GADAG');
insert into Donor values(9,'KANGANA',5,'FEMALE',20,9711197666,'KLIWAD');
insert into Donor values(10,'RAJU',4,'MALE',20,9731193366,'GADAG');

insert into Hospital values(1,'kims',9988776655,'HUBLI');
insert into Hospital values(2,'BLOODCLINIC',9988776655,'NAVANAGAR');
insert into Hospital values(3,'KAMALBAI',9988776655,'DHARWAD');
insert into Hospital values(4,'kims||',9988776655,'HUBLI-01');
insert into Hospital values(5,'SUSRAT',9988776655,'HUBLI');


insert into Patient values(1,'MOHAN','MALE',27,6666777722,'RAMANAGAR',1,'O+VE'); 
insert into Patient values(2,'MONICA','FEMALE',35,6666777722,'GODAVARI',2,'A+VE'); 
insert into Patient values(3,'SHREYASH','MALE',22,6666777722,'DAVANGERE',3,'B+VE'); 
insert into Patient values(4,'KATRINA','FEMALE',27,6666777722,'MUMBAI',4,'O-VE'); 
insert into Patient values(5,'MANAV','MALE',27,6666777722,'DHARWAD',5,'AB+VE'); 


INSERT INTO BloodBag values(1,'12-MAR-2023','21-APR-2023','O+VE',2,1,1);
INSERT INTO BloodBag values(2,'12-MAR-2023','21-APR-2023','A+VE',1,1,2);
INSERT INTO BloodBag values(3,'12-MAR-2023','21-APR-2023','B+VE',3,2,3);
INSERT INTO BloodBag values(4,'12-MAR-2023','21-APR-2023','O-VE',4,1,4);
INSERT INTO BloodBag values(5,'12-MAR-2023','21-APR-2023','AB+VE',5,5,5);
INSERT INTO BloodBag values(6,'12-MAR-2023','21-APR-2023','AB-VE',6,4,'');
INSERT INTO BloodBag values(7,'12-MAR-2023','21-APR-2023','A-VE',8,3,'');
INSERT INTO BloodBag values(8,'12-MAR-2023','21-APR-2023','B-VE',10,2,'');
INSERT INTO BloodBag values(9,'12-MAR-2023','21-APR-2023','A+VE',9,5,'');
INSERT INTO BloodBag values(10,'12-MAR-2023','21-APR-2023','B+VE',7,4,'');



insert into RECIEVES values(1,2);
insert into RECIEVES values(2,3);
insert into RECIEVES values(3,4);
insert into RECIEVES values(4,1);
insert into RECIEVES values(5,5);

SELECT * FROM DONOR;
SELECT * FROM BLOODBAG;
SELECT * FROM RECEPTIONIST;
SELECT * FROM HOSPITAL;
SELECT * FROM BBMANAGER;
SELECT * FROM BLOODBANK;
SELECT * FROM PATIENT;
select * from recieves;


--SIMPLE  QUERIES 5
--Retrieve the details of all the blood bags that have not been used by any patient:
SELECT * FROM BLOODBAG BB,PATIENT P  WHERE BB.patient_id=P.patient_id;

-- RETREIEVE THE DETAILS OF ALL BLOODBAGS WHICH ARE OF TYPE O+VE AND NOT YET EXPIRED;
SELECT bag_id,collection_date,expiration_date,blood_type  FROM BloodBag WHERE blood_type = 'O+VE' AND expiration_date > SYSDATE;

--Retrieve the name, age, and blood type of all donors who are between 18 and 30 years old and have donated blood in the last month.
SELECT Dname, age, blood_type FROM Donor D,BLOODBAG B 
WHERE d.age BETWEEN 18 AND 30 AND D.DONOR_ID=B.DONOR_ID AND B.COLLECTION_DATE>='12-FEB-2023';

--Retrieve the name, address, and phone number of all hospitals that have received blood from a particular blood bank.
SELECT h.name, h.address, h.phone_number
FROM Hospital h,RECIEVES R,BLOODBANK BB
WHERE H.HOSPITAL_ID=R.HID AND BB.BANK_ID=R.BID;

--Retrieve the name and address of all blood banks that have a blood bag with a particular blood type and that has not yet expired.
SELECT BB.BNAME,BB.ADDRESS FROM BLOODBANK BB,BLOODBAG B WHERE BB.BANK_ID=B.BANK_ID AND B.EXPIRATION_DATE<='13-MAR-2023' AND B.BLOOD_TYPE='A+';

--Retrieve the name, age, and gender of all donors who have donated more than 3 times in the past year, ordered by the number of times they have donated.
SELECT d.Dname, d.age, d.gender, COUNT(bb.bag_id) AS num_donations
FROM Donor D,BLOODBAG BB
WHERE D.DONOR_ID=BB.DONOR_ID AND BB.COLLECTION_DATE>='12-MAR-2022'
GROUP BY d.donor_id, d.Dname, d.age, d.gender
HAVING COUNT(bb.bag_id) > 3
ORDER BY num_donations DESC;

--COMPLEX QUERIES
--NESTED 3

--Find the name and contact information of all donors who donated blood in the past month.
SELECT Dname, phone_number
FROM donor
WHERE donor_id IN (
  SELECT donor_id
  FROM bloodbag
  WHERE collection_date>= '12-FEB-2023'
);

--Find the total number of blood bags donated by each donor
SELECT Dname, (
  SELECT COUNT(*)
  FROM bloodbag
  WHERE donor.donor_id = bloodbag.donor_id
) AS total_donations
FROM donor;

--Find the names of all patients who received blood from a specific donor
SELECT name
FROM patient
WHERE patient_id IN (
  SELECT patient_id
  FROM bloodbag
  WHERE donor_id = (
    SELECT donor_id
    FROM donor
    WHERE Dname = 'SUSHMA'
  )
);

--CORRELATED QUERIES 5

--Retrieve the list of donors who donated blood before the age of 25:
SELECT *
FROM donor d
WHERE d.age < 25 AND EXISTS (
    SELECT *
    FROM bloodbag b
    WHERE b.donor_id = d.donor_id
    );
    
--Retrieve the list of hospitals that received blood from a specific blood bank:
SELECT *
FROM hospital H
WHERE EXISTS (
    SELECT *
    FROM RECIEVES R
    WHERE R.HID = H.hospital_id 
    AND R.BID IN(SELECT BANK_ID FROM BLOODBANK WHERE BNAME='ROTATRY')
    );

--Retrieve the list of blood banks with the highest number of blood bags
SELECT *
FROM bloodbank b1
WHERE (SELECT COUNT(*)
       FROM bloodbag b2
       WHERE b2.bank_id = b1.bank_id
      ) = (
         SELECT MAX(cnt)
         FROM (
             SELECT COUNT(*) AS cnt
             FROM bloodbag
             GROUP BY bank_id
          ) tmp
      );

--Find the donors who have donated the maximum number of times:
SELECT d.Dname, COUNT(*) AS donation_count
FROM donor d
WHERE EXISTS (
    SELECT 1
    FROM bloodbag bg
    WHERE bg.donor_id = d.DONOR_id
)
GROUP BY d.Dname
HAVING COUNT(*) = (
    SELECT MAX(donation_count)
    FROM (
        SELECT COUNT(*) AS donation_count
        FROM bloodbag
        GROUP BY donor_id
    )
);

--Find the blood types that are currently unavailable in all blood banks:
SELECT DISTINCT B.blood_type
FROM bloodbank bb,BLOODBAG B
WHERE  
 NOT EXISTS (
    SELECT 1
    FROM bloodbag bg
    WHERE bg.bank_id = bb.bank_id
    
);




--PLSQL

--SIMPLE PLSQL
--1)Query to update the phone number of a specific donor:

DECLARE
   v_donor_id Donor.donor_id%TYPE := 1;
   v_new_phone_number Donor.phone_number%TYPE := '9876543210';
BEGIN
   UPDATE Donor SET phone_number = v_new_phone_number WHERE donor_id = v_donor_id;
   DBMS_OUTPUT.PUT_LINE('Donor phone number updated to: ' || v_new_phone_number);
END;


--2)Query to insert a new receptionist into the database:
DECLARE
   v_receptionist_id Receptionist.receptionist_id%TYPE;
   v_receptionist_name Receptionist.Rname%TYPE := 'John';
   v_receptionist_gender Receptionist.gender%TYPE := 'MALE';
   v_receptionist_age Receptionist.age%TYPE := 25;
   v_receptionist_phone Receptionist.phone_number%TYPE := '7894738230';
   v_receptionist_address Receptionist.address%TYPE := '123hubli';
   v_bank_id Receptionist.bank_id%TYPE := 1;
BEGIN
   SELECT MAX(receptionist_id) + 1 INTO v_receptionist_id FROM Receptionist;
   INSERT INTO Receptionist (receptionist_id, Rname, gender, age, phone_number, address, bank_id) VALUES (v_receptionist_id, v_receptionist_name, v_receptionist_gender, v_receptionist_age, v_receptionist_phone, v_receptionist_address, v_bank_id);
   DBMS_OUTPUT.PUT_LINE('New receptionist added with ID: ' || v_receptionist_id);
END;


--CURSORS
--1) retrieve all the donors along with their name, age and phone number:

DECLARE
   v_name Donor.Dname%TYPE;
   v_age Donor.age%TYPE;
   v_phone Donor.phone_number%TYPE;
   CURSOR CUR IS SELECT Dname, age, phone_number FROM Donor;
BEGIN
 OPEN CUR;
 loop
    fetch cur into V_NAME,V_AGE,V_PHONE;
    exit when cur%notfound;
   DBMS_OUTPUT.PUT_LINE('Donor Name: ' || v_name || ' Age: ' || v_age || ' Phone: ' || v_phone);
  end loop;
  close cur;
END;


--2)retrieve the details of all the blood bags that are of type O+VE and have not expired yet:
DECLARE
   v_bag_id BloodBag.bag_id%TYPE;
   v_collection_date BloodBag.collection_date%TYPE;
   v_expiration_date BloodBag.expiration_date%TYPE;
   v_blood_type BloodBag.blood_type%TYPE;
   CURSOR CUR IS SELECT bag_id,collection_date,expiration_date,blood_type INTO v_bag_id,v_collection_date,v_expiration_date,v_blood_type  FROM BloodBag WHERE blood_type = 'O+VE' AND expiration_date > SYSDATE;
BEGIN
   open cur;
   LOOP
      fetch cur into v_bag_id,v_collection_date,v_expiration_date,v_blood_type;
      exit when cur%notfound;
      DBMS_OUTPUT.PUT_LINE('Bag ID: ' || v_bag_id || ' Collection Date: ' || v_collection_date || ' Expiration Date: ' || v_expiration_date || ' Blood Type: ' || v_blood_type);
   END LOOP;
   close cur;
END;

--3)retrive information about all patient in descending oreder based on hospital id
declare 
cursor king is select * from Patient order by hospital_id desc;
roww Patient%rowtype;
begin
open king;
loop
fetch king into roww;
exit when king%notfound;
dbms_output.put_line(roww.patient_id||' '||roww.name||' '||roww.address);
end loop;
close king;
end;

--4)DISPLAY TOP 3 RECEPTIONISTS ACCORDING TO THEIR SALARY
DECLARE
SAL INT;
CURSOR SAL_CUR IS SELECT SALARY FROM RECEPTIONIST ORDER BY SALARY DESC;
BEGIN
OPEN SAL_CUR;
FOR I IN 1..3 LOOP
FETCH SAL_CUR INTO SAL;
DBMS_OUTPUT.PUT_LINE(SAL);
END LOOP;
CLOSE SAL_CUR;
END;
/


--TRIGGERS
--1)after entering  into new donor , insert that values into another table
drop table newDonor cascade constraints;
CREATE TABLE newDonor (
    donor_id INT PRIMARY KEY,
    Dname VARCHAR(50),
    RID INT,
    gender VARCHAR(10),
    age INT,
    phone_number VARCHAR(20),
    address VARCHAR(100),
    FOREIGN KEY (RID) REFERENCES RECEPTIONIST(RECEPTIONIST_ID)
);

create or replace trigger new_table
after insert on Donor for each row
begin
insert into newDonor values(:new.donor_id,:new.dname,:new.rid,:new.gender,:new.age,:new.phone_number,:new.address);
end;

--select * from Donor;

--SELECT * FROM BloodBag;




--PROCEDURES

--1)increase expire date by 20 days

create or replace procedure expirdate_up
as
begin
update BloodBag set expiration_date=expiration_date+20;
end;

exec expirdate_up;


--2)Procedure to add a new donor to the system:
CREATE OR REPLACE PROCEDURE add_donor(
    p_donor_id in int,
    p_name IN VARCHAR2,
    p_rid  in int,
    p_gender IN VARCHAR2,
    p_age IN NUMBER, 
    p_contact_no IN VARCHAR2,
    p_address in varchar2
)
as
BEGIN
    INSERT INTO donor (donor_id, dname,rid, gender,age,phone_number,address)
    VALUES (p_donor_id,p_name,p_rid ,p_gender,p_age, p_contact_no,p_address);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Donor added successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error adding donor: ' || SQLERRM);
        ROLLBACK;
END;

execute add_donor(12,'vinod',4,'male',33,'9830487392','dharwad');


--3)PROCEDURE TO INCRESE THE SALARY OF RECEPTIONIST GIVEN RID AS INPUT

CREATE OR REPLACE PROCEDURE P1(ID IN NUMBER)
AS
BEGIN
UPDATE RECEPTIONIST 
SET SALARY=SALARY+2000
WHERE RECEPTIONIST_ID=ID;
END;
/

--FUNCTION
--1)display the name of the manager id is given as input 

CREATE OR REPLACE FUNCTION F1(X IN NUMBER)
RETURN STRING AS
FUN varchar(10);
BEGIN
SELECT NAME INTO FUN FROM BBMANAGER WHERE MANAGER_ID=X;
RETURN FUN;
end;
/

select F1(1) from dual;