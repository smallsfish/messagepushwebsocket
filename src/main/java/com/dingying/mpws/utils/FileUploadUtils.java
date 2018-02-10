package com.dingying.mpws.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;


public class FileUploadUtils {

	public interface OnFileUploadListener{
		void onProgress(Long curr);
		void onSuccess(String msg);
		void onError(String msg);
	}

	public static boolean uploadSingleFile(String path,String fileName,InputStream in) {
		FileOutputStream out = null;
		File file= new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		boolean b;
		try {
			out=new FileOutputStream(path+"/"+fileName);
			byte[] bt=new byte[1024];
			int len=0;
			while((len=in.read(bt))!=-1) {
				out.write(bt,0,len);
			}
			b=true;
		} catch (Exception e) {
			e.printStackTrace();
			b=false;
		}finally {
			closeStream(in, out);
		}
		return b;
	}

	public static void uploadSingleFileOnProgress(String path,String fileName,InputStream in,OnFileUploadListener listener) {
		FileOutputStream out = null;
		File file= new File(path);
		if(!file.exists()){
			file.mkdirs();
		}
		try {
			out=new FileOutputStream(path+"/"+fileName);
			byte[] bt=new byte[1024];
			int len;
			Long curr=0L;
			while((len=in.read(bt))!=-1) {
				curr+=len;
				if(listener!=null) {
					listener.onProgress(curr);
				}
				out.write(bt,0,len);
			}
			listener.onSuccess("上传成功");
		} catch (Exception e) {
			e.printStackTrace();
			if(listener!=null) listener.onError(e.toString());
		}finally {
			closeStream(in, out);
		}
	}

	private static void closeStream(InputStream in, FileOutputStream out) {
		try {
            if(in!=null)
                in.close();
            if(out!=null)
                out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
