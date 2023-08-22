package com.kosmo.springapp.nutrient.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class N_FoodTableDTO {

	private String n_no;               
	private String n_postno;              
	private String n_productname;    
	private String n_company;       
	private String n_expiration;  
	private String n_intake;          
	private String n_shape;          
	private String n_nutrient;       
	private String n_caution;       
	private String n_standard;       
	private String n_material;      
	private String n_imgurl;
}
