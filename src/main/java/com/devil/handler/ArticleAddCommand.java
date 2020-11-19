package com.devil.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import com.devil.dao.ArticleDao;
import com.devil.domain.Article;
import com.devil.util.Prompt;

public class ArticleAddCommand implements Command {

  ArticleDao articleDao;

  public ArticleAddCommand(ArticleDao articleDao) {
    this.articleDao = articleDao;
  }

  @Override
  public void execute(Map<String,Object> context) {
    System.out.println("[게시글 등록]");
    Article article = new Article();

    article.setTitle(Prompt.inputString("제목? "));
    article.setContent(Prompt.inputString("내용? "));
    article.setContent(Prompt.inputString("회원번호? "));
    article.setEndDate(Prompt.inputString("날짜? " ));

    article.setNo(i + 1);
    article.setTitle(titles.get(i).attr("title"));
    article.setWriter(2);
    article.setEndDate(parseDate(dates.get(i).text()));
    article.setContent("http://www.saramin.co.kr" + titles.get(i).attr("href"));
    article.setCategoryNo(3);
    //article.setCompany(companyName.get(i).attr("title"));
    articleDao.insert(article);


  } catch(Exception e) {
    e.printStackTrace();
  }


  public String parseDate(String rawDate) {
    if (!rawDate.split(" ")[0].equals("~")) {
      return "1996-09-02";
    }
    return "2020-" + rawDate.split(" ")[1].split("\\(")[0].replace("/", "-");
  }
}