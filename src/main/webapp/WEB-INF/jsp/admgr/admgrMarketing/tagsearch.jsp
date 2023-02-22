<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:import url="/Api/admgrIncludeTop.do"/>
<c:import url="/Api/admgrIncludeLeftMenu.do"/>


		<!-- 콘텐츠 영역 { -->
		<div id="content">
			<h1 class="bigTit">태그 관리</h1>
			<div class="pageComment">
				<div class="comment_ico"><i class="fad fa-comment-alt-smile"></i></div>
				<p>
					태그들을 관리하는 페이지로<br />
					기존 값에 변경 후, <span class="colorRed">저장 버튼</span>을 눌러주세요.
					데이터베이스에 저장 되어있는 코드들을 변경합니다.
				</p>
			</div>

			<!-- 환경설정 > 기본환경설정 { -->
			<section id="baseSetting" class="page_content">
				<!-- 전체 기본설정 { -->
				<article class="page_sortation">
					<h2 class="h2Tit"><i class="fal fa-window-minimize"></i> 태그 관리</h2>
					<form method="post" action="/admgr/admgrMarketing/tgAction.do" onsubmit="return tgSettingForm();"/>
					<table class="admin_tbl admin_write_tbl">
						<caption>태그검색 관리</caption>
						<colgroup>
							<col width="200" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>헤더 전체보기 태그</th>
								<td>
								
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>
											
											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 첫번째 태그 카테고리" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_1" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_1 }"/>" style=background: #ffb591; color: #000;</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>																					
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 좌측 첫번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_2" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_2 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 좌측 두번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_3" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_3 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 좌측 세번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_4" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_4 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 좌측 네번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_5" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_5 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 좌측 다섯번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_6" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_6 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 두번째 태그 카테고리" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_7" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_7 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 우측 첫번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_8" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_8 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 우측 두번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_9" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_9 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 우측 세번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_10" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_10 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 우측 네번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_11" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_11 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헤더 우측 다섯번째 태그명" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_0_12" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_0_12 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
																																																																																																			
										</tbody>
									</table>
									
								</td>
							</tr>
							<tr>
								<th>건강식품 태그</th>
								<td>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="건강식품 태그 첫번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_1_1" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_1_1 }"/>" style=background: #ffb591; color: #000;</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="건강식품 태그 두번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_1_2" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_1_2 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="건강식품 태그 세번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_1_3" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_1_3 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="건강식품 태그 네번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_1_4" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_1_4 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
																						
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<th>푸드케어 태그</th>
								<td>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="푸드케어 태그 첫번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_2_1" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_2_1 }"/>" style=background: #ffb591; color: #000;</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="푸드케어 태그 두번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_2_2" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_2_2 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="푸드케어 태그 세번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_2_3" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_2_3 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="푸드케어 태그 네번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_2_4" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_2_4 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
																						
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<th>헬스&바디케어 태그</th>
								<td>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헬스&바디케어 태그 첫번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_3_1" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_3_1 }"/>" style=background: #ffb591; color: #000;</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헬스&바디케어 태그 두번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_3_2" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_3_2 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헬스&바디케어 태그 세번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_3_3" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_3_3 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="헬스&바디케어 태그 네번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_3_4" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_3_4 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
																						
										</tbody>
									</table>
								</td>
							</tr>
							<tr>
								<th>펫케어 태그</th>
								<td>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="펫케어 태그 첫번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_4_1" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_4_1 }"/>" style=background: #ffb591; color: #000;</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="펫케어 태그 두번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_4_2" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_4_2 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="펫케어 태그 세번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_4_3" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_4_3 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="펫케어 태그 네번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_4_4" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_4_4 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
																						
										</tbody>
									</table>
								</td>
							</tr>		
							<tr>
								<th>기획전 태그</th>
								<td>
									<table class="admin_tbl admin_write_tbl">
										<colgroup>
											<col width="200" />
											<col width="200" />
											<col width="200" />
											<col width="150" />
											<col />
										</colgroup>
										<tbody>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="기획전 태그 첫번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_5_1" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_5_1 }"/>" style=background: #ffb591; color: #000;</td>
												<td><button type="submit" class="btns bluebtn h24px">수정</button></td>
											</tr>
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="기획전 태그 두번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_5_2" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_5_2 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="기획전 태그 세번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_5_3" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_5_3 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
											<tr>
												<td><input type="text" autocomplete="no" name="base_tg_cd" class="admin_input readonly base_cd" readonly size="30" placeholder="" value="기획전 태그 네번째 단어" /></td>
												<td><input type="text" autocomplete="no" name="base_tg_cd_5_4" class="admin_input base_cd_nm"  size="20" placeholder="" value="<c:out value="${tgList.base_tg_cd_5_4 }"/>" style=background: #ffb591; color: #000;</td>												
											</tr>											
																						
										</tbody>
									</table>
								</td>
							</tr>																										
						</tbody>
					</table>
					</form>
				</article>
				<!-- } 전체 기본설정 -->
				
				<%--
				<div class="btnarea alignRight mgt30px">
					<a href="javascript:alert('저장되었습니다.');" class="btns redbtn"><i class="far fa-save"></i> 저장</a>
				</div>
				 --%>
			</section>
			<!-- } 환경설정 > 기본환경설정 -->
		</div>
		<!-- } 콘텐츠 영역 -->


<c:import url="/Api/admgrIncludeBottom.do"/>