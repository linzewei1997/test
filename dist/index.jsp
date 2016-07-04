<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>文档管理面板</title>
	<link rel="stylesheet" href="../dist/css/default.css">
	<link rel="stylesheet" href="../dist/css/easyui.css">
	<link rel="stylesheet" href="../dist/css/icon.css">
	<link rel="stylesheet" href="../dist/css/base.css">
	<script src="../dist/js/jquery-1.4.2.min.js"></script>
	<script src="../dist/js/jQuery.easyui.js"></script>
	<script src="../dist/js/outlook2.js"></script>
	<script type="text/javascript">
	 var _menus = {"menus":[
						{"menuid":"1","icon":"icon-sys","menuname":"文档管理工具",
							"menus":[{"menuname":"音频管理","icon":"icon-nav","url":"audio.jsp"},
									{"menuname":"视频管理","icon":"icon-add","url":""},
									{"menuname":"图片管理","icon":"icon-users","url":""},
									{"menuname":"文档管理","icon":"icon-role","url":""},
                                    {"menuname":"文本管理","icon":"icon-set","url":""}
								]
						}
				   ]};
        //设置登录窗口
        function openPwd() {
            $('#w').window({
                title: '修改密码',
                width: 300,
                modal: true,
                shadow: true,
                closed: true,
                height: 160,
                resizable:false
            });
        }
        //关闭登录窗口
        function close() {
            $('#w').window('close');
        }

        

        //修改密码
        function serverLogin() {
            var $newpass = $('#txtNewPass');
            var $rePass = $('#txtRePass');

            if ($newpass.val() == '') {
                msgShow('系统提示', '请输入密码！', 'warning');
                return false;
            }
            if ($rePass.val() == '') {
                msgShow('系统提示', '请在一次输入密码！', 'warning');
                return false;
            }

            if ($newpass.val() != $rePass.val()) {
                msgShow('系统提示', '两次密码不一至！请重新输入', 'warning');
                return false;
            }

            $.post('/ajax/editpassword.ashx?newpass=' + $newpass.val(), function(msg) {
                msgShow('系统提示', '恭喜，密码修改成功！<br>您的新密码为：' + msg, 'info');
                $newpass.val('');
                $rePass.val('');
                close();
            })
            
        }

        $(function() {

            openPwd();
            //
            $('#editpass').click(function() {
                $('#w').window('open');
            });

            $('#btnEp').click(function() {
                serverLogin();
            })

           

            $('#loginOut').click(function() {
                $.messager.confirm('系统提示', '您确定要退出本次登录吗?', function(r) {

                    if (r) {
                        location.href = '/ajax/loginout.ashx';
                    }
                });

            })
			
			
			
        });
		
		

    </script>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
	<div region="north" split="true" border="false" class="header">
        <span class="head">
	        欢迎 
	        <a href="#" id="editpass">修改密码</a> 
	        <a href="#" id="loginOut">安全退出</a>
        </span>
        <span class="title">文档管理工具</span>
    </div>
    <div region="south" split="true" class="footer_wrap">
        <div class="footer">By 微投网 www.vchello.com</div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width:180px;" id="west">
		<div class="easyui-accordion" fit="true" border="false">
		<!--  导航内容 -->				
		</div>
    </div>
    <div id="mainPanle" region="center">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
			<div title="欢迎使用" id="home">				
			    <h1>Welcome to jQuery UI!</h1>
			</div>
		</div>
    </div>

    <!--修改密码窗口-->
    <div id="w" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" maximizable="false" icon="icon-save">
        <div class="easyui-layout" fit="true">
            <div region="center" border="false" class="window-label">
                <table cellpadding=3>
                    <tr>
                        <td>新密码：</td>
                        <td><input id="txtNewPass" type="Password" class="txt01" /></td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td><input id="txtRePass" type="Password" class="txt01" /></td>
                    </tr>
                </table>
            </div>
            <div region="south" border="false" class="window-btn">
                <a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)" >确定</a> 
                <a class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)" onclick="closeLogin()">取消</a>
            </div>
        </div>
    </div>

    <div id="mm" class="easyui-menu">
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseall">全部关闭</div>
		<div id="mm-tabcloseother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright">当前页右侧全部关闭</div>
		<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="mm-exit">退出</div>
	</div>
</body>
</html>