package cn.zjtx.report.base.util;

/**
 * @ClassName: Constant 
 * @Description: TODO(定义共享的常量) 
 * @author wubikang
 * @date 2017年4月11日 下午1:04:04 
 * @version V0.1 
 * 
 */
public class Constant {
	
	/**
     * 订单状态(TRvADE_NO_CREATE_PAY(没有创建支付宝交易)
 	 * WAIT_BUYER_PAY(等待买家付款) 
 	 * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)
 	 * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)
 	 * TRADE_BUYER_SIGNED(买家已签收,货到付款专用)
 	 * TRADE_FINISHED(交易成功) 
 	 * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) 
 	 * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)
 	 * PAY_PENDING(国际信用卡支付付款确认中))
     */
	/**没有创建支付宝交易*/
    public static final String TRADE_NO_CREATE_PAY = "TRADE_NO_CREATE_PAY";
    /**等待买家付款*/
    public static final String WAIT_BUYER_PAY = "WAIT_BUYER_PAY";
    /**等待卖家发货,即:买家已付款*/
    public static final String WAIT_SELLER_SEND_GOODS = "WAIT_SELLER_SEND_GOODS";
    /**等待买家确认收货,即:卖家已发货*/
    public static final String WAIT_BUYER_CONFIRM_GOODS = "WAIT_BUYER_CONFIRM_GOODS";
    /**买家已签收,货到付款专用*/
    public static final String TRADE_BUYER_SIGNED = "TRADE_BUYER_SIGNED";
    /**交易成功*/
    public static final String TRADE_FINISHED = "TRADE_FINISHED";
    /**付款以后用户退款成功，交易自动关闭*/
    public static final String TRADE_CLOSED = "TRADE_CLOSED";
    /**付款以前，卖家或买家主动关闭交易*/
    public static final String TRADE_CLOSED_BY_TAOBAO = "TRADE_CLOSED_BY_TAOBAO";
    /**国际信用卡支付付款确认中*/
    public static final String PAY_PENDING = "PAY_PENDING";
	
	//客户关怀
    /**订单催付*/
    public static final int ORDER_URGE = 1; 
    /**付款感谢*/
    public static final int PAYMENT_THANK = 2;
    /**发货提醒*/
    public static final int DELIVERY_REMINDER = 3;
    /**同城提醒*/
    public static final int CITY_REMINDER = 4; 
    /**派件提醒*/
    public static final int SEND_REMINDER = 5; 
    /**签收提醒*/
    public static final int SIGN_REMINDER = 6; 
    /**商品回购提醒*/
    public static final int PRODUCT_REPURCHASE_REMINDER = 7; 

}
