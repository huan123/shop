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
        System.out.println("�������û���");
        String name = scanner.next();
        String pwd = null;
        while (true)
        {
            System.out.println("����������");
             pwd = scanner.next();
            System.out.println("���ٴ���������");
            String pwd1 = scanner.next();

            if (pwd.equals(pwd1))
            {
                break;
            }
            else {
                System.out.println("�������벻��ͬ������������");
            }
        }
        User user = new User();
        user.setUserName(name);
        user.setUserPwd(pwd);
        Userservice userservice = new Userservice();
        boolean rel = userservice.doRegist(user);
        if (rel)
        {
            System.out.println("ע��ɹ�");
            init();
        }
        else
        {
            System.out.println("ע��ʧ��");
            init();
        }

    }


    int count=3;
    public User login()
    {
        Scanner scanner = new Scanner(System.in);
        System.out.println("�������û���");
        String name = scanner.next();
        System.out.println("����������");
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
                System.out.println("������������̫��");
                init();
                System.exit(0);
            }
            System.out.println("��¼ʧ��,������"+count+"�λ���");
            login();

        }
        else {
            System.out.println("��ӭ"+user.getUserName());
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

            System.out.println("�û�����" + user1.getUserName() + " ���룺" + user1.getUserPwd());

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
                System.out.println("���ǵ�һҳ");
            }
            boolean isFlag = true;

            for (User user1:list)
            {
                if (user1.getUserName()==null)
                {
                    isFlag = false;
                    System.out.println("��һҳ�Ѿ������һҳ��");

                }
                System.out.println("�û�����" + user1.getUserName() + " ���룺" + user1.getUserPwd());
                count++;
            }
            if (count==0)
            {
                System.out.println("�Ѿ������һҳ�");
            }

            System.out.println("��һҳ��������1,��һҳ������2");
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
                System.out.println("����������ݲ���ȷ������������");
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
        System.out.println("��Ϣ���£�");
        System.out.println("-------------------");
        List<User> users = userservice.getUsers(curPage,pageSize);

        System.out.println("���\t����\t");
        for (User user:users)
        {
            System.out.println(user.getUserId()+"\t"+user.getUserName());
        }

        int maxPage = userservice.getMaxPage(pageSize);
        System.out.println("��"+curPage+"ҳ����"+maxPage+"ҳ����һҳ������p,��һҳ������n");

        String s = scanner.next();
        if ("p".equals(s))
        {
            curPage = curPage- 1 <1 ? 1:curPage-1;
        }
        else if ("n".equals(s))
        {
           curPage = curPage + 1 >maxPage ? maxPage:curPage+1;
        }else {
            System.out.println("�����ʽ����ȷ");
        }
        showInfo();

    }

    public void init()
    {
        System.out.println("***************************");
        System.out.println("******��ӭʹ�ñ�ϵͳ********");
        System.out.println("******1.ע��***************");
        System.out.println("******2.��¼***************");
        System.out.println("******3.��ȡ�����û�********");
        System.out.println("******4.��ҳ��ѯ�û���Ϣ*****");

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
            System.out.println("���������������ȷ����");
            init();
        }
    }


}
