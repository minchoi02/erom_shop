<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>
<c:choose>
	<c:when test="${empty prod_seq}">
		<c:set var="btn_title" value="등록"/>
		<c:set var="prod_reserve_limit" value="30"/>
		<c:set var="prod_price" value="0"/>
		<c:set var="option_cnt" value="1"/>
	</c:when>
	<c:otherwise>
		<c:set var="btn_title" value="수정"/>
		<c:set var="prod_reserve_limit" value="${prodInfo.prod_reserve_limit }"/>
		<c:set var="prod_price" value="${prodInfo.prod_price }"/>
		<%--<c:set var="option_cnt" value="${prodInfo.prod_price }"/> --%>
		<c:set var="option_cnt" value="0"/>
	</c:otherwise>
</c:choose>

		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">숙박 <c:out value="${btn_title }"/></h1>

			<!-- 상품관리 > 숙박 > 글쓰기 { -->
			<section id="productRoomWrite" class="page_content">

				<c:import url="./productCommonForm.jsp"/>

				<!-- 객실설명 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 요금정보</h2>
					<table class="admin_tbl admin_write_tbl">
						<caption>요금정보</caption>
						<colgroup>
							<col width="200" />
							<col />
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>온라인 결제 허용여부</th>
								<td colspan="3">
									<p class="comment">* 구매/예약 결제를 온라인에서 허용할 것인지에 대한 체크사항입니다.<br />체크 해제시 사용자페이지에서 해당 상품에 대한 구매/예약 기능이 불가합니다.</p>
									<input type="checkbox" id="prod_use_pay_st" name="prod_use_pay_st" value="Y"  <c:if test="${prodInfo.prod_use_pay_st eq 'Y' }">checked</c:if> class="admin_check" /><label for="prod_use_pay_st">온라인 결제 허용</label>
								</td>
							</tr>
							<tr>
								<th>구매/예약 가능일</th>
								<td colspan="3">
									<p class="comment">* 구매/예약 가능일을 지정합니다. <br />예) 오늘기준 1개월 이내의 예약만 받을 시 : 30일</p>
									시작일: 오늘 기준 2일 후 ~ 종료일: <input type="text" id="prod_reserve_limit" name="prod_reserve_limit" class="admin_input" size="5" value="<c:out value="${prod_reserve_limit }"/>" /> 일
								</td>
							</tr>
							<input type="hidden" name="prod_price" value="0" />
							<tr>
								<th>공통 옵션가격 &nbsp;&nbsp; <a href="#;" onclick="option_price_add()" class="btns whitebtn h24px"><i class="fal fa-plus"></i></a><input type="hidden" value="<c:out value="${fn:length(prodOptionInfo) }"/>" id="option_cnt" ></th>
								<td colspan="3" id="option_list">
									<c:set var="optcnt" value="1"/>
									<%--
									<p class="comment">* 상품예약시, 공통 옵션이 표시되고, 객실별 옵션이 각각 표시됩니다. </p>
									 --%>									
									<p class="comment">* 옵션명과 가격이 모두 입력되어야만 저장되며, 삭제시 반드시 저장을 하여야 합니다.<br>* 객실별 숙박가에 옵션가격이 합산됩니다.</p>									
									<c:forEach var="prodOptionInfo" items="${prodOptionInfo}" varStatus="status">
									<div id="option_<c:out value="${optcnt }"/>" >
										<a href="#;" onclick="option_delete('<c:out value="${optcnt }"/>')" class="btns whitebtn h24px"><i class="fal fa-minus" ></i></a>&nbsp;&nbsp;
										<input type="text" id="option_nm_<c:out value="${optcnt }"/>'" name="prod_option_nm" class="admin_input" size="35" placeholder="내용" value="<c:out value="${prodOptionInfo.opt_nm}"/>" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="text" id="option_price_<c:out value="${optcnt }"/>'" name="prod_option_price" class="admin_input alignRight" size="10" placeholder="가격" value="<c:out value="${prodOptionInfo.opt_price}"/>"  /> 원
									</div>
									<c:set var="optcnt" value="${optcnt+1}"/>
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</table>
				</article>
				<!-- } 객실설명 -->
				
				<!-- 객실목록 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 객실목록 &nbsp; &nbsp; <button type="button" class="btns graybtn "  onclick="roomSet();">객실 추가</button></h2>
					<p class="comment">* 노출순서는 노출순서코드가 작은 숫자 순서로 보여지게 됩니다.</p>
					<table class="admin_tbl admin_list_tbl">
						<caption>객실요금</caption>
						<colgroup>
							<col width="120"/>
							<col width="120"/>
							<col />
							<col width="80"/>
							<col width="80"/>
							<col width="15%" />
							<col width="15%" />
							<col width="15%"/>
							<col width="120"/>
						</colgroup>
						<thead>
							<tr>
								<th>노출순서 코드</th>
								<th>사진 1</th>
								<th>객실명</th>
								<th>기본인원</th>
								<th>최대인원</th>
								<th>비수기(평일/주말)</th>
								<th>준성수기(평일/주말)</th>
								<th>성수기(평일/주말)</th>
								<th>준성수기(평일/주말, 성수기 후)</th>
								<th>관리</th>
							</tr>
						</thead>
						<tbody id="prod_room_list">
						</tbody>
					</table>
				</article>
				<!-- } 객실목록 -->
				
	
				<c:if test="${adminLevel > 5 }">
				<!-- 추천관광지 { -->
				<c:import url="./productCommonTravel.jsp"/>
				</c:if>

				<!-- 전자상거래 등에서 상품제공 고시 { -->
				<c:import url="./productCommonInformation.jsp"/>
				
				<div class="btnarea alignRight mgt30px">
					<ul class="nopm floats">
						<li><a href="/admgr/admgrProduct/productList.do?pageIndex=<c:out value="${pageIndex }"/>&store_category=<c:out value="${store_category }"/>&searchKey=<c:out value="${searchKey }"/>&searchKeyword=<c:out value="${searchKey }"/>" class="btns "><i class="fal fa-list"></i> 목록으로</a></li>
						<li class="fr"><button type="submit" class="btns redbtn"><i class="far fa-save"></i> 저장</button></li>
					</ul>
				</div>
			</section>
			</form>
			<!-- } 상품관리 > 숙박 > 글쓰기 -->
		</div>
		<!-- } 콘텐츠 영역 -->

		<div id="modal_form"></div>		

		<script>
		getRoomList();
		</script>

<c:import url="/Api/admgrIncludeBottom.do"/>