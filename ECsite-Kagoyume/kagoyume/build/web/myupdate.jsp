<%@page import="kagoyume.UserDataDTO"%>
<%@page import="kagoyume.kagoyumeHelper"%>
<%
    kagoyumeHelper jh = kagoyumeHelper.getInstance();
    HttpSession hs = request.getSession();
    UserDataDTO udd = (UserDataDTO) hs.getAttribute("welcomeUDD");
    String name = udd.getName();
    String password = udd.getPassword();
    String mail = udd.getMail();
    String address = udd.getAddress();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- BootstrapのCSS読み込み -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery読み込み -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- BootstrapのJS読み込み -->
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function check() {
                if (confirm("情報を更新しますか？"))
                {
                    return true;
                } else
                {
                    return false;
                }
            }
        </script>
        <title>ユーザー情報更新画面 | かご夢</title>
    </head>
    <body>
        <div class="container" align="center">

            <h2>ユーザー情報更新フォーム</h2>
            <hr>
            <form action="myupdateresult" method="post" onsubmit="return check()">
                ユーザー名<br>
                <input type="text" name="name" size="20" value="<%= name%>"><br><br>
                パスワード<br>
                <input type="text" name="password" size="20" value="<%= password%>"><br><br>
                メールアドレス<br>
                <input type="email" name="mail" size="30" value="<%= mail%>"><br><br>
                住所<br>
                <input type="text" name="address" size="50" value="<%= address%>"><br><br>
                <input type="hidden" name="ac" value="<%= hs.getAttribute("ac")%>">
                <input type="submit" name="btn" value="更新する">
            </form><br>
            <hr>
            <%= jh.top()%>
        </div>
    </body>
</html>
