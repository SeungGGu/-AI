package com.scv.web.adm.service;

import com.scv.web.adm.domain.CommentVO;
import com.scv.web.adm.domain.ModifyVO;
import com.scv.web.adm.persistence.CommentDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDAO commentDAO;

    public List<CommentVO> getAllComments() {
        return commentDAO.selectAllComments();
    }

    public List<ModifyVO> getComments() {
        return commentDAO.selectComments();
    }

    @Override
    public void restoreCommentsByReplyNo(List<Integer> replyNos) {
        commentDAO.updateCommentCategoryByReplyNo(replyNos);
    }

    @Override
    @Transactional
    public void updateCommentCategory(List<String> comments, String category) {
        commentDAO.updateCommentCategory(comments, category);
        commentDAO.insertIntoTblModify(comments, category);
    }
}
