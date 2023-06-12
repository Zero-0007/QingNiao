<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0049)http://localhost:8080/HouseRent/page/register.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE>青鸟租房 - 用户注册</TITLE>
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
	<DIV id=regLogin class=wrap>
		<DIV class=dialog>
			<DL class=clearfix>
				<DT>新用户注册</DT>
				<DD class=past>填写个人信息</DD>
			</DL>
			<DIV class=box>
				<FORM id=fm method=post action=UsersServlet?param=regs>
					<DIV class=infos>
						<TABLE class=field>
							<TBODY>
								<TR>
									<TD class=field>用 户 名：</TD>
									<TD><INPUT id=name class=text type=text name=name></TD>
								</TR>
								<TR>
									<TD class=field>密 码：</TD>
									<TD><INPUT id=pass class=text type=password name=password></TD>
								</TR>
								<TR>
									<TD class=field>确认密码：</TD>
									<TD><INPUT class=text type=password name=repassword>
									</TD>
								</TR>
								<TR>
									<TD class=field>电 话：</TD>
									<TD><INPUT class=text type=text name=telephone></TD>
								</TR>
								<TR>
									<TD class=field>用户姓名：</TD>
									<TD><INPUT class=text type=text name=username></TD>
								</TR>
							</TBODY>
						</TABLE>
						<DIV class=buttons>
							<INPUT id=regs value=立即注册 type=submit>
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
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#fm').submit(function() {
			var name = $('#name').val();
			var pass = $('#pass').val();
			if (name == '' || pass == '') {
				alert('用户名或密码不能为空！');
				return false;
			}
			return true;
		});

		$('#name').blur(function() {
			$.ajax({
				url : 'usersServlet?opr=check',
				type : 'post', //请求方式
				async : true, //设置同步和异步，默认异步
				data : {
					name : $('#name').val()
				},
				success : function(r) {
					if (r == 1) {
						alert('用户已经存在！');
					} else {
						alert('用户可以使用！');
					}
				}
			});

		});
	})
</script>
</HTML>
