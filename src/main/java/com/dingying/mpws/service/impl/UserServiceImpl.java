package com.dingying.mpws.service.impl;

import com.dingying.mpws.base.BaseDao;
import com.dingying.mpws.base.BaseServiceImpl;
import com.dingying.mpws.dao.UserMapper;
import com.dingying.mpws.po.User;
import com.dingying.mpws.service.UserService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public BaseDao<User> getMapper() {
        return userMapper;
    }

}
