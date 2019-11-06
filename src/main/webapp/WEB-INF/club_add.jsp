<%@ page pageEncoding="utf-8" %>
<%-- 引入JSTL标签库 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>新增</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    <style type="text/css">
        body {
            font-family: "微软雅黑";
            background-color: #EDEDED;
        }

        h2 {
            text-align: center;
            font-size: 26px;
        }

        table {
            margin: 30px auto;
            text-align: center;
            border-collapse: collapse;
            width: 50%;
        }

        td, th {
            padding: 7px;
            font-size: 18px;
        }

        hr {
            margin-bottom: 20px;
            border: 1px solid #aaa;
        }

        input, select, textarea {
            width: 284px;
            height: 30px;
            background: #EDEDED;
            border: 1px solid #999;
            text-indent: 5px;
            font-size: 18px;
        }

        input[type='submit'] {
            width: 130px;
            height: 36px;
            cursor: pointer;
            border-radius: 5px 5px 5px 5px;
            background: #ddd;
        }

        select {
            text-indent: 0px;
        }

        textarea {
            height: 100px;
            font-size: 22px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var time = new Date();
            var day = ("0" + time.getDate()).slice(-2);
            var month = ("0" + (time.getMonth() + 1)).slice(-2);
            var today = time.getFullYear() + "-" + (month) + "-" + (day);
            $('#date_info').val(today);
        })
    </script>
    <script type="text/javascript">
        function blurTA(thisobj) {
            var name = document.getElementById("name").value;
            $.ajax({
                type: "POST",
                url: "/ValidateName",
                data: "name=" + name,
                success: function (data) {
                    // var resJson = $.parseJSON(data);  //用jQuery处理传过来的json值
                    // console.log("处理结果"+ JSON.data(data));
                    console.log("处理结果"+ JSON.stringify(data));
                    if (data.flag == true) {
                        alert("恭喜您！俱乐部名没有被使用！");

                    } else {
                        alert("抱歉！俱乐部名已存在！");
                    }
                }
            });
        }
    </script>
</head>
<body><!-- body-start  -->

<div style="border:0px ;font-size:26px;margin: 0 auto;color:white;background:#1289BB;width:50%;text-align:center;">
    新增
</div>
<form action="" method="POST">
    <table border="1">
        <tr>
            <td width="30%">俱乐部名称</td>
            <td>
                <input type="text" name="name" id="name" required="true" class="form_text" onblur="blurTA(this)"/>
            </td>
        </tr>
        <tr>
            <td width="30%">负责人</td>
            <td>
                <input type="text" name="charger" required="true"/>
            </td>
        </tr>
        <tr>
            <td>创建时间</td>
            <td>
                <input type="date" name="founded" required="true" id="date_info"/>

            </td>
        </tr>
        <tr>
            <td>俱乐部类型</td>
            <td>
                <select name="type" required="true">
                    <option value="1">足球</option>
                    <option value="2">羽毛球</option>
                    <option value="3">篮球</option>
                    <option value="4">乒乓球</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>活动次数</td>
            <td>
                <input type="text" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" required="true" name="number"/>
            </td>
        </tr>
        <tr>
            <td>会员数量</td>
            <td>
                <input type="text" onkeyup="value=value.replace(/^(0+)|[^\d]+/g,'')" required="true" name="member"/>
            </td>
        </tr>
        <tr>
            <td>备注：</td>
            <td>
                <input type="text" name="note" cols="30" rows="5"/>
            </td>
        </tr>
        <tr>
            <td>

                <input type="submit" value="取消" formnovalidate="formnovalidate"
                       onclick="javascript:this.form.action='findAll';"/>
            </td>
            <td>
                <input type="submit" value="保存" onclick="javascript:this.form.action='clubAdd';"/>
            </td>
        </tr>
    </table>
</form>

</body><!-- body-end  -->
</html>



