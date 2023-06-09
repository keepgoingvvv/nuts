package adminAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import action.Action;
import dao.BoardDAO;
import dto.BoardVO;

public class BoardWriteAction implements Action {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        MultipartRequest multi = null;
        int sizeLimit = 10 * 1024 * 1024 ; 
        String savePath = request.getSession().getServletContext().getRealPath("/upload"); 

        try {
            multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

        } catch (Exception e) {
            e.printStackTrace();
        }

        BoardVO bVo = new BoardVO();
      
        bVo.setName(multi.getParameter("name"));
        bVo.setPass(multi.getParameter("pass"));
        bVo.setEmail(multi.getParameter("email"));
        bVo.setTitle(multi.getParameter("title"));
        bVo.setContent(multi.getParameter("content"));
        bVo.setImage(multi.getFilesystemName("image")); // 이미지 파일명을 설정

  
        BoardDAO bDao = BoardDAO.getInstance();
        bDao.insertBoard(bVo, multi);

        new BoardListAction().execute(request, response);
    }
}
