package com.hao;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Unit test for simple App.
 */
public class AppTest 
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void shouldAnswerWithTrue()
    {
        assertTrue( true );
    }

    @Test
    public void TestWork(){
        //两种数组转集合的方法
        String[] arry={"1","2","3"};
        List<String> resultList=new ArrayList<>(Arrays.asList(arry));
        for (int i=0;i<resultList.size();i++){
            System.out.println(resultList.get(i));
        }

        List<String> list=new ArrayList<>(arry.length);
        Collections.addAll(list,arry);
        for (int i=0;i<list.size();i++){
            System.out.println(list.get(i));
        }


    }
}
