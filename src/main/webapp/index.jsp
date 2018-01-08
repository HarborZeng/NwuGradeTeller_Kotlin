<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>查询成绩 - TellYouWhat</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<jsp:include page="decoretions/nav.jsp"/>
<div class="container harbor-container">
    <div class="harbor-body">
        <form action="${pageContext.request.contextPath}/queryCurrentTermGrades" method="post">
            <div class="form-group">
                <label for="student-number">学号：</label>
                <input id="student-number" title="学号" placeholder="10位纯数字"
                <%--@elvariable id="studentNumber" type="java.lang.String"--%>
                       maxlength="10" name="stu-num" class="form-control" value="${studentNumber}">
            </div>
            <%--@elvariable id="errorMessage" type="java.lang.String"--%>
            <c:if test="${not empty errorMessage}">
                <div class="text-danger harbor-padding">
                    <span>${errorMessage}</span>
                    <c:remove var="errorMessage" scope="session"/>
                </div>
            </c:if>
            <div class="checkbox">
                <label>
                    <input type="checkbox" name="agreement"> 同意软件使用条款
                    <a href="agreement.html" target="_blank">免责条款</a>
                </label>
            </div>
            <button type="submit" class="btn btn-primary btn-lg">查询</button>
        </form>

        <%--@elvariable id="grades" type="java.util.List"--%>
        <c:if test="${grades != null}">
            <table class="table table-bordered table-hover">
                <tr>
                    <th>课程</th>
                    <th>成绩</th>
                </tr>
                    <%--@elvariable id="grades" type="java.util.List"--%>
                <c:forEach items="${grades}" var="grade">
                    <tr>
                        <td>${grade.extend1}</td>
                        <td>${grade.extend2}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </div>
    <jsp:include page="decoretions/footer.jsp"/>
</div>
<script src="//cdn.bootcss.com/jquery/2.2.0/jquery.min.js" crossorigin="anonymous"
        integrity="sha384-K+ctZQ+LL8q6tP7I94W+qzQsfRV2a+AfHIi9k8z8l9ggpc8X+Ytst4yBo/hH+8Fk">
</script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
        integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
        crossorigin="anonymous"></script>
</body>
</html>
