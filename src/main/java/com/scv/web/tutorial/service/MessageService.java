package com.scv.web.tutorial.service;

import com.scv.web.tutorial.domain.MessageVO;

public interface MessageService {

    void addMessage(MessageVO messageVO) throws Exception;

    MessageVO readMessage(String userId, Integer messageNo) throws Exception;

}
