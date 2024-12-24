package com.scv.web.adm.controller;

import com.scv.web.adm.domain.AdmVO;
import com.scv.web.adm.domain.CommentVO;
import com.scv.web.adm.domain.ModifyVO;
import com.scv.web.adm.service.AdmService;
import com.scv.web.adm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/adm")
public class AdmController {

    @Autowired
    private CommentService commentService;
    private final AdmService admService;

    @Inject
    public AdmController(AdmService admService) {
        this.admService = admService;
    }


    //admin로그인 페이지
    @GetMapping("/login")
    public String loginForm() {
        return "adm/login";
    }

    @GetMapping("/Modify")
    public String Modify(Model model) throws  Exception{
        List<ModifyVO> comments = commentService.getComments();
        model.addAttribute("modifiedComments", comments);
        return "adm/Modify";
    }

    //홈페이지로 넘어가게 일단 구현함
    //추후 회원쪽 게시판으로 변경 예정
    @GetMapping("/list")
    public String list(Model model) throws Exception {
        List<CommentVO> comments = commentService.getAllComments();
        model.addAttribute("comments", comments);
        return "adm/list";
    }

    @RequestMapping(value = "/login_action", method = RequestMethod.POST)
    public String loginSubmit(AdmVO admVO, HttpSession httpSession, Model model) throws Exception {

        try {
            // AdmService를 통해 로그인 처리
            AdmVO loggedInUser = admService.login(admVO);

            // 로그인 성공 시
            if (loggedInUser != null) {
                // 세션에 로그인 정보 저장
                httpSession.setAttribute("loggedInUser", loggedInUser);

                // 로그인 후 이동할 페이지 반환 (예: 다음 화면 또는 메인 페이지)
                return "redirect:/adm/list";
            } else {
                // 로그인 실패 시 메시지 설정
                model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
            }
        } catch (Exception e) {
            // 예외 발생 시 예외 처리
            e.printStackTrace();
            // 예외 메시지 설정
            model.addAttribute("msg", "로그인 중 오류가 발생했습니다.");
        }
        // 로그인 실패 시 다시 로그인 페이지로 반환
        return "adm/login";
    }

    //댓글 복원
    @RequestMapping("/restoreComments")
    public ResponseEntity<?> restoreCommentsByReplyNo(@RequestBody List<Integer> replyNos) {
        commentService.restoreCommentsByReplyNo(replyNos);
        return ResponseEntity.ok().build();
    }

    @PostMapping("/updateCommentCategory")
    public ResponseEntity<String> updateCommentCategory(@RequestBody Map<String, Object> payload) {
        List<String> comments = (List<String>) payload.get("comments");
        String category = (String) payload.get("category");

        try {
            commentService.updateCommentCategory(comments, category);
            return ResponseEntity.ok("Success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to update category");
        }
    }
}
