package cn.zjtx.report.base.util;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.*;


/**
 *
 * @author Bill
 * 参考文献 http://blog.csdn.net/zhyh1986/article/details/8511186
 * 该文献使用apache.jxi实现
 * 本工具类为了兼容2003根2007以上excel使用apache.poi完成
 *
 * ExcelUtil.parseExcel(File excel, Class<T> [] clazzs) 实现将excel中多sheet页映射值到指定class<T>[]中
 *
 * TODO 作为一个工具类，暂时只完成了解析层，后续将维护成支持bean->excel层的展示
 */
public class ExcelUtil {

    //总行数
    private static int totalRows = 0;
    //总条数
    private static int totalCells = 0;

    //判断是否为excel文件
    public static boolean validateExcel(String filePath) {
        if (filePath == null || !(isExcel2003(filePath) || isExcel2007(filePath))) {
            return false;
        }
        return true;
    }

    //是否是2003的excel，返回true是2003
    public static boolean isExcel2003(String filePath) {
        return filePath.matches("^.+\\.(?i)(xls)$");
    }

    //是否是2007的excel，返回true是2007
    public static boolean isExcel2007(String filePath) {
        return filePath.matches("^.+\\.(?i)(xlsx)$");
    }


    public static <T> Map<String,List<T>> parseExcel(File excel, Class<T> [] clazzs) throws Exception {
        Workbook wb = null;
        InputStream is = new FileInputStream(excel);
        if (isExcel2003(excel.getPath())) {
            wb = new HSSFWorkbook(is);
        } else {//当excel是2007时
            wb = new XSSFWorkbook(is);
        }

        return parseExcel(wb,clazzs);
    }

    private static <T> Map<String,List<T>> parseExcel(Workbook workbook, Class<T> [] beanClazzs) throws Exception {

        Map<String,List<T>> map = new HashMap<String, List<T>>();

        for (int i = 0; i < workbook.getNumberOfSheets(); i++) {//获取每个Sheet表
            Class cls = beanClazzs[i];
            Field[] fields = beanClazzs[i].getDeclaredFields();
            Method[] methods = new Method[fields.length];
            for (int m = 0;m < fields.length; m++){
                String fieldName = fields[m].getName();
                Class type = fields[m].getType();
                Method method = cls.getDeclaredMethod(
                        "set" + fieldName.substring(0,1).toUpperCase()+ fieldName.substring(1),type);
                methods[m] = method;
            }
            Sheet sheet = workbook.getSheetAt(i);
            //得到Excel的行数
            totalRows = sheet.getPhysicalNumberOfRows();
            //得到Excel的列数(前提是有行数)
            if (totalRows >= 1 && sheet.getRow(0) != null) {
                totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
            }
            List<T> parseResultList = new ArrayList<T>();
            for (int r = 1; r < totalRows; r++) {
                Row row = sheet.getRow(r);
                if (row == null) continue;
                T instance = beanClazzs[i].newInstance();    // 创建实例
                //循环Excel的列
                for (int c = 0; c < totalCells; c++) {
                    Cell cell = row.getCell(c);
                    Method setMethod = methods[cell.getColumnIndex()];
                    Class<?> type = setMethod.getParameterTypes()[0];
                    if (null != setMethod) {
                        // 调用新创建实例的setter
                        invokeSetterMethod(setMethod, instance, cell, type);
                    }
                }
                parseResultList.add(instance);
            }
            workbook.close();
            map.put(beanClazzs[i].getSimpleName(),parseResultList);

        }

        return map;
    }

    private static void invokeSetterMethod(Method setterMethod, Object o, Cell cell,
                                           Class<?> paramType) throws Exception  {
        try {
            if (String.class.isAssignableFrom(paramType) || char.class.isAssignableFrom(paramType)
                    || Character.class.isAssignableFrom(paramType)) {
                // String|char|Character设置为String
                setterMethod.invoke(o, cell.getStringCellValue());
            } else if (Double.class.isAssignableFrom(paramType) || double.class.isAssignableFrom(paramType)) {
                Double number = cell.getNumericCellValue();
                setterMethod.invoke(o, number);
            } else if (Integer.class.isAssignableFrom(paramType) || int.class.isAssignableFrom(paramType)) {
                Double number = cell.getNumericCellValue();
                setterMethod.invoke(o, number.intValue());
            } else if (Long.class.isAssignableFrom(paramType) || long.class.isAssignableFrom(paramType)) {
                Double number = cell.getNumericCellValue();
                setterMethod.invoke(o, number.longValue());
            } else if (Float.class.isAssignableFrom(paramType) || float.class.isAssignableFrom(paramType)) {
                Double number = cell.getNumericCellValue();
                setterMethod.invoke(o, number.floatValue());
            } else if (Short.class.isAssignableFrom(paramType) || short.class.isAssignableFrom(paramType)) {
                Double number = cell.getNumericCellValue();
                setterMethod.invoke(o, number.shortValue());
            } else if (Boolean.class.isAssignableFrom(paramType) || boolean.class.isAssignableFrom(paramType)) {
                setterMethod.invoke(o, cell.getBooleanCellValue());
            } else if (Date.class.isAssignableFrom(paramType)) {
                setterMethod.invoke(o, cell.getDateCellValue());
            } else {
                //其他类型设置为null
                setterMethod.invoke(o, new Object [] { null });
            }
        } catch (IllegalArgumentException e) {
            throw new Exception("setter方法" + setterMethod.getName() + "需要参数的类型为" +
                    setterMethod.getParameterTypes()[0].getName() +
                    ", 传入的类型为" + paramType.getName(), e);
        }
    }

    public static void main(String[] args) {
        File file = new File(Thread.currentThread().getContextClassLoader().getResource("1.xlsx").getPath());
        try {
            Map<String,List<?>> result = parseExcel(file,new Class[]{A.class,B.class});

            for(Map.Entry<String, List<?>> entry : result.entrySet()){
                System.out.println(entry.getKey());
                for(Object obj : entry.getValue()){
                    if(obj instanceof A){
                        A a = (A)obj;
                        System.out.println(a.getId());
                        System.out.println(a.getName());
                    }else if(obj instanceof B){
                        B b = (B)obj;
                        System.out.println(b.getSeq());
                        System.out.println(b.getMing());
                        System.out.println(b.getAge());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
