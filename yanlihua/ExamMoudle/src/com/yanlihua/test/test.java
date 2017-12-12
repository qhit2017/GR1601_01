package com.yanlihua.test;

import com.yanlihua.bean.*;
import com.yanlihua.controller.StudentsController;
import com.yanlihua.dao.*;
import com.yanlihua.dao.impl.*;
import com.yanlihua.service.LoginService;
import com.yanlihua.service.TeachersService;
import com.yanlihua.service.impl.LoginServiceImpl;
import com.yanlihua.service.impl.TeachersServiceImpl;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 晏利花 on 2017/11/23.
 */
public class test {
    public static void main(String[] args) {
       /* ClassesDao classesDao=new ClassesDaoImpl();
        List<Classes> classesList=classesDao.selectClassByFourConditionClassDao("2016-09-01 00:00:00","高软");
        for (Classes c:classesList){
            System.out.println(c.getCbegin());
            //讲师
            System.out.println(c.getTeachersh().getTid());
            //班主任
            System.out.println( c.getTeachersl().getTid());
        }*/

    /* ClassesDao classesDao=new ClassesDaoImpl();
     Classes classes=classesDao.selectClassesinfoByCidClassesDao(1);
        System.out.println(classes.getCname());*/
        /*StudentsDao studentsDao=new StudentDaoImpl();
        List<Students> studentsList=studentsDao.selectStudentInfoFiveConditionStudentDao("201601","jerry","1","1996-06-06 00:00:00","高软");
        for (Students s:studentsList){
            System.out.println(s.getSdnumber());
            System.out.println(s.getClasses().getCid());
        }*/
        /*PfwrittentestDao pfwrittentestDao=new PfwrittentestDaoImpl();
        List<Questionbank> questionbankList=pfwrittentestDao.selectQuestionbankAllInfoPfwrittentestDao();
        for (Questionbank questionbank:questionbankList){
            Subject subject=questionbank.getSubject();
            System.out.println(subject.getSucourse());
        }*/

        ExamDao examDao = new ExamDaoImpl();
       /* List<Testpaper> testpaperList=examDao.selectTestpaperAllInfoExamDao();
        System.out.println(testpaperList.size());
        for (Testpaper t:testpaperList){
            Set<Grade> gradeSet=t.getGradeSet();
            for (Grade grade:gradeSet){
                System.out.println(grade.getStudents().getClasses().getCid());
                System.out.println(grade.getStudents().getClasses().getCname());
            }
        }*/
//        List<Testpaper> testpaperList1= examDao.selectTestpaperInfoByFiveConditionExamDao(2,"","");
//        for (Testpaper t:testpaperList1){
//            System.out.println(t.getTid());
//        }

      /*  StudentsDao studentsDao=new StudentDaoImpl();
        List<Students> studentsList=studentsDao.selectStudentAllInfoStudentsDao();*/
     /*  String filepath="D:\\students_import1.xlsx";
        try {
            InputStream inputStream=new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook=new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");
            //从sheet中取到row
            //可以的到excel中的最后一行的是多少列 xssfSheet.getLastRowNum();
            System.out.println("xssfSheet.getLastRowNum()"+xssfSheet.getLastRowNum());
            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow=xssfSheet.getRow(i);
                //从row中取到cell
                XSSFCell number=xssfRow.getCell(0);//这取到的只是单元格
                Integer snumber=(int)number.getNumericCellValue();
                XSSFCell classes=xssfRow.getCell(1);
                Integer sclasses=(int)classes.getNumericCellValue();
                XSSFCell name=xssfRow.getCell(2);
                String sname=name.getStringCellValue();
                XSSFCell sex=xssfRow.getCell(3);
                String ssex=sex.getStringCellValue();
                XSSFCell tel=xssfRow.getCell(4);
                Long stel=(long)tel.getNumericCellValue();
                System.out.println(snumber+";"+sclasses+";"+sname+";"+ssex+";"+stel);
                Students students=new Students();
                students.setSnumber(String.valueOf(snumber));

                Classes classes1=new Classes();
                classes1.setCid(sclasses);
                students.setClasses(classes1);

                students.setSname(sname);

                students.setSsex(ssex);

                students.setStel(String.valueOf(stel));
                List<Students> studentsList=new ArrayList<Students>();
                studentsList.add(students);
                StudentsDao studentsDao=new StudentDaoImpl();
                studentsDao.importStudentInfoStudentDao(studentsList);
            }
        }  catch (IOException e) {
            e.printStackTrace();
        }*/



   /*     try {
            String filepath="G:\\examinfo.xlsx";
            InputStream inputStream = new FileInputStream(filepath);
            XSSFWorkbook xssfWorkbook=new XSSFWorkbook(inputStream);
            //从excel取到sheet
            XSSFSheet xssfSheet=xssfWorkbook.getSheet("Sheet1");
            //从sheet中取到row
            //可以得到excel中的最后一行是第几行数据 xssfSheet.getLastRowNum();
            for (int i=1;i<=xssfSheet.getLastRowNum();i++){
                XSSFRow xssfRow=xssfSheet.getRow(i);
                //从row中取到cell
                XSSFCell type=xssfRow.getCell(0);//这取到的只是单元格
                Integer qtype=(int)type.getNumericCellValue();

                XSSFCell content=xssfRow.getCell(1);
                String qcontent=content.getStringCellValue();

                XSSFCell a=xssfRow.getCell(2);
                String qa=a.getStringCellValue();

                XSSFCell b=xssfRow.getCell(3);
                String qb=b.getStringCellValue();

                XSSFCell c=xssfRow.getCell(4);
                String qc=c.getStringCellValue();

                XSSFCell d=xssfRow.getCell(5);
                String qd=d.getStringCellValue();

                XSSFCell answer=xssfRow.getCell(6);
                String qanswer=answer.getStringCellValue();

                XSSFCell difficult=xssfRow.getCell(7);
                String qdifficult=difficult.getStringCellValue();
                System.out.println(qtype+";"+qcontent+";"+qa+";"+qb+";"+qc+";"+qd+";"+qanswer+";"+qdifficult);

            }
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
*/


        //QuestionBankDao questionBankDao=new QuestionBankDaoImpl();
  /* List<Subject> subjectList=questionBankDao.selectSubjectInfoBySudAndSusQuestionDao("高软","G1");

   for (Subject subject:subjectList){
       System.out.println(subject.getSuid());
   }*/

       /* List<Questionbank> questionbankList=questionBankDao.selectSuidNumberInQuestionBankQuestionBankDao(2);
        Integer id=questionbankList.size();
        System.out.println(id);*/
       /* Testpaper testpaper = new Testpaper();
        testpaper.setTtype("笔试");
        Integer[] questionid = {3, 9};
        CreatepaperDao createpaperDao = new CreatepaperDaoImpl();
        createpaperDao.insertTestPareperCreatepaperDao(testpaper, questionid);*/
      /* ClassesDao classesDao=new ClassesDaoImpl();
       Classes c=new Classes();
       c.setCid(4);
       List<Students> studentsSet=classesDao.select(c);
       for (Students students:studentsSet){
           System.out.println(students.getSdnumber());
       }
       Grade grade=new Grade();
       grade.setGscore(0);
       Testpaper testpaper=new Testpaper();
       testpaper.setTstate("考试中");
       examDao.saveinfointogradeExamDao(grade,studentsSet,testpaper);*/
       /* Testpaper testpaper=examDao.updateTestpaperExamDao();
        testpaper.setTstate("考试中");
        System.out.println(testpaper.getTstate());*/
      /* Grade grade=examDao.selectGradeendInfoExamDao();
        System.out.println(grade.getGid());*/
      /*Grade grade=examDao.selectGradeendInfoExamDao();
      Grade grade1=new Grade();
      grade1.setGbegintime(grade.getGbegintime());
      grade1.setGscore(grade.getGscore());
      Testpaper testpaper=new Testpaper();
      testpaper.setTid(12);
      grade1.setTestpaper(testpaper);
      examDao.updateGradeExamDao(grade1);*/

     OnelinetestDao onelinetestDao=new OnelinetestDaoImpl();
     /*  Students students=onelinetestDao.selectStudentInfoOnelinetestDao("jerry1");
      System.out.println(students.getGradeSet());
        System.out.println(students.getClasses().getCnumber());
        System.out.println(students.getClasses());
     List<Testpaper> testpaper=onelinetestDao.selectTestpaperInfolinetestDao(students.getClasses().getCnumber());
        for (Testpaper testpaper1:testpaper){
            System.out.println(testpaper1.getGradeSet().);
        }*/

    /* Testpaper testpaper=onelinetestDao.selectTestpaperInfoByTidOnelinetestDao(7);
     Set<Questionbank> questionbankSet=testpaper.getQuestionbankSet();
     for (Questionbank questionbank:questionbankSet){
         System.out.println(questionbank.getQid());
     }*/
  /*  Testpaper testpaper=examDao.updateTestpaperByTidExamDao(1);
    Set<Grade> gradeSet=testpaper.getGradeSet();
        Grade grade1=new Grade();
    for (Grade grade:gradeSet){
        System.out.println(grade.getGanswer());
        String gbegintime=grade.getGbegintime();
        System.out.println(gbegintime);
        Integer ttime= testpaper.getTtime();
        System.out.println(ttime);
        grade1.setGendtime("2017-12-10 15:00");
        grade1.setGanswer(grade.getGanswer());
        grade1.setGbegintime(grade.getGbegintime());
        grade1.setGscore(50);
        grade1.setGid(grade.getGid());
        grade1.setTestpaper(grade.getTestpaper());
        grade1.setStudents(grade.getStudents());
    }
    examDao.updateGradeExamDao(grade1);*/

  /*GradeDao gradeDao=new GradeDaoImpl();
 List<Grade> gradeList= gradeDao.selectGradeInfoByTidGradeDao(1);
 for (Grade grade:gradeList){
     System.out.println(grade.getGanswer());
 }*/

  Testpaper testpaper=examDao.updateTestpaperByTidExamDao(1);
      /*  Set<Grade> gradeSet=testpaper.getGradeSet();
        for (Grade grade:gradeSet){
            System.out.println(grade.getGanswer());
        }
        System.out.println();*/
        System.out.println(testpaper.getTeachscore());
    }
}
