package cn.zjtx.report;

import java.io.Serializable;
import java.security.cert.Extension;

/**
 * <p>操作环境</p>
 * 操作环境是指客户端环境与服务器环境。用于日志或访问控制。
 */
public class WebEnvironment implements Serializable {
    private static final long serialVersionUID = -7606172336527767001L;

    /** 客户端IP */
    private String            clientIp;
    /** 客户端MAC */
    private String            clientMac;
    /** 客户端的唯一标识 */
    private String            clientId;
    /** 服务器IP */
    private String            serverIp;
    /** 服务器名称 */
    private String            serverName;
    /** 扩展信息 */
    private Extension         extension;

    public String getClientIp() {
        return clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public String getClientMac() {
        return clientMac;
    }

    public void setClientMac(String clientMac) {
        this.clientMac = clientMac;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getServerIp() {
        return serverIp;
    }

    public void setServerIp(String serverIp) {
        this.serverIp = serverIp;
    }

    public String getServerName() {
        return serverName;
    }

    public void setServerName(String serverName) {
        this.serverName = serverName;
    }

    public Extension getExtension() {
        return extension;
    }

    public void setExtension(Extension extension) {
        this.extension = extension;
    }

}
