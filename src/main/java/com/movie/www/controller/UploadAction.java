package com.movie.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

@Controller
@RequestMapping("/upload")
public class UploadAction {

    @RequestMapping(value = "/upload",method = RequestMethod.POST)
    public String upload(HttpServletRequest request){
        long startTime = System.currentTimeMillis();
        //将当前上下文初始化给CommonsMultipartResolver解析器
        CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(request.getServletContext());
        //检查form中是否类型为enctype="multipart/form-data";
        if(multipartResolver.isMultipart(request)){
            //将request变为MultipartHttpServletRequest
            MultipartHttpServletRequest multipartHttpServletRequest=(MultipartHttpServletRequest) request;
            //获得multipartHttpServletRequest中所有文件名
            Iterator<String> iterator=multipartHttpServletRequest.getFileNames();
            while (iterator.hasNext()){
                String fileName = iterator.next();
                //获得上传文件
                MultipartFile multipartFile= multipartHttpServletRequest.getFile(fileName);
                if(multipartFile!=null&&multipartFile.getSize()>0){
                    //设置目标文件

                    request.setAttribute("fileName",multipartFile.getOriginalFilename());
                    File destFile = new File("C:\\Users\\Administrator\\IdeaProjects\\movie\\src\\main\\webapp\\imgs\\movie\\"+multipartFile.getOriginalFilename());
                    try {
                        //进行上传
                        multipartFile.transferTo(destFile);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        long endTime = System.currentTimeMillis();
        System.out.println("使用时间："+(endTime-startTime)+"ms");
        return "basicInfo";
    }


}
