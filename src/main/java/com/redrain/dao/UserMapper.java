package com.redrain.dao;

import java.util.List;

import com.redrain.model.Info;
import com.redrain.model.User;

public interface UserMapper {
    int deleteByPrimaryKey(String userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectByUserName(String userName);
    
    List<User> selectList(User record);
    
    List<User> selectCount(User record);
    
    int deleteAllUser();
}