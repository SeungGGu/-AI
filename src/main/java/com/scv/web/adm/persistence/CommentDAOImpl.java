package com.scv.web.adm.persistence;

import com.scv.web.adm.domain.CommentVO;
import com.scv.web.adm.domain.ModifyVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CommentDAOImpl implements CommentDAO {
    @Autowired
    private SqlSession sqlSession;

    public List<CommentVO> selectAllComments() {
        return sqlSession.selectList("com.scv.web.mappers.adm.CommentMapper.selectAllComments");
    }

    public List<ModifyVO> selectComments() {
        return sqlSession.selectList("com.scv.web.mappers.adm.CommentMapper.selectComments");
    }

    @Override
    public void updateCommentCategoryByReplyNo(List<Integer> replyNos) {
        sqlSession.update("com.scv.web.mappers.adm.CommentMapper.updateCommentCategoryByReplyNo", replyNos);
    }

    @Override
    public void updateCommentCategory(List<String> comments, String category) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("comments", comments);
        paramMap.put("category", category);

        sqlSession.update("com.scv.web.mappers.adm.CommentMapper.updateCommentCategory", paramMap);
    }

    @Override
    public void insertIntoTblModify(List<String> comments, String category) {
        Map<String, Object> params = new HashMap<>();
        params.put("comments", comments);
        params.put("category", category);
        sqlSession.update("com.scv.web.mappers.adm.CommentMapper.insertIntoTblModify", params);
    }
}
