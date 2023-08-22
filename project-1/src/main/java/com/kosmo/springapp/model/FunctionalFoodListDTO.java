package com.kosmo.springapp.model;

import lombok.*;
import org.apache.ibatis.type.Alias;

import java.sql.Date;


@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Alias("functionalFoodListDto")
public class FunctionalFoodListDTO {
  private int no;
  private long postNo;
  private String productName;
  private String company;
  private String expiration;
  private String intake;
  private String shape;
  private String nutrient;
  private String caution;
  private String standard;
  private String material;
  private String imgURL;

}
