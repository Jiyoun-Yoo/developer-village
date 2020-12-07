package com.devil.service;

import java.util.Map;
import com.devil.dao.BookmarkDao;
import com.devil.domain.Bookmark;

public class DefaultBookmarkService implements BookmarkService {
  BookmarkDao bookmarkDao;

  public DefaultBookmarkService(BookmarkDao bookmarkDao) {
    this.bookmarkDao = bookmarkDao;
  }

  @Override
  public int add(Bookmark bookmark) throws Exception {
    return bookmarkDao.insert(bookmark);
  }

  @Override
  public Bookmark get(Map<String, Object> map) throws Exception {
    return bookmarkDao.findByUserArticle(map);
  }

  @Override
  public int delete(Bookmark bookmark) throws Exception {
    return bookmarkDao.insert(bookmark);
  }
}
