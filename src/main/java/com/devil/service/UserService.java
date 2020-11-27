package com.devil.service;

import java.util.List;
import com.devil.domain.User;

public interface UserService {
  List<User> list (String keyword) throws Exception;
  User get(int no) throws Exception;
  int add(User user) throws Exception;
}
