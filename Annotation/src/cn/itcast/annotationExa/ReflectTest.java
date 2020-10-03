package cn.itcast.annotationExa;

import java.lang.reflect.Method;

@Pro(classname = "cn.itcast.annotationExa.Demo1",methodname = "show")
public class ReflectTest {
    public static void main(String[] args) throws Exception {
        //1.解析注解
//        获取本类的字节码文件
        Class<ReflectTest> reflectTestClass=ReflectTest.class;
//      获取上边的注解对象
        Pro an=reflectTestClass.getAnnotation(Pro.class);
//        调用注解的抽象方法
        String classname=an.classname();
        String methodname=an.methodname();

        System.out.println(classname);
        System.out.println(methodname);

//        反射：
        Class cls=Class.forName(classname);
//        创建对象
        Object obj=cls.newInstance();
//        获取方法
        Method method1=cls.getMethod(methodname);
//        调用方法
        method1.invoke(obj);


    }
}
