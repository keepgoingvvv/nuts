<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="css/insert.css">
<style>
body {
   background-image: url(images/hill1.png), url(images/hill2.png),
      url(images/hill3.png), url(images/hill4.png), url(images/hill5.png),
      url(images/hill6.png), url(images/hill7.png), url(images/hill8.png);
   background-repeat: no-repeat;
   background-size: cover;
}
</style>
</head>
<body>
   <div class="container">
      <h1>게시글 등록</h1>

      <form action="NutsServlet" method="post" name="frm">
         <input type="hidden" name="command" value="noti_write">

         <div class="input-group">
                <input type="text" required name="name">
                <label for="">작성자</label>
            </div>

         <div class="check-container">
            <div class="list1">
               <input type="checkbox" name="list" value="공지">공지
            </div>
            <div class="list2">
               <input type="checkbox" name="list" value="소식">소식
            </div>
         </div>

         <div class="input-group">
                <input type="text" required name="title">
                <label for="">제목</label>
            </div>

         <div class="contentbox">
            <textarea name="content" cols="90" rows="20" placeholder="내용"></textarea>
         </div>

         <br> <br>
         <input type="submit" value="등록" onclick="return boardCheck()">
         <input type="reset" value="다시 작성"> <input type="button"
            value="목록" onclick="location.href='NutsServlet?command=admin_page'">
      </form>
   </div>
</body>
</html>