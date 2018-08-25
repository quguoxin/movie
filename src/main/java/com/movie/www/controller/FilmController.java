package com.movie.www.controller;

import com.movie.www.bean.BootPageBean;
import com.movie.www.bean.MyResponseBody;
import com.movie.www.bean.PageBean;
import com.movie.www.entity.Film;
import com.movie.www.service.FilmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/film")
public class FilmController {
    @Autowired
    private FilmService filmService;
    @RequestMapping(value = ("/findAll"))
    @ResponseBody
    public MyResponseBody findFilmByParams(int pageNo, int pageSize, Film film){
        List<Film> list=filmService.findFilmByParams(pageNo,pageSize,film);
        int totalCount=filmService.findCount(film);
        int totalPage = (totalCount % pageSize == 0) ? (totalCount / pageSize) : ((totalCount / pageSize) + 1);
        MyResponseBody myResponeBody=new MyResponseBody();
        PageBean<Film> pageBean=new PageBean<Film>(pageNo,pageSize,totalPage,totalCount,list);
        myResponeBody.setCode(200);
        myResponeBody.setData(pageBean);

        return myResponeBody;
    }
    @RequestMapping(value = ("/findCount"))
    @ResponseBody
    public int findCount(Film film){
        return filmService.findCount(film);
    }

    //前台页面显示电影详情
    @RequestMapping(value = "/findOneFilm")
    @ResponseBody
    public MyResponseBody findFilmById(int fId){
        List<Film> list=filmService.findFilmById(fId);
        MyResponseBody myResponeBody=new MyResponseBody();
        myResponeBody.setCode(200);
        myResponeBody.setData(list);
        return myResponeBody;
    }


    @RequestMapping("/getAllPage")
    @ResponseBody
    public BootPageBean<Film> getAllPage(int offset, int limit,Film film){
        //调用业务
        List<Film> list = filmService.findListByPage( offset,limit,film);
        int total = filmService.findCountForAdmin(film);
        BootPageBean bootPageBean = new BootPageBean();
        bootPageBean.setTotal( total );
        bootPageBean.setRows( list );
        return bootPageBean;

    }
    //增加
    @RequestMapping("/getAddFilm")
    @ResponseBody
    public MyResponseBody addFilm(Film film){
        int n= filmService.addFilm(film);
        MyResponseBody myResponseBody=new MyResponseBody();
        if(n>0){
            myResponseBody.setCode( 200 );
            myResponseBody.setMsg( "添加电影成功" );
        }else {
            myResponseBody.setCode( -1 );
            myResponseBody.setMsg( "添加电影失败" );
        }
        return myResponseBody;
    }
    //修改
    @RequestMapping("/getUpdateFilm")
    @ResponseBody
    public MyResponseBody updateFilm(Film film){
        int n=filmService.updateFilm(film);
        MyResponseBody myResponseBody=new MyResponseBody();
        if(n>0){
            myResponseBody.setCode( 200 );
            myResponseBody.setMsg( "修改电影成功" );
        }else {
            myResponseBody.setCode( -1 );
            myResponseBody.setMsg( "修改电影失败" );
        }
        return myResponseBody;
    }
    //删除
    @RequestMapping("/getDeleteFilm")
    @ResponseBody
    public MyResponseBody deleteFilm(int fId) {
        int n = filmService.deleteFilm( fId );
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
