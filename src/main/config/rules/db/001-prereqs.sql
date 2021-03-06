-- Builds roles related to training application

INSERT INTO KRIM_ROLE_T(ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
  VALUES ('KRATRN-ADMN_ROLE',uuid(),1,'Training App Admin','KRA-TRNG','Administrator for the training app','1','Y',NOW());

INSERT INTO KRIM_ROLE_T(ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
  VALUES ('KRATRN-APVR_ROLE',uuid(),1,'Training App Approver','KRA-TRNG','Provides a final decision on the application','1','Y',NOW());

INSERT INTO KRIM_ROLE_T(ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
  VALUES ('KRATRN-RVWR_ROLE',uuid(),1,'Training App Reviewer','KRA-TRNG','Reviews applications and provides notes','1','Y',NOW());

INSERT INTO KRIM_TYP_T(KIM_TYP_ID, OBJ_ID, VER_NBR, NM, SRVC_NM, ACTV_IND, NMSPC_CD)
	VALUES('KRTRN-NMSPC', UUID(), 1, 'Namespace Role', '{http://krworkshop.kuali.org/krworkshop/v0_0_1}namespaceRoleTypeService', 'Y', 'KR-NS');

INSERT INTO KRIM_TYP_ATTR_T(KIM_TYP_ATTR_ID, OBJ_ID, VER_NBR, SORT_CD, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ACTV_IND)
	VALUES('KRTRN-NMSPC-NMSPC', UUID(), 1, 'a', 'KRTRN-NMSPC', '4', 'Y');

INSERT INTO KRIM_ROLE_T (ROLE_ID, OBJ_ID, VER_NBR, ROLE_NM, NMSPC_CD, DESC_TXT, KIM_TYP_ID, ACTV_IND, LAST_UPDT_DT)
	VALUES ('KRTRN-NMSPC_ROLE',uuid(),1,'Namespace Reviewer','KRA-TRNG','Reviewer of master namespace-based data','KRTRN-NMSPC','Y',NOW());


-- Solution for Exercise 1

INSERT INTO KRIM_PERM_T(PERM_ID, NMSPC_CD, PERM_TMPL_ID, NM, DESC_TXT, ACTV_IND, OBJ_ID, VER_NBR)
  VALUES ('KRATRN-DEC_STATUS_PERM', 'KRA-TRNG', 57, 'Edit Decision Status Field', '', 'Y', UUID(), 1);

INSERT INTO KRIM_PERM_ATTR_DATA_T(ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
  VALUES ('KRATRN-DEC_STATUS_PERM-1', 'KRATRN-DEC_STATUS_PERM', 70, 47, 'Training*', UUID(), 1);

INSERT INTO KRIM_PERM_ATTR_DATA_T(ATTR_DATA_ID, PERM_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL, OBJ_ID, VER_NBR)
  VALUES ('KRATRN-DEC_STATUS_PERM-2', 'KRATRN-DEC_STATUS_PERM', 70, 6, 'decisionStatus', UUID(), 1);

INSERT INTO KRIM_ROLE_PERM_T(ROLE_PERM_ID, ROLE_ID, PERM_ID, ACTV_IND, OBJ_ID, VER_NBR)
  VALUES ('KRATRN-DEC_STATUS', 'KRATRN-ADMN_ROLE', 'KRATRN-DEC_STATUS_PERM', 'Y', UUID(), 1);


-- Solution for Exercise 2

-- Builds responsibilities related to committee review

INSERT INTO KRIM_RSP_T(RSP_ID, OBJ_ID, RSP_TMPL_ID, NMSPC_CD, NM, DESC_TXT, ACTV_IND)
    VALUES('KRTRN-4', UUID(), '1', 'KR-IDM', 'Perform Committee Review', '', 'Y');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-4-DOC', UUID(), 'KRTRN-4', '7', '13', 'AdmissionsWorkflowDocument');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-4-NODE', UUID(), 'KRTRN-4', '7', '16', 'CommitteeReview');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-4-REQ', UUID(), 'KRTRN-4', '7', '40', 'N');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-4-RML', UUID(), 'KRTRN-4', '7', '41', 'N');


INSERT INTO KRIM_ROLE_RSP_T(ROLE_RSP_ID, OBJ_ID, ROLE_ID, RSP_ID, ACTV_IND)
    VALUES('KRTRN-4-KRATRN-RVWR_ROLE', UUID(), 'KRATRN-RVWR_ROLE', 'KRTRN-4', 'Y');

INSERT INTO KRIM_ROLE_RSP_ACTN_T(ROLE_RSP_ACTN_ID, OBJ_ID, ACTN_TYP_CD, PRIORITY_NBR, ACTN_PLCY_CD, ROLE_MBR_ID, ROLE_RSP_ID, FRC_ACTN)
    VALUES('KRTRN-4-KRATRN-RVWR_ROLE', UUID(), 'A', NULL, 'F', '*', 'KRTRN-4-KRATRN-RVWR_ROLE', 'N');

-- Solution for Exercise 3

UPDATE KRIM_ROLE_T
	SET KIM_TYP_ID = '17'
	WHERE ROLE_ID = 'KRATRN-APVR_ROLE';

-- Builds responsibilities related to training application

INSERT INTO KRIM_RSP_T(RSP_ID, OBJ_ID, RSP_TMPL_ID, NMSPC_CD, NM, DESC_TXT, ACTV_IND)
    VALUES('KRTRN-3', UUID(), '1', 'KR-IDM', 'Campus Application Review', '', 'Y');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-3-DOC', UUID(), 'KRTRN-3', '7', '13', 'AdmissionsWorkflowDocument');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-3-NODE', UUID(), 'KRTRN-3', '7', '16', 'DepartmentApproval');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-3-REQ', UUID(), 'KRTRN-3', '7', '40', 'N');

INSERT INTO KRIM_RSP_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, RSP_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
    VALUES('KRTRN-3-RML', UUID(), 'KRTRN-3', '7', '41', 'N');

INSERT INTO KRIM_ROLE_RSP_T(ROLE_RSP_ID, OBJ_ID, ROLE_ID, RSP_ID, ACTV_IND)
    VALUES('KRTRN-3-KRATRN-APVR_ROLE', UUID(), 'KRATRN-APVR_ROLE', 'KRTRN-3', 'Y');

INSERT INTO KRIM_ROLE_RSP_ACTN_T(ROLE_RSP_ACTN_ID, OBJ_ID, ACTN_TYP_CD, PRIORITY_NBR, ACTN_PLCY_CD, ROLE_MBR_ID, ROLE_RSP_ID, FRC_ACTN)
    VALUES('KRTRN-3-KRATRN-APVR_ROLE', UUID(), 'A', NULL, 'F', '*', 'KRTRN-3-KRATRN-APVR_ROLE', 'N');

-- Builds role members related to training application

INSERT INTO KRIM_ROLE_MBR_T(ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD)
	VALUES('KRTRN-CAMPUS-1', 1, UUID(), 'KRATRN-APVR_ROLE', 'dev1', 'P');

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, VER_NBR, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
	VALUES('KRTRN-1-CAMPUS', UUID(), 1, 'KRTRN-CAMPUS-1', '17', '12', 'KO');


INSERT INTO KRIM_ROLE_MBR_T(ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD)
	VALUES('KRTRN-CAMPUS-2', 1, UUID(), 'KRATRN-APVR_ROLE', 'dev2', 'P');

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, VER_NBR, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
	VALUES('KRTRN-2-CAMPUS', UUID(), 1, 'KRTRN-CAMPUS-2', '17', '12', 'BL');


INSERT INTO KRIM_ROLE_MBR_T(ROLE_MBR_ID, VER_NBR, OBJ_ID, ROLE_ID, MBR_ID, MBR_TYP_CD)
	VALUES('KRTRN-CAMPUS-3', 1, UUID(), 'KRATRN-APVR_ROLE', 'idm1', 'P');

INSERT INTO KRIM_ROLE_MBR_ATTR_DATA_T(ATTR_DATA_ID, OBJ_ID, VER_NBR, ROLE_MBR_ID, KIM_TYP_ID, KIM_ATTR_DEFN_ID, ATTR_VAL)
	VALUES('KRTRN-3-CAMPUS', UUID(), 1, 'KRTRN-CAMPUS-3', '17', '12', 'BX');




