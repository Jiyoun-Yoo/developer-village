package com.devil.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.devil.domain.Badge;
import com.devil.service.BadgeService;

@WebServlet("/badge/list")
public class BadgeListServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    ServletContext ctx = request.getServletContext();
    BadgeService badgeService = (BadgeService) ctx.getAttribute("badgeService");

    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();
    out.println("<!DOCTYPE html>");
    out.println("<html>");
    out.println("<head><title>뱃지목록</title>");
    out.println("<link rel=\"stylesheet\" type=\"text/css\" href='../style.css'></head>");
    out.println("<body>");

    try {
      out.println("<h1>뱃지 목록</h1>");
      out.println("<button type='button' onclick=\"location.href='form.html'\">뱃지 추가</button>");

      List<Badge> list = badgeService.list(null);
      
      out.println("<table border='1'>");
      out.println("<thead>");
      out.println("<tr>" // table row
          + "<th>번호</th>" // table header
          + "<th>뱃지이름</th>" + "<th>뱃지사진</th>" + "<th>태그색</th>" + "<th>미리보기</th>" + "</tr>");
      out.println("</thead>");
      out.println("<tbody>");
      
      for (Badge badge : list) {
        out.printf(
            "<tr>"
        + "<td>%d</td>"
        + "<td id=\"title\"><a href='detail?no=%1$d' style='color:white;'>%s</a></td>"
        + "<td><img style=\"width:80px\" src=\"../upload/badge/%s\"</td>"
        + "<td>#%s</td>"
        + "<td><span id=\"color\" style=\"background-color:#%s;\">#%s</span></td>"
        + "</tr>\n",
            badge.getNo(),
            badge.getName(),
            badge.getPhoto(),
            badge.getName());
      }
      out.println("</tbody>");
      out.println("</table>");

    } catch (Exception e) {
      out.printf("<p>작업 처리 중 오류 발생! - %s</p>\n", e.getMessage());

      StringWriter errOut = new StringWriter();
      e.printStackTrace(new PrintWriter(errOut));

      out.printf("<pre>%s</pre>\n", errOut.toString());
    }
    out.println("</body>");
    out.println("</html>");
  }

}