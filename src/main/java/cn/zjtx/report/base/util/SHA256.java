package cn.zjtx.report.base.util;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 implements Serializable {

	
	 /**
	 * 
	 */
	private static final long serialVersionUID = -6388528591409889187L;
	/**
     * 对字符串加密,加密算法使用MD5,SHA-1,SHA-256,默认使用SHA-256
     * 
     * @param strSrc
     *            要加密的字符串
     * @param encName
     *            加密类型
     * @return
     */
    public static String encrypt(String strSrc) {
        MessageDigest md = null;
        String strDes = null;

        byte[] bt = strSrc.getBytes();
        try {
            md = MessageDigest.getInstance("SHA-256");
            md.update(bt);
            strDes = bytes2Hex(md.digest()); // to HexString
        } catch (NoSuchAlgorithmException e) {
        	
            return null;
        }
        return strDes;
    }
    
    public static String bytes2Hex(byte[] bts) {
        String des = "";
        String tmp = null;
        for (int i = 0; i < bts.length; i++) {
            tmp = (Integer.toHexString(bts[i] & 0xFF));
            if (tmp.length() == 1) {
                des += "0";
            }
            des += tmp;
        }
        return des;
    }
    
    public static boolean verify(String text, String sign){
    	String mySign = encrypt(text);
    	 if (mySign.equals(sign)) {
             return true;
         } else {
             return false;
         }
    }
    public static void main(String[] args) {
		System.out.println(encrypt("111111"));
	}
}
