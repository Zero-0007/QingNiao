<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/HouseRent/page/add.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>青鸟租房 -发布房屋信息</TITLE>
<META content="text/html; charset=utf-8" http-equiv=Content-Type>
<LINK rel=stylesheet type=text/css href="css/style.css">
<style>
#file {
	width: 100px;
	height: 100px;
	background-color: aliceblue;
	opacity: 0;
	z-index: 99;
}

#img, #file {
	position: absolute;
	top: 0px;
	left: 10px;
}
</style>
<META name=GENERATOR content="MSHTML 8.00.7601.17514">
</HEAD>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<BODY>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=regLogin class=wrap>
		<DIV class=dialog>
			<DL class=clearfix>
				<DT>新房屋信息发布</DT>
				<DD class=past>填写房屋信息</DD>
			</DL>
			<DIV class=box>
				<FORM id=add_action method=post name=add.action
					action=HouseServlet?param=add enctype=multipart/form-data>
					<DIV class=infos>
						<TABLE class=field>
							<TBODY>
								<input type="hidden" name="user" value="${user.uid}">
								<TR>
									<TD class=field>标 题：</TD>
									<TD><INPUT id=add_action_title class=text type=text
										name=title></TD>
								</TR>
								<TR>
									<TD class=field>户 型：</TD>
									<TD><SELECT id=type class=text name=type_id><OPTION
												selected value=0>请选择</OPTION></SELECT></TD>
								</TR>
								<TR>
									<TD class=field>面 积：</TD>
									<TD><INPUT id=add_action_floorage class=text type=text
										name=floorage></TD>
								</TR>
								<TR>
									<TD class=field>价 格：</TD>
									<TD><INPUT id=add_action_price class=text type=text
										name=price></TD>
								</TR>
								<TR>
									<TD class=field>房产证日期：</TD>
									<TD><INPUT class=text type=text name=houseDate></TD>
								</TR>
								<TR>
									<TD class=field>图片：</TD>
									<TD style="position: relative"><img
										style="position: relative" id="img" src="files/default.png"
										width="100" height="100px" /> <input id="file" type="file"
										name="file" onchange="chooseImage(this)" /></TD>
								</TR>
								<script type="text/javascript">
								$(function(){
								    //加载区县
								    function getDistrict(){
								        $.getJSON("DistrictServlet", function(data){
								            $("#district option:gt(0)").remove();
								            $(data).each(function(i, e){
								                var option = "<option value='" + e.did + "'>" + e.dname + "</option>";
								                $("#district").append(option);
								            });
								        });
								    }

								    getDistrict();

								    //获取街道
								    $("#district").change(function(){
								        let id = $("#district").val();
								        $("#street option:gt(0)").remove();
								        $.getJSON("StreetServlet", {"did": id}, function(data){
								            $(data).each(function(i, e){
								                var option = "<option value='" + e.sid + "'>" + e.sname + "</option>";
								                $("#street").append(option);
								            });
								        });
								    });

								    //加载房型
								    function getType(){
								        $.getJSON("TypeServlet", function(data){
								            $("#type option:gt(0)").remove();
								            $(data).each(function(i, e){
								                var option = "<option value='" + e.tid + "'>" + e.tname + "</option>";
								                $("#type").append(option);
								            });
								        });
								    }

								    getType();
								    
								    let params = new URLSearchParams(window.location.search);
								    let id = params.get('id');
								    if (id != null) {
								        $.getJSON("HouseServlet?param=findById&id=" + id, function (e) {
								            console.log(e);
								            $("#add_action_title").val(e.title);
								            $("#add_action_floorage").val(e.floorage);
								            $("#add_action_price").val(e.price);
								            $("#houseDate").val(e.pubdate);
								            $("#add_action_contact").val(e.contant);
								            $("#description").val(e.descript);
								            $("#street").get(0).selectedIndex = e.street.sid;
								            $("#district").get(0).selectedIndex = e.district.did;
								            $("#type").val(e.type.tid);
								        });
								    }
								});

								</script>
								<TR>
									<TD class=field>位 置：</TD>
									<TD>区：<SELECT id=district class=text name=district_id>
											<OPTION selected value=0>请选择</OPTION>
									</SELECT> 街： <SELECT id=street class=text name=street_id><OPTION
												selected value=0>请选择</OPTION></SELECT>
									</TD>
								</TR>
								<!-- 
						<tr>
							<td class="field">坐  标：</td>
							<td><input type="text" class="text" name="point" />
							</td>
						</tr>
						-->
								<!--  <tr>
							<td class="field">Y 坐  标：</td>
							<td><input type="text" class="text" name="point.y" /></td>
						</tr>-->
								<TR>
									<TD class=field>联系方式：</TD>
									<TD><INPUT id=add_action_contact class=text type=text
										name=contact></TD>
								</TR>
								<TR>
									<TD class=field>详细信息：</TD>
									<TD><TEXTAREA id=description name=description></TEXTAREA></TD>
								</TR>
							</TBODY>
						</TABLE>
						<DIV class=buttons>
							<INPUT value=立即发布 type=submit>
						</DIV>
					</DIV>
				</FORM>
			</DIV>
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
