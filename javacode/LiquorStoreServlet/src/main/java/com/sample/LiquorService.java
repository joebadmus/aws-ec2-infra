package com.sample;

import com.sample.model.LiquorType;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by kasun on 5/24/17.
 */
public class LiquorService {

    public List getAvailableBrands(LiquorType type){

        List brands = new ArrayList();

        if(type.equals(LiquorType.WINE)){
            brands.add("Adrianna Vineyard");
            brands.add(("J. P. Chenet"));
            brands.add(("J. P. Chenet 007"));

        }else if(type.equals(LiquorType.WHISKY)){
            brands.add("Glenfiddich");
            brands.add("Johnnie Walker");

        }else if(type.equals(LiquorType.BEER)){
            brands.add("Corona");

        }else if(type.equals(LiquorType.VODKA)){
            brands.add("Ciroc");

        }else {
            brands.add("No Brand Available");
        }
    return brands;
    }
}
