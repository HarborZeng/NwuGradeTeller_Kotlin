<%@ page contentType="text/html;charset=UTF-8"%>

<nav class="navbar navbar-default navbar-fixed-top ">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">西北大学第三方成绩查询</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="${pageContext.request.contextPath}/index.jsp">本学期成绩</a></li>
                <li><a href="${pageContext.request.contextPath}/history.jsp">历年成绩</a></li>
            </ul>
        </div>
    </div>
</nav>
