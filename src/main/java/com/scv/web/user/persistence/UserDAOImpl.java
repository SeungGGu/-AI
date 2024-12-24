package com.scv.web.user.persistence;

import com.scv.web.user.domain.LoginDTO;
import com.scv.web.user.domain.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import javax.inject.Inject;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDAOImpl implements UserDAO {

    private static final String NAMESPACE = "com.scv.web.mappers.user.UserMapper";

    private final SqlSession sqlSession;

    @Inject
    public UserDAOImpl(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 로그인 처리
    @Override
    public UserVO login(LoginDTO loginDTO) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".login", loginDTO);
    }

    // 로그인 유지 처리
    @Override
    public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("sessionId", sessionId);
        paramMap.put("sessionLimit", sessionLimit);

        sqlSession.update(NAMESPACE + ".keepLogin", paramMap);
    }

    // 세션키 검증
    @Override
    public UserVO checkUserWithSessionKey(String value) throws Exception {
        return sqlSession.selectOne(NAMESPACE + ".checkUserWithSessionKey", value);
    }

    @Override
    public void register(UserVO userVO) throws Exception {
        sqlSession.insert(NAMESPACE + ".register", userVO);
    }

    @Override
    public String getUserPw(String userId) throws Exception {

        return sqlSession.selectOne(NAMESPACE + ".getUserPw", userId);
    }

    @Override
    public void userInfoUpdate(UserVO userVO) throws Exception {
        sqlSession.update(NAMESPACE + ".userInfoUpdate", userVO);
    }

    @Override
    public void userPwUpdate(String userId, String newUserPw) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("newUserPw", newUserPw);
        sqlSession.update(NAMESPACE + ".userPwUpdate", paramMap);
    }

    @Override
    public void userImgUpdate(String userId, String userImg) throws Exception {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("userId", userId);
        paramMap.put("userImg", userImg);
        sqlSession.update(NAMESPACE + ".userImgUpdate", paramMap);
    }

    @Override
    public String getPasswordByUserId(String userId) {
        return sqlSession.selectOne(NAMESPACE + ".getPasswordByUserId", userId);
    }

    @Override
    public void deleteUser(String userId) {
        sqlSession.delete(NAMESPACE + ".deleteUser", userId);
    }

    @Override
    public UserVO getUserByIdAndEmail(String userId, String userEmail) {
        Map<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("userEmail", userEmail);
        return sqlSession.selectOne("com.scv.web.mappers.user.UserMapper.getUserByIdAndEmail", params);
    }

    @Override
    public void updateUser(UserVO user) {
        sqlSession.update("com.scv.web.mappers.user.UserMapper.updateUser", user);
    }

    @Override
    public void resetUserPassword(String userId, String newPassword) {
        Map<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("newPassword", newPassword);
        sqlSession.update(NAMESPACE + "resetUserPassword", params);
    }
}
