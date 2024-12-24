package com.scv.web.adm.service;

import com.scv.web.adm.domain.CommentVO;
import com.scv.web.adm.domain.ModifyVO;

import java.util.List;

public interface CommentService {
    public List<CommentVO> getAllComments();

    public List<ModifyVO> getComments();
    void restoreCommentsByReplyNo(List<Integer> replyNos);

    void updateCommentCategory(List<String> comments, String category);
}
