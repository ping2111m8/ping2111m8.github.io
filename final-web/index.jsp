<%@ page import = "java.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="utf-8"%>
<%@ page language="java" %>
<% request.setCharacterEncoding("UTF-8");//統一編碼  %>

<!DOCTYPE html>
<html>
	<meta charset="utf-8">
	<script>
		$(function (){
			$('.change a').click(function (){
				$('.signform').animate({height: 'toggle', opacity: 'toggle'}, 'slow');
			});
		})
		function start() {
			document.getElementById('signform').style.display=""
		}
		function signclose() {
			document.getElementById('signform').style.display="none"
			document.getElementById('registerform').style.display="none"
		}
		function loading() {
			document.getElementById('registerloading').style.display=""
		}
	</script>
	<script> 
		function showDialog(){
			var whitebg = document.getElementById("white-background");
			var dlg = document.getElementById("dlgbox");
			whitebg.style.display = "block";
			dlg.style.display = "block";
			var winWidth = window.innerWidth;
			var winHeight = window.innerHeight;
			dlg.style.left = (winWidth/2) - 480/2 + "px";
			dlg.style.top = "150px";
		}
		function closeDialog(){
			var whitebg = document.getElementById("white-background");
			whitebg.style.display = "none";
			var dlg = document.getElementById("dlgbox");
			dlg.style.display="none";
		}
	</script>
<head>
	<title>杯可Backer</title>
	<link rel="stylesheet" type="text/css" href="assets/css/index.css">
	<link rel="stylesheet" type="text/css" href="assets/css/log.css">
</head>
<body>
	<header id="header">
		<div id="headset">
			<div id="login_logout">
				<form name="login" action="#">
					<button id="button_in" onclick="showDialog()">登入 / 註冊</button>
					<div id="white-background"><!--登入--></div>
					<div id="dlgbox">
						<div id="dlg-header">登入
							<h3 onclick="closeDialog()" title="關閉視窗" class="close">x</h3>
						</div>
						<div id="dlg-body"><br/>
							帳號：<input type="text" name="id_number" value="" placeholder=""> <br/><br/>
							密碼：<input type="password" name="password" value="" placeholder=""><br/><br/>
						</div>
						<div id="dlg-footer">
							<input type="button" name="login" value="登入">
							<input type="button" name="enroll" value="註冊">
						</div>
					</div><!--登入end-->
					<div id="white-background"><!--登入介面始--></div>
						<div id="dlgbox">
						<div id="dlg-header">登入
							<a href="index.html" title="關閉視窗" class="close"><input type="button" name="" value="×"></a>
						</div>
						<div id="dlg-body"><br/>
							帳號：<input type="text" name="id_number"> <br/>
							密碼：<input type="password" name="password"><br/>
						</div>
						<div id="dlg-footer">
							<input type="button" name="login" value="登入">
							<input type="button" name="enroll" value="註冊">
						</div>
					</div><!--登入介面終-->
				</form>
			</div>
			<div id="A">
				<div id="B">
					<ul>
						<li><a href="pages/list.html" style="color:black;"><p>商品列表</p></a></li>
						<li><a href="pages/hot.html" style="color:black;"><p>熱門排行</p></a></li>
						<li><a href="pages/hope.html" style="color:black;"><p>願望清單</p></a></li>
						<li><a href="pages/cart.html" style="color:black;"><p>購 物 車</p></a></li>
						<li><a href="pages/about.html" style="color:black;"><p>關於我們</p></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="mySidenav" class="sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="pages/list.html"><p>商品列表</p></a>
			<a href="pages/hot.html"><p>熱門排行</p></a>
			<a href="pages/hope.html"><p>願望清單</p></a>
			<a href="pages/cart.html"><p>購 物 車</p></a>
			<a href="pages/about.html"><p>關於我們</p></a>
			<a href="pages/after.html"><p>後台管理</p></a>
		</div>
		<span style="font-size:50px;cursor:pointer" class="menu_click" onclick="openNav()">&#9776;</span>
		<script>
		function openNav() {document.getElementById("mySidenav").style.width = "250px";}
		function closeNav() {document.getElementById("mySidenav").style.width = "0";}
		</script>
	</header>
	<section>
		<aside></aside>
		<nav>
			<div id="nav_div">
				<ul align="left">
					<li><a href="pages/1.html" style="color:black">75% 摩卡生巧乳酪</a></li>
					<li><a href="pages/2.html" style="color:black">丸久小山園抹茶生巧乳酪</a></li>
					<li><a href="pages/3.html" style="color:black">日光。芋乳酪蛋糕</a></li>
					<li><a href="pages/7.html" style="color:black">奇幻旅程</a></li>
					<li><a href="pages/8.html" style="color:black">品好經典原味乳酪</a></li>
					<li><a href="pages/6.html" style="color:black">仲夏莓果</a></li>
					<li><a href="pages/4.html" style="color:black">巧克力手工餅乾</a></li>
					<li><a href="pages/5.html" style="color:black">玉米片手工餅乾</a></li>
					<li><a href="pages/9.html" style="color:black">帕瑪森迷迭香起司餅乾</a></li>
					<li><a href="pages/10.html"style="color: black">黑芝麻手工餅乾</a></li>
					<li><a href="pages/11.html"style="color: black">橘子手工餅乾</a></li>
					<li><a href="pages/12.html"style="color: black">覆盆莓餅乾</a></li>
				</ul>
			</div>
		</nav>
		<div class="slider_container">
			<div>
				<img width="900px" height="400px" src="assets/pic/banner/1.png" alt="pure css3 slider" />
				<span class="info">Image Description 1</span>
			</div>
			<div>
				<img width="900px" height="400px" src="assets/pic/banner/2.png" alt="pure css3 slider" />
				<span class="info">Image Description 2</span>
			</div>
			<div>
				<img width="900px" height="400px" src="assets/pic/banner/3.png" alt="pure css3 slider" />
				<span class="info">Image Description 3</span>
			</div>
		</div>
		<div>
			盃可Baker</br>
			地址：</br>
			320桃園市中壢區弘揚路81號</br>
			連絡方式：</br>
			(03)4930744</br>
			PING2111M8@GMAIL.COM</br>
		</div>
		<article></article>
	</section>
	<footer id="footer">
		<div id="footer_p">
			<p> 
			<%
				Integer Count = (Integer)application.getAttribute("Counter");
				if( Count ==null || Count == 0 ){
					Count = 1;
				}
				if(session.isNew())
					Count++;
				application.setAttribute("Counter", Count);
				String people ="您是第:"+ String.valueOf(application.getAttribute("Counter"))+"位訪客"; 
				out.print(people);
			%>
			</p>
		</div>
	</footer>
</body>
</html>