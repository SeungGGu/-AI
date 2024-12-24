package com.scv.web.reply.service;

import com.scv.web.commons.paging.Criteria;
import com.scv.web.reply.domain.ReplyVO;

import java.util.List;

public interface ReplyService {

    List<ReplyVO> getReplies(Integer articleNo) throws Exception;

    void addReply(ReplyVO replyVO) throws Exception;

    void modifyReply(ReplyVO replyVO) throws Exception;

    void removeReply(Integer replyNo) throws Exception;

    List<ReplyVO> getRepliesPaging(Integer articleNo, Criteria criteria) throws Exception;

    int countReplies(Integer articleNo) throws Exception;

}
