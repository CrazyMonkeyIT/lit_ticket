package cn.zjtx.report.base.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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
    //根据行解析还是列解析(表格型Excel可能第一整列是头也有可能第一整行是头)
    private static boolean isRowParse = true;

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


    /**
     * 从行着手解析Excel
     * @param excel  文件
     * @param properties 要解析到bean的字段
     * @param clazzs 要解析到哪个bean
     * @param <T> bean泛型
     * @return
     * @throws Exception
     */
    public static <T> Map<String,List<T>> parseExcelForRow(File excel, String[] properties,
                                                               Class<T> [] clazzs) throws Exception {
        Workbook wb = getWorkbook(excel);
        return parseExcel(wb,properties,clazzs,isRowParse);
    }

    /**
     * 从列着手解析
     * @param excel  文件
     * @param properties 要解析到bean的字段
     * @param clazzs 要解析到哪个bean
     * @param <T> bean泛型
     * @return
     * @throws Exception
     */
    public static <T> Map<String,List<T>> parseExcelForCell(File excel, String[] properties,
                                                           Class<T> [] clazzs) throws Exception {

        isRowParse = false;
        Workbook wb = getWorkbook(excel);
        return parseExcel(wb,properties,clazzs,isRowParse);
    }

    private static <T> Map<String,List<T>> parseExcel(Workbook workbook,String[] properties,
                                                               Class<T> [] beanClazzs,boolean isRowParse) throws Exception {

        Map<String,List<T>> map = new HashMap<String, List<T>>();
        try {
            for (int i = 0; i < workbook.getNumberOfSheets(); i++) {

                Class cls = beanClazzs[i];

                Method[] methods = getMethods(properties, cls, cls.getDeclaredFields());

                Sheet sheet = workbook.getSheetAt(i);

                //得到Excel的行数
                totalRows = sheet.getPhysicalNumberOfRows();

                //得到Excel的列数(前提是有行数)
                if (totalRows >= 1 && sheet.getRow(0) != null) {
                    totalCells = sheet.getRow(0).getLastCellNum();
                }
                List<T> parseResultList = new ArrayList<T>();

                if(isRowParse)
                    parseCellToObjectByRow(beanClazzs[i], methods, sheet, parseResultList);
                else
                    parseCellToObjectByCell(beanClazzs[i], methods, sheet, parseResultList);

                map.put(cls.getSimpleName(),parseResultList);
            }
        } catch (Exception e) {
            e.getStackTrace();
        }finally {
            workbook.close();
        }
        return map;
    }

    private static <T> void parseCellToObjectByCell(Class<T> beanClazz, Method[] methods,
                                                   Sheet sheet, List<T> parseResultList) throws Exception {
        for (int r = 0; r < 1; r++) {
            Row row = sheet.getRow(r);
            if (row == null) continue;
            for (int c = 1; c < totalCells; c++) {
                T instance = beanClazz.newInstance();
                for(int d = 0;d < totalRows;d++){
                    Row currRow = sheet.getRow(d);
                    Cell currCell = currRow.getCell(c);
                    Method setMethod = methods[d];
                    Class<?> type = setMethod.getParameterTypes()[0];
                    if (null != setMethod) {
                        invokeSetterMethod(setMethod, instance, currCell, type);
                    }
                }
                parseResultList.add(instance);
            }
        }
    }

    private static <T> void parseCellToObjectByRow(Class<T> beanClazz, Method[] methods,
                                              Sheet sheet, List<T> parseResultList) throws Exception {

        for (int r = 1; r < totalRows; r++) {
            Row row = sheet.getRow(r);
            if (row == null) continue;
            T instance = beanClazz.newInstance();
            for (int c = 0; c < totalCells; c++) {
                Cell cell = row.getCell(c);
                Method setMethod = methods[cell.getColumnIndex()];
                Class<?> type = setMethod.getParameterTypes()[0];
                if (null != setMethod) {
                    invokeSetterMethod(setMethod, instance, cell, type);
                }
            }
            parseResultList.add(instance);
        }

    }

    private static Method[] getMethods(String[] properties, Class cls, Field[] fields)
                                                                            throws NoSuchMethodException {

        List<String> list = new ArrayList<String>();
        for(Field field : fields){
            list.add(field.getName());
        }
        Method[] methods = new Method[properties.length];
        for (int m = 0;m < properties.length; m++){
            String fieldName = properties[m];
            if(StringUtils.isEmpty(fieldName)){
                throw new IllegalArgumentException("properties is required");
            }
            int fieldIndex = list.indexOf(fieldName);
            if(fieldIndex < 0 ){
                throw new IllegalArgumentException("there's no matching field");
            }
            Field field = fields[fieldIndex];
            Class type = field.getType();
            Method method = cls.getDeclaredMethod(
                    "set" + fieldName.substring(0,1).toUpperCase()+ fieldName.substring(1),type);
            methods[m] = method;
        }
        return methods;
    }

    private static void invokeSetterMethod(Method setterMethod, Object o, Cell cell,
                                           Class<?> paramType) throws Exception  {
        try {
            setterMethod.invoke(o, getCellValue(cell,paramType));

        } catch (IllegalArgumentException e) {
            throw new Exception("setter方法" + setterMethod.getName() + "需要参数的类型为" +
                    setterMethod.getParameterTypes()[0].getName() +
                    ", 传入的类型为" + paramType.getName(), e);
        }
    }

    private static Object getCellValue(Cell cell,Class<?> t) throws Exception{
        Object obj;
        if(cell.getCellTypeEnum() == CellType.STRING){
            obj = cell.getStringCellValue();
        }else if(cell.getCellTypeEnum() == CellType.NUMERIC){
            obj = cell.getNumericCellValue();
        }else if(cell.getCellTypeEnum() == CellType.BOOLEAN){
            obj = cell.getBooleanCellValue();
        }else if((Object)t instanceof Date){
            obj = cell.getDateCellValue();
        }else if(cell.getCellTypeEnum() == CellType._NONE || cell.getCellTypeEnum() == CellType.BLANK){
            obj = null;
        }else{
            throw new IllegalArgumentException("unknow cell type");
        }
        return (t.cast(obj));
    }

    private static Workbook getWorkbook(File excel) throws IOException {
        Workbook wb = null;
        InputStream is = new FileInputStream(excel);
        if (isExcel2003(excel.getPath())) {
            wb = new HSSFWorkbook(is);
        } else {
            wb = new XSSFWorkbook(is);
        }
        return wb;
    }

    public static void main(String[] args) {
        File file = new File(Thread.currentThread().getContextClassLoader().getResource("1.xlsx").getPath());
        try {
            Map<String,List<?>> result = parseExcelForCell(file,new String[]{"date","name","age"},new Class[]{B.class});

            for(Map.Entry<String, List<?>> entry : result.entrySet()){
                System.out.println(entry.getKey());
                for(Object obj : entry.getValue()){
//                    if(obj instanceof A){
//                        A a = (A)obj;
//                        System.out.println(a.getId());
//                        System.out.println(a.getName());
//                    }else if(obj instanceof B){
                        B b = (B)obj;
                        System.out.println(b.getDate());
                        System.out.println(b.getName());
                        System.out.println(b.getAge());
//                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
