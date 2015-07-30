package edu.servlet;

import edu.test.tool.Tool;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.security.UnresolvedPermission;
import java.util.List;

/**
 * Created by huan on 2015/7/23 0023.
 */
public class UpServlet extends HttpServlet {
    public void doGet(HttpServletRequest request,HttpServletResponse response){

        doGet(request,response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response){
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload   upload = new ServletFileUpload(factory);
        try {
            List<FileItem> list = upload.parseRequest(request);

            for (FileItem item:list){
                //����ͨ�ı����ֶ�true���ļ����ֶ�false
                if (!item.isFormField()){
                    //��ȡ�ļ���
                    String upname = item.getName();
                    //��ȡ�ļ���׺���ټ���һ��������ɵ��ļ���
                    String savename = Tool.getId(16)+ upname.substring(upname.lastIndexOf("."));
                    //ͼƬ���浽����
                    String path = this.getServletContext().getRealPath("/upload");

                    //��λ�ļ�(file�ʹ���Ӳ���ϵ��ļ�����)
                    File file = new File(path);

                    //��һ���ļ��Ƿ����
                    if (!file.exists()){
                        file.mkdir();//����һ���ļ���
                    }
                    //���ϴ����ļ����ݱ��浽�����ļ�ϵͳ��
                    item.write(new File(path+"/"+savename));
                    request.setAttribute("upname",savename);
                    System.out.println(file.getAbsolutePath());
                }
            }
            request.getRequestDispatcher("/back/up.jsp").forward(request,response);
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
