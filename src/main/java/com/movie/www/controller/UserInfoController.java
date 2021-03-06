package com.movie.www.controller;

import com.movie.www.bean.BootPageBean;
import com.movie.www.bean.MyResponseBody;
import com.movie.www.entity.UserInfo;
import com.movie.www.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserInfoController {
    @Autowired
    private UserInfoService userInfoService;
    @RequestMapping("/findUserInfoByUid")
    @ResponseBody
    public MyResponseBody findUserInfoByUid(int uId){
        List<UserInfo> list=userInfoService.findUserInfoByUid(uId);
        MyResponseBody myResponeBody=new MyResponseBody();
        myResponeBody.setCode(200);
        myResponeBody.setData(list);
        return myResponeBody;
    }


    @RequestMapping("/updateUserInfoByUid")
    @ResponseBody
    public MyResponseBody updateUserInfoByUid(UserInfo userInfo, HttpSession session, HttpServletRequest request){
        MyResponseBody myResponeBody=new MyResponseBody();
        int uId= (int) session.getAttribute("uId");
        String portrait=(String) session.getAttribute("portrait");
        session.setAttribute("touxiang",portrait);
        //String portrait= (String) request.getAttribute("fileName");
        userInfo.setPortrait(portrait);
        userInfo.setuId(uId);
        int n=userInfoService.updateUserInfoByUid(userInfo);
        if (n>0){
            myResponeBody.setCode(200);
            myResponeBody.setMsg("修改成功!");
        }else {
            myResponeBody.setCode(-1);
            myResponeBody.setMsg("修改失败!");
        }
        return myResponeBody;
    }


    @RequestMapping("/getPageList")
    @ResponseBody
    public BootPageBean<UserInfo> getAllByPage(int offset, int limit, UserInfo userInfo) {
        System.out.println( "查询参数" + userInfo );
        //调用业务逻辑
        List<UserInfo> list = userInfoService.findListByPage( offset, limit, userInfo );
        int total = userInfoService.findCount( userInfo );
        BootPageBean bootPageBean = new BootPageBean();
        bootPageBean.setTotal( total );
        bootPageBean.setRows( list );
        return bootPageBean;
    }
    //增加用户
    @RequestMapping("/getAddUser")
    @ResponseBody
    public MyResponseBody addUser(UserInfo userInfo){

        int n= userInfoService.addUser(userInfo);
        MyResponseBody myResponseBody=new MyResponseBody();
        if(n>0){
            myResponseBody.setCode( 200 );
            myResponseBody.setMsg( "添加成功" );
        }else {
            myResponseBody.setCode( -1 );
            myResponseBody.setMsg( "添加失败" );
        }
        return myResponseBody;
    }
    //修改用户信息
    @RequestMapping("/getUpdateUser")
    @ResponseBody
    public MyResponseBody updateUser(UserInfo userInfo){
        int n= userInfoService.updateUser(userInfo);
        MyResponseBody myResponseBody=new MyResponseBody();
        if(n>0){
            myResponseBody.setCode( 200 );
            myResponseBody.setMsg( "修改成功" );
        }else {
            myResponseBody.setCode( -1 );
            myResponseBody.setMsg( "修改失败" );
        }
        return myResponseBody;
    }

    //删除用户
    @RequestMapping("/getDeleteUser")
    @ResponseBody
    public MyResponseBody deleteUser(int uId) {
        int n = userInfoService.deleteUser( uId );
        MyResponseBody myResponseBody = new MyResponseBody();
        if (n > 0) {
            myResponseBody.setCode( 200 );
            myResponseBody.setMsg( "删除成功" );
        } else {
            myResponseBody.setCode( -1 );
            myResponseBody.setMsg( "删除失败" );
        }
        return myResponseBody;
    }
}
