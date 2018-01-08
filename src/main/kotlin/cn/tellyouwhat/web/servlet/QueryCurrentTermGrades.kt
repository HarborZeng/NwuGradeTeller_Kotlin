package cn.tellyouwhat.web.servlet

import cn.tellyouwhat.murpnewsservice.MURPNewsService
import cn.tellyouwhat.murpnewsservice.Murpcustomi
import javax.servlet.annotation.WebServlet
import javax.servlet.http.HttpServlet
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

@WebServlet(value = ["/queryCurrentTermGrades"], name = "QueryCurrentTermGradesServlet")
class QueryCurrentTermGrades : HttpServlet() {
    override fun doPost(req: HttpServletRequest?, resp: HttpServletResponse?) {
        val studentNumber = req!!.getParameter("stu-num")

        if (req.getParameter("agreement").isNullOrEmpty()) {
            req.session.setAttribute("errorMessage", "您必须同意条款才能继续！")
            resp!!.sendRedirect(req.contextPath + "/index.jsp")
            return
        }

        if (studentNumber.isNullOrBlank()) {
//            addErrorMsgReturn(req, resp, "请输入学号!")
            req.session.setAttribute("errorMessage", "请输入学号!")
            resp!!.sendRedirect(req.contextPath + "/index.jsp")
            return
        } else if (studentNumber!!.length != 10) {
//            addErrorMsgReturn(req, resp, "输入学号不正确！")
            req.session.setAttribute("errorMessage", "输入学号格式不正确！")
            resp!!.sendRedirect(req.contextPath + "/index.jsp")
            return
        }

        req.session.setAttribute("studentNumber", studentNumber)

        val service = MURPNewsService().murpNewsServiceSoap12

        val student: Murpcustomi = try {
            service.searchUser(studentNumber, null, null).userinfo.murpcustomi[0]
        } catch (e: IllegalStateException) {
            req.session.setAttribute("errorMessage", "查无此人")
            resp!!.sendRedirect(req.contextPath + "/index.jsp")
            return
        }
        val grades = service.mark(student.mcid.toInt()).publicStruct
        req.session.setAttribute("grades", grades)
        resp!!.sendRedirect(req.contextPath + "/index.jsp")
    }

    override fun doGet(req: HttpServletRequest?, resp: HttpServletResponse?) {
        doPost(req, resp)
    }
}