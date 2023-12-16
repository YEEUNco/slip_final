package com.example;

import com.example.board.BoardService;
import com.example.board.BoardVO;
import com.example.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

@Controller
public class BoardController {
    @Autowired
    BoardService boardService;

    //BoardDAO boardDAO;
    @RequestMapping(value = "board/list", method = RequestMethod.GET)
    public String list(Model model) {
        model.addAttribute("list", boardService.getBoardList());
        return "list";
    }

    @RequestMapping(value = "board/add", method = RequestMethod.GET)
    public String addPost(){
        return "addpostform";
    }

    @RequestMapping(value = "board/addok", method = RequestMethod.POST)
    public String addPostOk(HttpServletRequest request, Model model) {
        try {
            BoardVO vo;
            FileUpload upload = new FileUpload();
            vo = upload.uploadPhoto(request);

            int i = boardService.insertBoard(vo);
            if (i == 0) {
                System.out.println("데이터 추가 성공!");
            } else {
                System.out.println("데이터 추가 실패.");
            }
        } catch (Exception e) {
            e.printStackTrace(); // 콘솔에 예외 출력
            model.addAttribute("errorlog", e.getMessage()); // 에러 메시지를 모델에 추가
            return "errorlog"; // 에러 페이지로 리디렉션
        }
        return "redirect:list";
    }

    @RequestMapping(value = "/board/editpost/{id}", method = RequestMethod.GET)
    public String editPost(@PathVariable("id") int id, Model model, ServletRequest request) {
        BoardVO boardVO = boardService.getBoard(id);
        if(request.getParameter("pw").equals(boardVO.getPw())){
            model.addAttribute("boardVO", boardVO);
            return "editpost";
        }
        return "redirect:../list";
    }

    @RequestMapping(value = "/board/editok", method = RequestMethod.POST)
    public String editPostOk(HttpServletRequest request) {
        // vo 로 못 받아온다
        BoardVO vo;
        FileUpload upload = new FileUpload();
        vo = upload.uploadPhoto(request);

        System.out.println("Will update image to :" + vo.getImage_url());
        //vo출력


        int i = boardService.updateBoard(vo);
        if(i == 0){
            System.out.println("BoardVO Data:");
            System.out.println("Seq: " + vo.getSeq());
            System.out.println("Product Name: " + vo.getProductName());
            System.out.println("Price: " + vo.getPrice());
            System.out.println("Description: " + vo.getDescription());
            System.out.println("PW: " + vo.getPw());
            System.out.println("Location: " + vo.getLocation());
            System.out.println("Seller ID: " + vo.getSeller_id());
            System.out.println("Image URL: " + vo.getImage_url());
            System.out.println("Condition: " + vo.getProd_condition());
            System.out.println("Nickname: " + vo.getNickname());
            System.out.println("Like Count: " + vo.getLikecount());
            System.out.println("데이터 수정 성공!");
        } else {
            System.out.println("데이터 수정 실패.");
        }
        return "redirect:list";
    }

    @RequestMapping(value = "/board/delete/{id}", method = RequestMethod.GET)
    public String deletePost(@PathVariable("id") int id, HttpServletRequest request) {
        BoardVO boardVO = boardService.getBoard(id);
        if(request.getParameter("pw").equals(boardVO.getPw())){
            String filename = boardService.getBoard(id).getImage_url();
            int i = boardService.deleteBoard(id);
            if(i == 0){
                FileUpload.deleteFile(request, filename);
                System.out.println("데이터 삭제 성공!");
            } else {

                System.out.println("데이터 삭제 실패.");
            }
        }
        return "redirect:../list";
    }

    @RequestMapping(value = "board/like", method = RequestMethod.GET)
    public String addLove(BoardVO vo, HttpServletRequest request, Model model) {
        int id = Integer.parseInt(request.getParameter("q"));
        int likecount = boardService.getBoard(id).getLikecount();

        vo.setLikecount(likecount+1);
        vo.setSeq(id);
        int i = boardService.updatelikecount(vo);

        model.addAttribute("count", likecount+1);

        if(i == 0){
            System.out.println("like 성공" + (likecount+1));
        } else {
            System.out.println("like 실패.");
        }
        return "likecount";
    }
}
