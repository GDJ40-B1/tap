<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/host/roomOne?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">숙소</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/host/roomReservationList?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">예약</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/host/couponList?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">쿠폰</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="${pageContext.request.contextPath}/host/priceRoomList?roomId=${room.roomId }&detailAddressId=${room.detailAddressId }">가격</a>
        </li>
      </ul>
    </div>
  </div>
</nav>