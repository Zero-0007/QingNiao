<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/HouseRent/page/add.jsp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD> <META content="text/html;charset=UTF-8" http-equiv=Content-Type>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <script src="https://webapi.amap.com/maps?v=2.0&key=2e69b73ebb370aecea1ceacd6ac48904"></script>
    <script src="https://webapi.amap.com/loader.js"></script>
    <script type="text/javascript">
        window._AMapSecurityConfig = {
            securityJsCode: "1f623384d5dc5769b538f76a4408aaa2",
        }
    </script>
    <script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=2e69b73ebb370aecea1ceacd6ac48904&plugin=AMap.Geocoder"></script>
    <LINK
            rel=stylesheet type=text/css href="css/style.css">
    <META name=GENERATOR content="MSHTML 8.00.7601.17514">
    <script src="scripts/jquery-1.8.2.min.js"></script>
    <style>
    #container {
        position: absolute;
        left: 666px;
        top: 153px;
    }
</style></HEAD>
<BODY>

<DIV id=header class=wrap>
<DIV id=logo><IMG src="images/logo.gif"></DIV>
</DIV>

<DIV id=view class="main wrap">
  <div id="container" style="width: 350px; height: 240px;"></div>
<DIV id=footer class=wrap>
<DL>
  <DT>青鸟租房 © 2010 北大青鸟 京ICP证1000001号</DT>
  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
</BODY>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
    let params = new URLSearchParams(window.location.search);
    let id = params.get("id");
    console.log(id);
    $.getJSON("HouseServlet",{"param":"findById","id":id},function(e){
        console.log(e);
        let main = "<div class='intro'>" +
        "    <div class='lefter'>" +
        "        <h1>" + e.title + "</h1>" +
        "        <div class='subinfo'>" + e.pubdate + "</div>" +
        "        <div class='houseinfo'>" +
        "            <p>户　　型：<span>" + e.type.tname + "</span></p>" +
        "            <p>面　　积：<span>" + e.floorage + "<sup>2</sup></span></p>" +
        "            <p>位　　置：<span>" + e.district.dname + e.street.sname + "</span></p>" +
        "            <p>联系方式：<span>" + e.contant + "</span></p>" +
        "        </div>" +
        "    </div>" +
        "    <div class='side'>" +
        "        <p><a class='bold' href='http://localhost:8080/House-2/#'>北京青鸟房地产经纪公司</a></p>" +
        "        <p>资质证书：有</p>" +
        "        <p>内部编号:" + e.contant + "</p>" +
        "        <p>联 系 人：</p>" +
        "        <p>联系电话：<span>191xxxxx</span></p>" +
        "        <p>手机号码：<span>暂无</span></p>" +
        "    </div>" +
        "    <div class='clear'></div>" +
        "    <div class='introduction'>" +
        "        <h2><span><strong>房源详细信息</strong></span></h2>" +
        "        <div class='content'>" +
        "            <p>" + e.descript + "</p>" +
        "        </div>" +
        "    </div>" +
        "</div>";
        $("#view").prepend(main);

        // 获取地址信息
        let address = e.district.dname + e.street.sname;

        // 初始化地图
        var map = new AMap.Map('container', {
            zoom: 14 // 设置初始缩放级别
        });

        // 在异步请求回调函数中执行地图相关操作
        AMap.plugin('AMap.Geocoder', function () {
            var geocoder = new AMap.Geocoder({
                city: '长沙',
                batch: true
            });

            geocoder.getLocation(address, function (status, result) {
                if (status == 'complete' && result.info == 'OK') {
                    let location = result.geocodes[0].location;
                    let lng = location.lng;
                    let lat = location.lat;
                    console.log("经度:" + lng + "  纬度:" + lat);
                    var marker = new AMap.Marker({
                        position: [lng, lat],
                        map: map
                    });
                    map.setCenter([lng, lat]);
                    // 每隔1秒钟将地图的缩放级别增加1，直到缩放级别达到16为止。
                    let zoomLevel = 1;
                    let intervalId = setInterval(() => {
                        if (zoomLevel <= 16) {
                            map.setZoom(zoomLevel);
                            zoomLevel++;
                        } else {
                            clearInterval(intervalId);
                        }
                    }, 50);
                }
            });
        });
    });
});
</script>

</HTML>
