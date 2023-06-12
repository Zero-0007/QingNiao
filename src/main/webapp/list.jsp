<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0030)http://localhost:8080/House-2/ -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>青鸟租房 - 首页</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/style.css">
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
</HEAD>
<BODY>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=navbar class=wrap>
		<DL class="search clearfix">
			<FORM id=sform>
				<DT>
					<UL>
						<LI class=bold>房屋信息</LI>
						<LI>标题：<INPUT class=text type=text name=title> <LABEL
							class=ui-blue><INPUT id=search value=搜索房屋 type=button
								name=search></LABEL>
						</LI>
					</UL>
				</DT>
				<DD>
					<UL>
						<LI class=first>区县</LI>
						<LI><SELECT id=district name=district_id>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=1000>海淀区</OPTION>
								<OPTION value=1001>朝阳区</OPTION>
								<OPTION value=1002>东城区</OPTION>
								<OPTION value=1003>西城区</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>街道</LI>
						<LI><SELECT id=street name=street_id>
								<OPTION selected value="">不限</OPTION>
								<!-- <OPTION value=1000>知春路</OPTION>
								<OPTION value=1001>中关村大街</OPTION>
								<OPTION value=1002>学院路</OPTION>
								<OPTION value=1003>朝阳路</OPTION> -->
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>房型</LI>
						<LI><SELECT id=type name=type_id>
								<OPTION selected value="">不限</OPTION>
								<!-- <OPTION value=1000>一室一厅</OPTION>
								<OPTION value=1001>一室两厅</OPTION>
								<OPTION value=1002>两室一厅</OPTION>
								<OPTION value=1003>两室两厅</OPTION> -->
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>价格</LI>
						<LI><SELECT id=price name=price>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=0-1000>1000元以下</OPTION>
								<OPTION value=1000-3000>1000—3000元</OPTION>
								<OPTION value=3000-1000000>3000元以上</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
				<DD>
					<UL>
						<LI class=first>面积</LI>
						<LI><SELECT id=floorage name=floorage>
								<OPTION selected value="">不限</OPTION>
								<OPTION value=0-100>100以下</OPTION>
								<OPTION value=100-500>100-500</OPTION>
								<OPTION value=500-1000000>500以上</OPTION>
						</SELECT></LI>
					</UL>
				</DD>
			</FORM>
		</DL>
	</DIV>
	<DIV class="main wrap">
		<TABLE class=house-list>
			<TBODY>
				<!-- <TR>无租房信息
				</TR> -->
			</TBODY>
		</TABLE>
		<DIV class=pager>
			<UL>
				<LI class=current><A href="javascript:void(0);">首页</A></LI>
				<LI><A href="javascript:void(0);" class="shang">上一页</A></LI>
				<LI><A href="javascript:void(0);" class="xia">下一页</A></LI>
				<LI><A href="javascript:void(0);">末页</A></LI>
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
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		let pageNum = 1;
		let pages = 0;
		let pageIndex = 0;

		function getPageData() {
			var title = $('input[name="title"]').val();
			var district = $('select[name="district_id"]').val();
			var street = $('select[name="street_id"]').val();
			var type = $('select[name="type_id"]').val();
			var price = $('select[name="price"]').val();
			var floorage = $('select[name="floorage"]').val();

			console.log("标题: " + title);
			console.log("区县: " + district);
			console.log("街道: " + street);
			console.log("房型: " + type);
			console.log("价格: " + price);
			console.log("面积: " + floorage);

			$
					.getJSON(
							"HouseServlet",
							{
								"pageNum" : pageNum,
								"param" : "find",
								"title" : title,
								"did" : district,
								"sid" : street,
								"tid" : type,
								"price" : price,
								"floorage" : floorage
							},
							function(data) {
								// 清空表格中的数据
								$(".house-list tr").remove();
								$(".total").remove();

								pageIndex = data.currentPage;
								pages = data.totalPages;
								console.log(pageIndex);
								console.log(pages);
								console.log(data);

								var span = "<SPAN class=total>" + pageIndex
										+ "/" + pages + "页</SPAN>"
								$(".pager").append(span);
								$(data.list)
										.each(
												function(i, e) {
													var tr = "<tr><td class='house-thumb'><span><a href='details.htm' target='_blank'><img src='files/"+e.image+"' width='100' height='75' alt=''></a></span></td>"
															+ "<td>"
															+ "<dl>"
															+ "<dt>"
															+ "<a href='details.htm' target='_blank'>"
															+ e.title
															+ "</a>"
															+ "</dt>"
															+ "<dd>"
															+ e.descript
															+ "<br>联系方式："
															+ e.users.telephone
															+ "</dd>"
															+ "</dl>"
															+ "</td>"
															+ "<td class='house-type'>"
															+ e.type.tname
															+ "</td>"
															+ "<td class='house-price'><span>"
															+ e.price
															+ "</span>元/月</td>"
															+ "</tr>";
													$(".house-list > tbody")
															.append(tr);
												});
								changColor()
							});

			function changColor() {
				$("tr:even").addClass("odd");
			}
		}

		// 页面加载时获取第一页数据
		getPageData();

		// 点击“上一页”链接时更新页数并获取新的分页数据
		$(".shang").click(function() {
			if (pageNum > 1) {
				pageNum--;
				getPageData();
			}
		})

		// 点击“下一页”链接时更新页数并获取新的分页数据
		$(".xia").click(function() {
			pageNum++;
			getPageData();
		})

		$("#search").click(function() {
			getPageData();
		})
		
		//加载区县
		function getDistrict(){
			$.getJSON("DistrictServlet",function(data){
				$("#district option:gt(0)").remove();
				$(data).each(function(i,e){
					var option="<option value='" + e.did + "'>" + e.dname + "</option>";
					$("#district").append(option);
				})
			})
		}
		
		getDistrict();
		
		//获取街道
		$("#district").change(function(){
			let id=$("#district").val();
			$("#street option:gt(0)").remove();
			$.getJSON("StreetServlet",{"did":id},function(data){
				$(data).each(function(i,e){
					var option="<option value='" + e.sid + "'>" + e.sname + "</option>";
					$("#street").append(option);
				})
			})
		})

		//加载房型
		function getType(){
			$.getJSON("TypeServlet",function(data){
				$("#type option:gt(0)").remove();
				$(data).each(function(i,e){
					var option="<option value='" + e.tid + "'>" + e.tname + "</option>";
					$("#type").append(option);
				})
			})
		}
		
		getType();
	});
</script>
</HTML>
