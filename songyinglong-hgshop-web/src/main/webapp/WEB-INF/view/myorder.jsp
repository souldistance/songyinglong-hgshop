<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath}/"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>我的订单</title>
		<jsp:include page="/WEB-INF/view/common.jsp"></jsp:include>
		<script>
            function limit(pageNum) {
                if(pageNum==0){
                    return;
                }
                $('#pageNum2').val(pageNum);
                $('#orderForm').submit();
            }
		</script>
	</head>

	<body>
		<div class="container-fluid">
		<jsp:include page="header.jsp"></jsp:include>
		
		<div class="container-fluid" style="margin:5px 15px">
			<div class="row">
				<div class="col-md-12">
					<h5>我的订单</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-9 col-md-3">
					<form action="/order/myorder" method="post" id="orderForm">
						<input type="hidden" name="pageNum" id="pageNum2">
						<div style="margin:5px">
							<input id="search" type="text"  name="keyword" width="100%" class="form-control" placeholder="Search" value="${keyword1}">
							<button class="search-btn" type="submit" style="right: 5px;top: 5px"></button>
						</div>
					</form>
				</div>
			</div>
			<div class="row order_list_header">
				<div class="col-md-2">近三个月订单</div>
				<div class="col-md-4">订单详情</div>
				<div class="col-md-1">收货人</div>
				<div class="col-md-2">金额</div>
				<div class="col-md-2">全部状态</div>
				<div class="col-md-1">操作</div>
			</div>
			<%-- <c:forEach items="${map.items}" var="order"> --%>
			<c:forEach items="${pageInfo.list }" var="order">
			<div class="row order_list_body">
				<div class="order_list">
					<div class="col-md-2">
						<fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH-mm-ss"/>
					</div>
					<div class="col-md-2">订单号： ${order.orderId}</div>	
				</div>
				<c:forEach items="${order.orderDetails}" var="orderDetail">
				<div class="order_detail_list">
					<div class="col-md-6 order_detail">
						<div class="col-md-8" style="padding-left:0px">
							<div><img src="pic/${orderDetail.image}" width="50px" height="50px" style="float:left"/></div>
							<div class="p-name">${orderDetail.title}</div>
						</div>
						<div class="col-md-2"><span class="price">X${orderDetail.num}</span></div>
						<div class="col-md-2"><span class="price">卖了换钱</span></div>
					</div>
					<div class="col-md-1 order_detail">
						<div class="p-name">xxx</div>
					</div>
					<div class="col-md-2 order_detail">
						<div class="p-name">总额 ¥${orderDetail.price}</div>
					</div>
					<div class="col-md-2 order_detail">
						<div class="p-name">
							<span>已取消</span>
							<br/>
							<a>订单详情</a>
						</div>
					</div>
					<div class="col-md-1 order_detail">
						<div class="p-name"><a>立即购买</a></div>
					</div>
				</div>
				</c:forEach>
			</div>
			</c:forEach>

			<div>
				<nav aria-label="Page navigation example" style="float: right">
					<ul class="pagination">
						<li class="page-item"><a class="page-link"
												 aria-label="Previous" onclick="limit(${pageInfo.prePage })"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach items="${pageInfo.navigatepageNums }" var="n" varStatus="i">
							<li class="page-item ${n==pageInfo.pageNum?"active":"" }"><a class="page-link"
																						 onclick="limit(${n })">${n }</a></li>
						</c:forEach>
						<li class="page-item"><a class="page-link"
												 aria-label="Next" onclick="limit(${pageInfo.nextPage })"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>

	<jsp:include page="footer.jsp"/>
	</div>
	</body>

</html>