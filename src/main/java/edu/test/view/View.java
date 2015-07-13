package edu.test.view;

import edu.test.dao.UserDao;
import edu.test.service.Userservice;
import edu.test.vo.User;

import java.util.List;
import java.util.Scanner;

/**
 * Created by huan on 2015/7/6 0006.
 */
public class View {

    public static int  page=0;

    public void  regist()
    {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入用户名");
        String name = scanner.next();
        String pwd = null;
        while (true)
        {
            System.out.println("请输入密码");
             pwd = scanner.next();
            System.out.println("请再次输入密码");
            String pwd1 = scanner.next();

            if (pwd.equals(pwd1))
            {
                break;
            }
            else {
                System.out.println("密码输入不相同，请重新输入");
            }
        }
        User user = new User();
        user.setUserName(name);
        user.setUserPwd(pwd);
        Userservice userservice = new Userservice();
        boolean rel = userservice.doRegist(user);
        if (rel)
        {
            System.out.println("注册成功");
            init();
        }
        else
        {
            System.out.println("注册失败");
            init();
        }

    }


    int count=3;
    public User login()
    {
        Scanner scanner = new Scanner(System.in);
        System.out.println("请输入用户名");
        String name = scanner.next();
        System.out.println("请输入密码");
        String pwd = scanner.next();

        UserDao userDao = new UserDao();

        Userservice userservice = new Userservice();
        User user = new User();
        user = userservice.doLogin(name,pwd);
        if(user==null)
        {
            count--;
            if (count==0)
            {
                System.out.println("您输入错误次数太多");
                init();
                System.exit(0);
            }
            System.out.println("登录失败,您还有"+count+"次机会");
            login();

        }
        else {
            System.out.println("欢迎"+user.getUserName());
            init();
        }

        return null;

    }
  //  Userservice userservice = new Userservice();

    public void getAllUserShow()
    {
        List<User> list =  userservice.doGetAllUser();
        Scanner scanner = new Scanner(System.in);

        for (User user1:list)
        {

            System.out.println("用户名：" + user1.getUserName() + " 密码：" + user1.getUserPwd());

        }
        init();
    }

    public void getAllUserFenye()
    {
        List<User> list =  userservice.doGetAllUser();
        Scanner scanner = new Scanner(System.in);

        int count=0;
        while (true)
        {
            if (page==0)
            {
                System.out.println("这是第一页");
            }
            boolean isFlag = true;

            for (User user1:list)
            {
                if (user1.getUserName()==null)
                {
                    isFlag = false;
                    System.out.println("上一页已经是最后一页了");

                }
                System.out.println("用户名：" + user1.getUserName() + " 密码：" + user1.getUserPwd());
                count++;
            }
            if (count==0)
            {
                System.out.println("已经是最后一页喽");
            }

            System.out.println("上一页，请输入1,下一页请输入2");
            int n = scanner.nextInt();
            if (n==1)
            {
                --page;
                getAllUserFenye();

            }
            else if(n==2)
            {
                ++page;
                getAllUserFenye();
            }
            else
            {
                System.out.println("您输入的数据不正确，请重新输入");
            }
            if (isFlag==false)
            {
                break;
            }
        }
        //init();
    }


    int curPage = 1;
    int pageSize = 2;
    Scanner scanner = new Scanner(System.in);

    Userservice userservice = new Userservice();
    public void    showInfo()
    {
        System.out.println("信息如下：");
        System.out.println("-------------------");
        List<User> users = userservice.getUsers(curPage,pageSize);

        System.out.println("编号\t姓名\t");
        for (User user:users)
        {
            System.out.println(user.getUserId()+"\t"+user.getUserName());
        }

        int maxPage = userservice.getMaxPage(pageSize);
        System.out.println("第"+curPage+"页，共"+maxPage+"页，上一页请输入p,下一页请输入n");

        String s = scanner.next();
        if ("p".equals(s))
        {
            curPage = curPage- 1 <1 ? 1:curPage-1;
        }
        else if ("n".equals(s))
        {
           curPage = curPage + 1 >maxPage ? maxPage:curPage+1;
        }else {
            System.out.println("输入格式不正确");
        }
        showInfo();

    }

    public void init()
    {
        System.out.println("***************************");
        System.out.println("******欢迎使用本系统********");
        System.out.println("******1.注册***************");
        System.out.println("******2.登录***************");
        System.out.println("******3.获取所有用户********");
        System.out.println("******4.分页查询用户信息*****");

        Scanner scanner = new Scanner(System.in);
        String opt = scanner.next();
        if (opt.equals("1"))
        {
            regist();
        }
        else if (opt.equals("2"))
        {
            login();
        }
        else if(opt.equals("3"))
        {
            getAllUserShow();
        }
        else if(opt.equals("4"))
        {
            //getAllUserFenye();
           showInfo();
        }
        else {
            System.out.println("您输入的有误，请正确输入");
            init();
        }
    }


}
