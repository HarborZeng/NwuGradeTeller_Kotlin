package cn.tellyouwhat.web.filter

import javax.servlet.*
import javax.servlet.annotation.WebFilter

@WebFilter(value = ["/*"], filterName = "EncodingFilter")
class EncodeFilter : Filter {
    override fun destroy() {}

    override fun doFilter(request: ServletRequest?, response: ServletResponse?, chain: FilterChain?) {
        request?.characterEncoding = "utf-8"
        response?.characterEncoding = "utf-8"
        chain?.doFilter(request, response)
    }

    override fun init(filterConfig: FilterConfig?) {}
}