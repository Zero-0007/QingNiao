<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0050)http://localhost:8080/HouseRent/manage!list.action -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>青鸟租房 - 用户管理</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/style.css">

<META name=GENERATOR>

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function() {
				let pageNum = 1;
				let pages = 0;
				let pageIndex = 0;

				function getPageData() {
					$
							.getJSON(
									"HouseServlet",
									{
										"pageNum" : pageNum,
										"param" : "find",
										"title" : null,
										"did" : 0,
										"sid" : 0,
										"tid" : 0,
										"price" : 0,
										"floorage" : 0
									},
									function(data) {
										// 清空表格中的数据
										$(".house-list tr").remove();
										$(".total").remove();
										$(".pager li").remove();

										pageIndex = data.currentPage;
										pages = data.totalPages;
										console.log(pageIndex);
										console.log(pages);
										console.log(data);

										//页码
										for (var i = 1; i <= pages; i++) {
											var index = "<LI class='current'>"
													+ "<A id='widget_338868862' href='javascript:void(0);' class='index' "
													+ "parseContent='true' showError='true' targets='houseArea' ajaxAfterValidation='false' validate='false' "
													+ "dojoType='struts:BindAnchor'>"
													+ i + "</A>" + "</LI>";
											$(".pager ul").append(index);
										}

										var span = "<SPAN class=total>"
												+ pageIndex + "/" + pages
												+ "页</SPAN>"
										$(".pager").append(span);
										$(data.list)
												.each(
														function(i, e) {
															var tr = "<tr>"
																	+ "<td class='house-thumb'><span><a href='details.jsp?id="
																	+ e.id
																	+ "' target='_blank'><img src='files/"+e.image+"' width='100' height='75' alt=''></a></span></td>"
																	+ "<td>"
																	+ "<dl>"
																	+ "<dt>"
																	+ "<a href='details.jsp?id="
																	+ e.id
																	+ "' target='_blank'>"
																	+ e.title
																	+ "</a>"
																	+ "</dt>"
																	+ "<dd>"
																	+ e.district.dname
																	+ e.street.sname
																	+ ","
																	+ e.floorage
																	+ "平米<br>联系方式："
																	+ e.users.telephone
																	+ "</dd>"
																	+ "</dl>"
																	+ "</td>"
																	+ "<td class='house-type'><label class='ui-green'><input onclick=\"window.location.href='fabu.jsp?id=" + e.id + "'\" value='修    改' type='button' name='search'></label></td>"
																	+ "<td class='house-price'><label class='ui-green'><input onclick='delete("+e.id+")' value='删    除' type='button' name='search'></label></td>"
																	+ "</tr>";

															$(
																	".house-list > tbody")
																	.append(tr);
														});
										changColor()
									});

					function changColor() {
						$("tr:even").addClass("odd");
					}
				}

				getPageData()

				//选择页码
				$(document).on("click", ".index", function() {
					pageNum = $(this).text();
					console.log(pageNum);
					getPageData();
				});
			})
</script>
</HEAD>
<BODY>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
		<DIV class=search>
			<LABEL class="ui-green searchs"><a href="fabu.jsp" title="">发布房屋信息</a></LABEL>
			<LABEL class=ui-green><INPUT
				onclick='document.location="index.jsp"' value="退       出"
				type=button name=search></LABEL>
		</DIV>
	</DIV>
	<DIV class="main wrap">
		<DIV id=houseArea>
			<TABLE class=house-list>
				<TBODY>
					<TR>
						<TD class=house-thumb><SPAN><A href="details.htm"
								target="_blank"><img src="../images/thumb_house.gif"
									width="100" height="75" alt=""></A></SPAN></TD>
						<TD>
							<DL>
								<DT>
									<A href="details.htm" target="_blank">123</A>
								</DT>
								<DD>
									海淀区中关村大街,123平米<BR>联系方式：123
								</DD>
							</DL>
						</TD>
						<TD class=house-type><LABEL class=ui-green><INPUT
								onclick=update(46) value="修    改" type=button name=search></LABEL></TD>
						<TD class=house-price><LABEL class=ui-green><INPUT
								value="删    除" type=button name=search></LABEL></TD>
					</TR>
					<TR class=odd>
						<TD class=house-thumb><SPAN><A href="details.htm"
								target="_blank"><img src="../images/thumb_house.gif"
									width="100" height="75" alt=""></A></SPAN></TD>
						<TD>
							<DL>
								<DT>
									<A href="details.htm" target="_blank">jjjj</A>
								</DT>
								<DD>
									海淀区中关村大街,123平米<BR>联系方式：ff
								</DD>
							</DL>
						</TD>
						<TD class=house-type><LABEL class=ui-green><INPUT
								onclick=update(47) value="修    改" type=button name=search></LABEL></TD>
						<TD class=house-price><LABEL class=ui-green><INPUT
								value="删    除" type=button name=search></LABEL></TD>
					</TR>
					<TR>
						<TD class=house-thumb><SPAN><A href="details.htm"
								target="_blank"><img src="../images/thumb_house.gif"
									width="100" height="75" alt=""></A></SPAN></TD>
						<TD>
							<DL>
								<DT>
									<A href="details.htm" target="_blank">大房子</A>
								</DT>
								<DD>
									海淀区中关村大街,100平米<BR>联系方式：123456789
								</DD>
							</DL>
						</TD>
						<TD class=house-type><LABEL class=ui-green><INPUT
								onclick=update(6) value="修    改" type=button name=search></LABEL></TD>
						<TD class=house-price><LABEL class=ui-green><INPUT
								value="删    除" type=button name=search></LABEL></TD>
					</TR>
				</TBODY>
			</TABLE>
		</DIV>
		<DIV class=pager>
			<UL>
				<LI class=current><A id=widget_338868862
					href="http://localhost:8080/HouseRent/manage!ajaxList.action?number=1"
					parseContent="true" showError="true" targets="houseArea"
					ajaxAfterValidation="false" validate="false"
					dojoType="struts:BindAnchor">1</A></LI>
				<LI class=current><A id=widget_1160989910
					href="http://localhost:8080/HouseRent/manage!ajaxList.action?number=2"
					parseContent="true" showError="true" targets="houseArea"
					ajaxAfterValidation="false" validate="false"
					dojoType="struts:BindAnchor">2</A></LI>
			</UL>
			<SPAN class=total>1/2页</SPAN>
		</DIV>
	</DIV>
	<DIV id=footer class=wrap>
		<DL>
			<DT>青鸟租房 © 2010 北大青鸟 京ICP证1000001号</DT>
			<DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
		</DL>
	</DIV>
</BODY>
</HTML>
