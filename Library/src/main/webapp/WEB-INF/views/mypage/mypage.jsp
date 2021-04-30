<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
  <link rel="stylesheet" href="../css/admin_account.css">
  
<style type="text/css">
h1, h4 {text-align: center;}
table {height: 35px;text-align: center;}
tr, td {height: 40px;}
</style>
</head>

<body>
  <header>
    <div id="header-left">
      LMS <span>ENTERPRISE</span> Type
    </div>
    <div id="header-right">
      <span>관리자 (GMT+9:00) Seoul</span>
      <img src="http://lmsenterprise2019.itmap.co.kr/_admin/image/logout.png" alt="">

      <table>
        <tr>
          <td class="select">
            <img src="http://lmsenterprise2019.itmap.co.kr/_admin/image/KOR.png" alt="">
            <span>한국어</span>
          </td>
          <td class="arrow">
            <div class="separator"></div>
            <span>▼</span>
          </td>
        </tr>
      </table>

      <table>
        <tr>
          <td class="select">
            <span>LMS 매뉴얼</span>
          </td>
          <td class="arrow">
            <div class="separator"></div>
            <span>▼</span>
          </td>
        </tr>
      </table>
    </div>
  </header>

  <nav>
    <ul>
      <li><span class="nav1">&emsp;</span> 회원관리</li>
      <li><span class="nav2">&emsp;</span> 상품관리</li>
      <li><span class="nav3">&emsp;</span> 공지사항</li>
      <li><span class="nav4">&emsp;</span> 이벤트</li>
    </ul>
  </nav>
  
  <br>
  <br>
  <br>
  <br>
  <h1><a href="/mypage/myRoomBookig"><span>나의 스터디룸 예약현황</span></a></h1>

</body>
</html>