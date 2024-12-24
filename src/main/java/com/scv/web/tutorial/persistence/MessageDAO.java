package com.scv.web.tutorial.persistence;

import com.scv.web.tutorial.domain.MessageVO;

public interface MessageDAO {

    void create(MessageVO messageVO) throws Exception;

    MessageVO readMessage(Integer messageNo) throws Exception;

    void updateState(Integer messageNo) throws Exception;

}
