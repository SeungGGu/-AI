package com.scv.web.adm.persistence;

import com.scv.web.adm.domain.CommentVO;
import com.scv.web.adm.domain.ModifyVO;

import java.util.List;

public interface CommentDAO {
    public List<CommentVO> selectAllComments();

    public List<ModifyVO> selectComments();

    void updateCommentCategoryByReplyNo(List<Integer> replyNos);

     void updateCommentCategory(List<String> comments, String category);

     void insertIntoTblModify(List<String> comments, String category);
}
