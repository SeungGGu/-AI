package com.scv.web.tutorial.service;

import com.scv.web.tutorial.domain.MessageVO;
import com.scv.web.tutorial.persistence.MessageDAO;
import com.scv.web.tutorial.persistence.PointDAO;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class MessageServiceImpl implements MessageService {

    private final MessageDAO messageDAO;

    private final PointDAO pointDAO;

    @Inject
    public MessageServiceImpl(MessageDAO messageDAO, PointDAO pointDAO) {
        this.messageDAO = messageDAO;
        this.pointDAO = pointDAO;
    }

    @Override
    public void addMessage(MessageVO messageVO) throws Exception {
        messageDAO.create(messageVO);
    }

    @Override
    public MessageVO readMessage(String userId, Integer messageNo) throws Exception {
        messageDAO.updateState(messageNo);
        pointDAO.updatePoint(userId, 5);
        return messageDAO.readMessage(messageNo);
    }
}
