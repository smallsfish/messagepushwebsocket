package com.dingying.mpws.controller;

import com.dingying.mpws.po.User;
import com.dingying.mpws.service.UserService;
import com.dingying.mpws.service.PasswordHelper;
import com.dingying.mpws.utils.ServerResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.session.Session;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@RequestMapping("system")
@Scope("prototype")
@Controller
public class UserController {

    @Resource
    private PasswordHelper passwordHelper;

    @Resource
    private UserService userService;

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String getLogin() {
        return "login";
    }

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String getIndex() {
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse doLogin(User user) {
        if (user.getAccount().isEmpty()) {
            return ServerResponse.createByErrorMessage("不要皮，请输入用户名！");
        }
        if (user.getPassword().isEmpty()) {
            return ServerResponse.createByErrorMessage("不要皮，请输入密码");
        }
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(user.getAccount(), user.getPassword());
        try {
            SecurityUtils.getSubject().login(usernamePasswordToken);
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            return ServerResponse.createByErrorMessage("账号或密码错误");
        } catch (IncorrectCredentialsException e) {
            return ServerResponse.createByErrorMessage("账号或密码错误");
        } catch (LockedAccountException e) {
            return ServerResponse.createByErrorMessage("对不起，账号已锁定");
        } catch (ExcessiveAttemptsException e) {
            return ServerResponse.createByErrorMessage("重试次数过多，已锁定");
        }
        User u= (User) SecurityUtils.getSubject().getPrincipal();
        SecurityUtils.getSubject().getSession(true).setAttribute("currentSystemUser",u);
        return ServerResponse.createBySuccessMessage("登录成功");
    }

    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse addUser(User user) {
        passwordHelper.encryptPassword(user);
        userService.save(user);
        return ServerResponse.createBySuccessMessage("用户添加成功");
    }

    @RequestMapping(value = "exit",method = RequestMethod.GET)
    @ResponseBody
    public ServerResponse exit(){
        SecurityUtils.getSubject().logout();
        Session session=SecurityUtils.getSubject().getSession(true);
        User u= (User) session.getAttribute("currentSystemUser");
        if(u!=null){
            session.removeAttribute(u);
        }
        return ServerResponse.createBySuccessMessage("已退出系统");
    }

}
