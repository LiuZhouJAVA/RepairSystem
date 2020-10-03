package cn.itcast.annotationExa;

/*
*
* 自定义注解的作用：用来描述需要执行的类名与方法名。
* */

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
public @interface Pro {
    String classname();
    String methodname();
}
