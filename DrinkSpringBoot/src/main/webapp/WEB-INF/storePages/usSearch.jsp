<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>店家搜尋</title>
<!--bootstrape匯入-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!--自己的CSS-->
<link rel="stylesheet" href="store/css/index.css">
<!--照片的CSS-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.css" />

<style type="text/css">

</style>

<%@ include file="/WEB-INF/websiteForm/homeWebsiteHead.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/websiteForm/homeWebsiteBody1.jsp"%>


	<!-- 內文開始 -->
	<div class="usercontainer">

	<div class="myusermenu" style="background:url(store/back3.png);background-size:cover;">
		
		   <div class="myleftmenu">
			<div class="mymap">
				<c:if test="${cityName == null}">
				<h5 style="font-weight:bold">1.請選擇所在地區</h5>
				</c:if>
				
				<c:if test="${cityName != null}">
				<h5 style="font-weight:bold">1.所在地區：${cityName}</h5>
				</c:if>
				
				<div>
				<form id="cityInputForm" action="searchByCity.controller" method="post">
					<input id="cityInput"  name="cityInput" class="form-control"  style="width:300px; margin-left:15%;float:left;" list="datalistOptions"  autocomplete="off" placeholder="可使用下拉式選單選擇所在地">
						<datalist id="datalistOptions">
							<option value="台北市">
							<option value="台中市">
							<option value="高雄市">
						</datalist>
				</form>
				<input id="cityInputBtn"  onclick="cityInput()" class="imbtn usSeabtn" style="" type="image" src="store/01search.png">
					</div>
				</div>
			</div>
			
			
		<div class="myrightmenu">
			
			<div class="mysearch">
				<h5 style="font-weight:bold">2.請輸入要查詢的關鍵字?</h5>
				<div style="width:100%;margin:0 auto;">
						
					<form id="FoodSearch" action="searchByFood.controller" method="post">
						<input id="foodSearch" class="form-control" name="foodName" style="width:42%;float:left;margin-left:10%" list="drinksOption" autocomplete="off" placeholder="想喝點什麼呢?">
							<datalist id="drinksOption">
								<option value="紅茶">
								<option value="咖啡">
							</datalist>
						<input onclick="foodSearch()"  class="imbtn usSeabtn" style="" type="image" src="store/01search.png">
						</form>
					
					</div>
					<div style="margin:10px 0">
<!-- 						<button type="button" class="btn btn-outline-success usbtn">找熱門</button> -->
						<button type="button" class="btn btn-outline-primary usbtn" onclick="disAct()">找優惠</button>
						<button type="button" class="btn btn-outline-primary usbtn" onclick="brand()">找品牌</button>
						<button type="button" class="btn btn-outline-primary usbtn" onclick="fresh()">找新鮮</button>
<!-- 					<button type="button" class="btn btn-outline-warning usbtn">找附近</button> -->
					</div>
				
				<!-- 尋找分類用 -->
				<div style="margin:10px 0">
					<button type="button" class="btn btn-light usbtn" onclick="shIce()">#冰沙</button>
					<button type="button" class="btn btn-light usbtn" onclick="shCof()">#咖啡</button>
					<button type="button" class="btn btn-light usbtn" onclick="shFlut()">#鮮果茶</button>
				</div>
					
				</div>
				
			</div>

		</div>

		<!-- 內文開始 -->
		<div class="myF">
		<!-- 店家顯示 -->
<div class="album py-5">
	<c:if test="${cityName == null}">
		<h3 class="RowTitle">搜尋結果：尚未指定地區 共 ${msgCon} 間店家</h3>
	</c:if>
	
	<c:if test="${cityName != null}">
		<h3 class="RowTitle">搜尋結果：${cityName} 共 ${msgCon} 間店家</h3>
	</c:if>
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" >
       
       <c:forEach items="${searchResult}" var="store">
        <div class="col" style="width:260px;height:300px;margin:10px 30px;">
          <div class="card shadow-sm">
          
          <c:if test="${empty fn:trim(store.photo)}">
			<img onclick="alStore(${store.storeid})" class="bd-placeholder-img card-img-top myStoreIMG" width="100%" height="225" src="store/NoItem.jpg">
          </c:if>
          
          <c:if test="${store.photo != null}">
			<img onclick="alStore(${store.storeid})" class="bd-placeholder-img card-img-top myStoreIMG" width="100%" height="225" src="<%=request.getContextPath()%>/StoreIMG/${store.storeid}">
          </c:if>
          
          <!-- 隱藏：搜尋店家用 -->
			<form id="alStore${store.storeid}" action="userStore.controller" method="post">
					<input type="hidden" name="imbtn" value="${store.storeid}">
			</form>
			
            <div class="card-body">
              <p class="card-text" style="text-align:center;font-weight:bold;">${store.title}</p>
              <div class="d-flex justify-content-between align-items-center">
              <!-- **優惠內容文字** -->
					<c:forEach items="${AllActItems}" var="acItem">
								
					<c:set var="s" value="${store.storeid}" scope="request"/>
 	 				<c:set var="a" value="${acItem.pstoreid}" scope="request"/>
						<c:if test="${s == a}">
 							<small class="text-muted">限時優惠：${acItem.activityTopic}</small> 
 						</c:if>
 					</c:forEach>
                <div class="btn-group">
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
          </div>
        </div>
      </div>
	</div>

</div>



	<!-- 引入Ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!--bootstrap匯入-->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous">
	</script>
	
	<!--引用jQuery-->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript"	src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

	<%@ include file="/WEB-INF/websiteForm/homeWebsiteBody2.jsp"%>
	<!--引用slick-->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	
	
	
	
	
	
	
	<script>
	
	<!--點擊-->
	function acStore(id){
		document.getElementById("acStore"+id).submit();
	}
	function hotStore(id){
		document.getElementById("hotStore"+id).submit();
	}
	function baStore(id){
		document.getElementById("baStore"+id).submit();
	}
	function newStore(id){
		document.getElementById("newStore"+id).submit();
	}
	function alStore(id){
		document.getElementById("alStore"+id).submit();
	}
	
	function cityInput(){
		document.getElementById("cityInputForm").submit();
	}
	
	function foodSearch(){
		document.getElementById("FoodSearch").submit();
	}
	
	
	function shIce(){
		document.getElementById("foodSearch").setAttribute("value", "#冰沙");
		document.getElementById("FoodSearch").submit();
	}		
	
	function shCof(){
		document.getElementById("foodSearch").setAttribute("value", "#咖啡");
		document.getElementById("FoodSearch").submit();
	}		
	
	function shFlut(){
		document.getElementById("foodSearch").setAttribute("value", "#鮮果茶");
		document.getElementById("FoodSearch").submit();
	}		
	
	function disAct(){
		document.getElementById("foodSearch").setAttribute("value", "找優惠");
		document.getElementById("FoodSearch").submit();
	}
	
	
	function fresh(){
		document.getElementById("foodSearch").setAttribute("value", "找新鮮");
		document.getElementById("FoodSearch").submit();
	}
	
	function brand(){
		document.getElementById("foodSearch").setAttribute("value", "找品牌");
		document.getElementById("FoodSearch").submit();
	}
		
		
		
		
	
	</script>
	
	
	
	
	
	
	
	
	<!-- 滑入滑出效果 -->
<!--<script type="text/javascript">
	$(function () {
	$( ".myLarrows" ).mouseover(function() {
		 $(this).attr("src","store/01arrow.png");
		});
	$( ".myLarrows" ).mouseout(function() {
		$(this).attr("src","store/arrow.png");
		});
	$( ".myarrows" ).mouseover(function() {
		 $(this).attr("src","store/01arrow.png");
		});
	$( ".myarrows" ).mouseout(function() {
		 $(this).attr("src","store/arrow.png");
		});
	
	});
	
</script>-->

</body>
</html>