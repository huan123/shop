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
                //是普通文本表单字段true，文件表单字段false
                if (!item.isFormField()){
                    //获取文件名
                    String upname = item.getName();
                    //获取文件后缀名再加上一个随机生成的文件名
                    String savename = Tool.getId(16)+ upname.substring(upname.lastIndexOf("."));
                    //图片保存到工程
                    String path = this.getServletContext().getRealPath("/upload");

                    //定位文件(file就代表硬盘上的文件对象)
                    File file = new File(path);

                    //看一下文件是否存在
                    if (!file.exists()){
                        file.mkdir();//建立一个文件夹
                    }
                    //将上传的文件内容保存到本地文件系统中
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
