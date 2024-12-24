package com.scv.web.user.controller;

import com.scv.web.user.domain.LoginDTO;
import com.scv.web.user.domain.UserVO;
import com.scv.web.user.service.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/user")
public class UserLoginController {

    private final UserService userService;

    @Inject
    public UserLoginController(UserService userService) {
        this.userService = userService;
    }

    // 로그인 페이지
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
        return "/user/login";
    }

    // 로그인 처리
    @RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public void loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception {

        UserVO userVO = userService.login(loginDTO);

        if (userVO == null || !BCrypt.checkpw(loginDTO.getUserPw(), userVO.getUserPw())) {
            return;
        }

        model.addAttribute("user", userVO);

        if (loginDTO.isUseCookie()) {
            int amount = 60 * 60 * 24 * 7;
            Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
            userService.keepLogin(userVO.getUserId(), httpSession.getId(), sessionLimit);
        }

    }

    // 로그아웃 처리
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        if (object != null) {
            UserVO userVO = (UserVO) object;
            httpSession.removeAttribute("login");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                userService.keepLogin(userVO.getUserId(), "none", new Date());
            }
        }

        return "/user/logout";
    }

    // 로그아웃 처리
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession httpSession) throws Exception {

        Object object = httpSession.getAttribute("login");
        if (object != null) {
            UserVO userVO = (UserVO) object;
            httpSession.removeAttribute("login");
            httpSession.invalidate();
            Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
            if (loginCookie != null) {
                loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                userService.keepLogin(userVO.getUserId(), "none", new Date());
            }
        }

        return "/user/delete";
    }

    @RequestMapping(value = "/findPassword", method = RequestMethod.GET)
    public String findPasswordGET() {
        return "/user/findPassword";
    }

    // 비밀번호 찾기 처리
    @RequestMapping(value = "/findPassword", method = RequestMethod.POST)
    public String findPassword(@RequestParam("userId") String userId,
                               @RequestParam("userEmail") String userEmail,
                               Model model) {
        UserVO userVO = userService.getUserByIdAndEmail(userId, userEmail);

        if (userVO != null) {
            // Reset the password to '0000' (for demonstration purposes)
            userVO.setUserPw("0000");
            userService.updateUser(userVO); // Update user with new password
            model.addAttribute("msg", "비밀번호를 0000으로 초기화 했습니다. 해당 비밀번호로 로그인 후 변경해주세요");
            return "redirect:/user/login"; // Redirect to login page
        } else {
            model.addAttribute("msg", "비밀번호를 찾을 수 없습니다. 아이디와 비밀번호를 다시 확인해주세요");
            return "redirect:/user/findPassword"; // Redirect back to password recovery page with error message
        }
    }
}
