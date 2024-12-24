package com.scv.web.user.service;

import com.scv.web.user.domain.LoginDTO;
import com.scv.web.user.domain.UserVO;
import com.scv.web.user.persistence.UserDAO;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    private final UserDAO userDAO;

    @Inject
    public UserServiceImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @Override
    public UserVO login(LoginDTO loginDTO) throws Exception {
        return userDAO.login(loginDTO);
    }

    @Override
    public void keepLogin(String userId, String sessionId, Date sessionLimit) throws Exception {
        userDAO.keepLogin(userId, sessionId, sessionLimit);
    }

    @Override
    public UserVO checkLoginBefore(String value) throws Exception {
        return userDAO.checkUserWithSessionKey(value);
    }

    @Override
    public void register(UserVO userVO) throws Exception {
        userDAO.register(userVO);
    }

    @Override
    public boolean isValidUserPw(String userId, String userPw) throws Exception {
        String hashedUserPw = userDAO.getUserPw(userId);

        return BCrypt.checkpw(userPw, hashedUserPw);
    }

    @Override
    public void userInfoModify(UserVO userVO) throws Exception {
        userDAO.userInfoUpdate(userVO);
    }

    @Override
    public void userPwModify(String userId, String newUserPw) throws Exception {
        userDAO.userPwUpdate(userId, newUserPw);
    }

    @Override
    public void userImgModify(String userId, String userImg) throws Exception {
        userDAO.userImgUpdate(userId, userImg);
    }

    @Override
    public boolean getPasswordByUserId(String userId, String userPw) {
        String encryptedPassword = userDAO.getPasswordByUserId(userId);
        return BCrypt.checkpw(userPw, encryptedPassword);
    }

    @Override
    public void deleteUser(String userId, String userPw) {
        userDAO.deleteUser(userId);
    }

    @Override
    public UserVO getUserByIdAndEmail(String userId, String userEmail) {
        return userDAO.getUserByIdAndEmail(userId, userEmail);
    }

    @Override
    public void updateUser(UserVO user) {
        userDAO.updateUser(user);
    }

    @Override
    public void resetUserPassword(String userId, String newPassword) {
        userDAO.resetUserPassword(userId, newPassword);
    }
}
