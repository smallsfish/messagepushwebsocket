package com.dingying.mpws.ws;

import org.springframework.web.socket.*;

public class PushWSHandler implements WebSocketHandler {

    //建立连接后处理
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        webSocketSession.sendMessage(new TextMessage("Server:connected ok!"));
    }

    //接收消息
    @Override
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
        TextMessage returnMessage = new TextMessage(webSocketMessage.getPayload()
                + " received at server");
        System.out.println(webSocketSession.getHandshakeHeaders().getFirst("Cookie"));
        webSocketSession.sendMessage(returnMessage);
    }

    //抛出异常
    @Override
    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {
        if(webSocketSession.isOpen()){
            webSocketSession.close();
        }
    }

//    连接关闭
    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {
    }

    @Override
    public boolean supportsPartialMessages() {
        return false;
    }
}
