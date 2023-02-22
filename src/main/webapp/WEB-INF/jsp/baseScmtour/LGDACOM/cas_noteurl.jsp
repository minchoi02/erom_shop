<%--
<%@ page contentType = "text/html;charset=utf-8" %>
--%>
<%@ page contentType="text/html;charset=EUC-KR" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="lgdacom.XPayClient.XPayClient"%>

<%
    //request.setCharacterEncoding("utf-8");

	/*
     * [���� �������ó��(DB) ������]
     *
     * 1) ������ ������ ���� hashdata�� ������ �ݵ�� �����ϼž� �մϴ�.
     *
     */

    String LGD_RESPCODE = "";           // �����ڵ�: 0000(����) �׿� ����
    String LGD_RESPMSG = "";            // ����޼���
    String LGD_MID = "";                // �������̵� 
    String LGD_OID = "";                // �ֹ���ȣ
    String LGD_AMOUNT = "";             // �ŷ��ݾ�
    String LGD_TID = "";                // LG���÷������� �ο��� �ŷ���ȣ
    String LGD_PAYTYPE = "";            // ���������ڵ�
    String LGD_PAYDATE = "";            // �ŷ��Ͻ�(�����Ͻ�/��ü�Ͻ�)
    String LGD_HASHDATA = "";           // �ؽ���
    String LGD_FINANCECODE = "";        // ��������ڵ�(�����ڵ�)
    String LGD_FINANCENAME = "";        // ��������̸�(�����̸�)
    String LGD_ESCROWYN = "";           // ����ũ�� ���뿩��
    String LGD_TIMESTAMP = "";          // Ÿ�ӽ�����
    String LGD_ACCOUNTNUM = "";         // ���¹�ȣ(�������Ա�) 
    String LGD_CASTAMOUNT = "";         // �Ա��Ѿ�(�������Ա�)
    String LGD_CASCAMOUNT = "";         // ���Աݾ�(�������Ա�)
    String LGD_CASFLAG = "";            // �������Ա� �÷���(�������Ա�) - 'R':�����Ҵ�, 'I':�Ա�, 'C':�Ա���� 
    String LGD_CASSEQNO = "";           // �Աݼ���(�������Ա�)
    String LGD_CASHRECEIPTNUM = "";     // ���ݿ����� ���ι�ȣ
    String LGD_CASHRECEIPTSELFYN = "";  // ���ݿ����������߱������� Y: �����߱��� ����, �׿� : ������
    String LGD_CASHRECEIPTKIND = "";    // ���ݿ����� ���� 0: �ҵ������ , 1: ����������
    String LGD_PAYER = "";    			// �ӱ��ڸ�
    
    /*
     * ��������
     */
    String LGD_BUYER = "";              // ������
    String LGD_PRODUCTINFO = "";        // ��ǰ��
    String LGD_BUYERID = "";            // ������ ID
    String LGD_BUYERADDRESS = "";       // ������ �ּ�
    String LGD_BUYERPHONE = "";         // ������ ��ȭ��ȣ
    String LGD_BUYEREMAIL = "";         // ������ �̸���
    String LGD_BUYERSSN = "";           // ������ �ֹι�ȣ
    String LGD_PRODUCTCODE = "";        // ��ǰ�ڵ�
    String LGD_RECEIVER = "";           // ������
    String LGD_RECEIVERPHONE = "";      // ������ ��ȭ��ȣ
    String LGD_DELIVERYINFO = "";       // �����

    LGD_RESPCODE            = request.getParameter("LGD_RESPCODE");
    LGD_RESPMSG             = request.getParameter("LGD_RESPMSG");
    LGD_MID                 = request.getParameter("LGD_MID");
    LGD_OID                 = request.getParameter("LGD_OID");
    LGD_AMOUNT              = request.getParameter("LGD_AMOUNT");
    LGD_TID                 = request.getParameter("LGD_TID");
    LGD_PAYTYPE             = request.getParameter("LGD_PAYTYPE");
    LGD_PAYDATE             = request.getParameter("LGD_PAYDATE");
    LGD_HASHDATA            = request.getParameter("LGD_HASHDATA");
    LGD_FINANCECODE         = request.getParameter("LGD_FINANCECODE");
    LGD_FINANCENAME         = request.getParameter("LGD_FINANCENAME");
    LGD_ESCROWYN            = request.getParameter("LGD_ESCROWYN");
    LGD_TIMESTAMP           = request.getParameter("LGD_TIMESTAMP");
    LGD_ACCOUNTNUM          = request.getParameter("LGD_ACCOUNTNUM");
    LGD_CASTAMOUNT          = request.getParameter("LGD_CASTAMOUNT");
    LGD_CASCAMOUNT          = request.getParameter("LGD_CASCAMOUNT");
    LGD_CASFLAG             = request.getParameter("LGD_CASFLAG");
    LGD_CASSEQNO            = request.getParameter("LGD_CASSEQNO");
    LGD_CASHRECEIPTNUM      = request.getParameter("LGD_CASHRECEIPTNUM");
    LGD_CASHRECEIPTSELFYN   = request.getParameter("LGD_CASHRECEIPTSELFYN");
    LGD_CASHRECEIPTKIND     = request.getParameter("LGD_CASHRECEIPTKIND");
    LGD_PAYER     			= request.getParameter("LGD_PAYER");

    LGD_BUYER               = request.getParameter("LGD_BUYER");
    LGD_PRODUCTINFO         = request.getParameter("LGD_PRODUCTINFO");
    LGD_BUYERID             = request.getParameter("LGD_BUYERID");
    LGD_BUYERADDRESS        = request.getParameter("LGD_BUYERADDRESS");
    LGD_BUYERPHONE          = request.getParameter("LGD_BUYERPHONE");
    LGD_BUYEREMAIL          = request.getParameter("LGD_BUYEREMAIL");
    LGD_BUYERSSN            = request.getParameter("LGD_BUYERSSN");
    LGD_PRODUCTCODE         = request.getParameter("LGD_PRODUCTCODE");
    LGD_RECEIVER            = request.getParameter("LGD_RECEIVER");
    LGD_RECEIVERPHONE       = request.getParameter("LGD_RECEIVERPHONE");
    LGD_DELIVERYINFO        = request.getParameter("LGD_DELIVERYINFO");
    
    String CST_PLATFORM         = "service";                 //LG���÷��� �������� ����(test:�׽�Ʈ, service:����)
    
    
    Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	
	//String jdbcUrl  = "jdbc:mysql://localhost:3306/scmtour?characterEncoding=utf8";
	String jdbcUrl  = "jdbc:mysql://182.162.27.99:3306/scmtour?characterEncoding=utf8";
	String dbId  = "scmtour";
	String dbPass = "scmtourtjcjsRmffla";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);

	String sqllog = "insert into base_lgd_log_tb (";
	sqllog += "regdt, CST_PLATFORM, LGD_RESPCODE, LGD_MID, LGD_OID, LGD_AMOUNT, LGD_TID,LGD_PAYTYPE,LGD_HASHDATA,LGD_FINANCECODE,LGD_FINANCENAME,";
	sqllog += "LGD_ESCROWYN,LGD_ACCOUNTNUM,LGD_CASTAMOUNT,LGD_CASCAMOUNT,LGD_CASFLAG,LGD_CASSEQNO,LGD_CASHRECEIPTNUM,LGD_CASHRECEIPTSELFYN,LGD_CASHRECEIPTKIND,";
	sqllog += "LGD_PAYER,LGD_BUYER,LGD_PRODUCTINFO,LGD_BUYERADDRESS, LGD_BUYERPHONE,LGD_BUYEREMAIL,LGD_BUYERSSN,LGD_PRODUCTCODE,LGD_RECEIVER,LGD_RECEIVERPHONE,LGD_DELIVERYINFO,LGD_TIMESTAMP";
	sqllog += " ) values ( ";
	sqllog += "now(), ?, ?, ?, ?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?,?,?,?,?,?,?,?";
	sqllog += ")";					
	pstmt = conn.prepareStatement(sqllog);
	pstmt.setString(1,CST_PLATFORM);
	pstmt.setString(2,LGD_RESPCODE);
	pstmt.setString(3,LGD_MID);
	pstmt.setString(4,LGD_OID);
	pstmt.setString(5,LGD_AMOUNT);
	pstmt.setString(6,LGD_TID);
	pstmt.setString(7,LGD_PAYTYPE);
	pstmt.setString(8,LGD_HASHDATA);
	pstmt.setString(9,LGD_FINANCECODE);
	pstmt.setString(10,LGD_FINANCENAME);
	
	pstmt.setString(11,LGD_ESCROWYN);
	pstmt.setString(12,LGD_ACCOUNTNUM);
	pstmt.setString(13,LGD_CASTAMOUNT);
	pstmt.setString(14,LGD_CASCAMOUNT);
	pstmt.setString(15,LGD_CASFLAG);
	pstmt.setString(16,LGD_CASSEQNO);
	pstmt.setString(17,LGD_CASHRECEIPTNUM);
	pstmt.setString(18,LGD_CASHRECEIPTSELFYN);
	pstmt.setString(19,LGD_CASHRECEIPTKIND);
	
	pstmt.setString(20,LGD_PAYER);
	pstmt.setString(21,LGD_BUYER);
	pstmt.setString(22,LGD_PRODUCTINFO);
	pstmt.setString(23,LGD_BUYERADDRESS);
	pstmt.setString(24,LGD_BUYERPHONE);
	pstmt.setString(25,LGD_BUYEREMAIL);
	pstmt.setString(26,LGD_BUYERSSN);
	pstmt.setString(27,LGD_PRODUCTCODE);
	pstmt.setString(28,LGD_RECEIVER);
	pstmt.setString(29,LGD_RECEIVERPHONE);
	pstmt.setString(30,LGD_DELIVERYINFO);
	pstmt.setString(31,LGD_TIMESTAMP);
	pstmt.executeUpdate();  
	
    String configPath = "c:/webapps/bin/payment";  //LG���÷������� ������ ȯ������("/conf/lgdacom.conf,/conf/mall.conf") ��ġ ����.
    //String configPath = "/webapps/bin/payment";  //LG���÷������� ������ ȯ������("/conf/lgdacom.conf,/conf/mall.conf") ��ġ ����.
    
    /*
     * hashdata ������ ���� mertkey�� ���������� -> ������� -> ���������������� Ȯ���ϽǼ� �ֽ��ϴ�. 
     * LG���÷������� �߱��� ����Ű�� �ݵ�ú����� �ֽñ� �ٶ��ϴ�.
     */  
     String LGD_HASHDATA2 = "";
     XPayClient xpay = null;
     try {
    	 
    	 xpay = new XPayClient();
    	 xpay.Init(configPath, CST_PLATFORM);
    	     	 
    	 LGD_HASHDATA2 = xpay.GetHashDataCas(LGD_MID, LGD_OID, LGD_AMOUNT, LGD_RESPCODE, LGD_TIMESTAMP);
    	 //out.println(LGD_HASHDATA2); 
    	 
     } catch(Exception e) {
    	 e.printStackTrace();
    	out.println("LG���÷��� ���� API�� ����� �� �����ϴ�. ȯ������ ������ Ȯ���� �ֽñ� �ٶ��ϴ�. ");
 		out.println(""+e.getMessage());    	
 		return;
     } finally {
    	 xpay = null;
     }
    
    /*
     * ���� ó����� ���ϸ޼���
     *
     * OK  : ���� ó����� ����
     * �׿� : ���� ó����� ����
     *
     * �� ���ǻ��� : ������ 'OK' �����̿��� �ٸ����ڿ��� ���ԵǸ� ����ó�� �ǿ��� �����Ͻñ� �ٶ��ϴ�.
     */    
    String resultMSG = "������� ���� DBó��(LGD_CASNOTEURL) ������� �Է��� �ֽñ� �ٶ��ϴ�.";  
     
    if (LGD_HASHDATA2.trim().equals(LGD_HASHDATA)) { //�ؽ��� ������ �����̸�
        if ( ("0000".equals(LGD_RESPCODE.trim())) ){ //������ �����̸�
    
			if( "R".equals( LGD_CASFLAG.trim() ) ) {

				/*
        		System.out.println(" ::: LGD_OID ::: " + LGD_OID.trim());
				System.out.println(" ::: LGD_AMOUNT ::: " + LGD_AMOUNT.trim());
				System.out.println(" ::: LGD_RECEIVER ::: " + LGD_RECEIVER.trim());
				System.out.println(" ::: LGD_BUYERPHONE ::: " + LGD_BUYERPHONE.trim());
				System.out.println(" ::: LGD_DELIVERYINFO ::: " + LGD_DELIVERYINFO.trim());
				System.out.println(" ::: LGD_BUYERADDRESS ::: " + LGD_BUYERADDRESS.trim());
				System.out.println(" ::: LGD_PAYTYPE ::: " + LGD_PAYTYPE.trim());
				System.out.println(" ::: LGD_TID ::: " + LGD_TID.trim());
				System.out.println(" ::: LGD_RECEIVERPHONE ::: " + LGD_RECEIVERPHONE.trim());
				System.out.println(" ::: LGD_FINANCECODE ::: " + LGD_FINANCECODE.trim());
				System.out.println(" ::: LGD_FINANCENAME ::: " + LGD_FINANCENAME.trim());
				System.out.println(" ::: LGD_ACCOUNTNUM ::: " + LGD_ACCOUNTNUM.trim());
				System.out.println(" ::: LGD_PAYER ::: " + LGD_PAYER.trim());
				System.out.println(" ::: LGD_CASFLAG ::: " + LGD_CASFLAG.trim());
				*/
                /*
                 * ������ �Ҵ� ���� ��� ���� ó��(DB) �κ�
                 * ���� ��� ó���� �����̸� "OK"
                 */    

				//String sql = "update base_order_tb set ORDER_PAY_VBANK_CD = ?, ORDER_PAY_VBANK_NM = ?, ORDER_PAY_VBANK_NUMBER = ?, ORDER_PAY_VBANK_USER = ?, ORDER_PAY_STAT = ? where ORDER_ID = ? ";
				String sql1 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt1 = conn.prepareStatement(sql1);
				pstmt1.setString(1,LGD_OID);
				pstmt1.setString(2,LGD_FINANCECODE);
				pstmt1.setString(3,LGD_FINANCENAME);
				pstmt1.setString(4,LGD_ACCOUNTNUM);
				pstmt1.setString(5,LGD_PAYER);
				pstmt1.setString(6,LGD_CASFLAG);
				pstmt1.executeUpdate();  

				/*
				String sql2 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1,LGD_OID);
				pstmt2.setString(2,LGD_FINANCECODE);
				pstmt2.setString(3,LGD_FINANCENAME);
				pstmt2.setString(4,LGD_ACCOUNTNUM);
				pstmt2.setString(5,LGD_PAYER);
				pstmt2.setString(6,LGD_CASFLAG);
				pstmt2.executeUpdate();  
				*/
				
				resultMSG = "OK";

                //if( ������ �Ҵ� ���� ����ó����� ���� ) 
                //resultMSG = "OK";
    			
        	}else if( "I".equals( LGD_CASFLAG.trim() ) ) {
 	            /*
    	         * ������ �Ա� ���� ��� ���� ó��(DB) �κ�
        	     * ���� ��� ó���� �����̸� "OK"
            	 */    
				
				String sql21 = "update base_order_tb set ORDER_ST = 'PAYMENT', ORDER_PAY_STAT = ? where ORDER_ID = ? ";
				pstmt = conn.prepareStatement(sql21);
				pstmt.setString(1,LGD_CASFLAG);
				pstmt.setString(2,LGD_OID);
				pstmt.executeUpdate();  


				String sql22 = "update base_order_prod_detail_tb set OD_ORDER_STAT = 'PAYMENT' where OD_ORDER_ID = ? ";
				pstmt2 = conn.prepareStatement(sql22);
				pstmt2.setString(1,LGD_OID);
				pstmt2.executeUpdate();  
				
				String sql23 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt3 = conn.prepareStatement(sql23);
				pstmt3.setString(1,LGD_OID);
				pstmt3.setString(2,LGD_FINANCECODE);
				pstmt3.setString(3,LGD_FINANCENAME);
				pstmt3.setString(4,LGD_ACCOUNTNUM);
				pstmt3.setString(5,LGD_PAYER);
				pstmt3.setString(6,LGD_CASFLAG);
				pstmt3.executeUpdate();  
				
				resultMSG = "OK";
					
        	}else if( "C".equals( LGD_CASFLAG.trim() ) ) {
 	            /*
    	         * ������ �Ա���� ���� ��� ���� ó��(DB) �κ�
        	     * ���� ��� ó���� �����̸� "OK"
            	 */    
            	//if( ������ �Ա���� ���� ����ó����� ���� ) 
            	//resultMSG = "OK";
				
				String sql31 = "update base_order_tb set ORDER_ST = 'CANCEL', ORDER_PAY_STAT = ? where ORDER_ID = ? ";
				pstmt = conn.prepareStatement(sql31);
				pstmt.setString(1,LGD_CASFLAG);
				pstmt.setString(2,LGD_OID);
				pstmt.executeUpdate();  
				

				String sql32 = "update base_order_prod_detail_tb set OD_ORDER_STAT = 'CANCEL' where OD_ORDER_ID = ? ";
				pstmt2 = conn.prepareStatement(sql32);
				pstmt2.setString(1,LGD_OID);
				pstmt2.executeUpdate();  
				
				String sql33 = "insert into base_order_virtual_tb (ORDER_ID, BANK_CD, BANK_NM, BANK_NUM, BANK_USER, BANK_PAY_STAT) values (?,?,?,?,?,?) ";
				pstmt3 = conn.prepareStatement(sql33);
				pstmt3.setString(1,LGD_OID);
				pstmt3.setString(2,LGD_FINANCECODE);
				pstmt3.setString(3,LGD_FINANCENAME);
				pstmt3.setString(4,LGD_ACCOUNTNUM);
				pstmt3.setString(5,LGD_PAYER);
				pstmt3.setString(6,LGD_CASFLAG);
				pstmt3.executeUpdate();  
				
				resultMSG = "OK";
					
				//if( ������ �Ա� ���� ����ó����� ���� ) 
            	//resultMSG = "OK";


        	}
        	
			conn.close();

        } else { //������ �����̸�
            /*
             * �ŷ����� ��� ���� ó��(DB) �κ�
             * ������� ó���� �����̸� "OK"
             */  
           //if( �������� ����ó����� ���� ) 
        	   resultMSG = "OK";     
        }
    } else { //�ؽ����� ������ �����̸�
        /*
         * hashdata���� ���� �α׸� ó���Ͻñ� �ٶ��ϴ�. 
         */      
        resultMSG = "������� ���� DBó��(LGD_CASNOTEURL) �ؽ��� ������ �����Ͽ����ϴ�.";     
    }
    
    out.println(resultMSG.toString());    
%>
 
