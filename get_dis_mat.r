# Motoaki Takahashi
# R version 4.0.4 (2021-02-15) 

rm(list=ls())
# setwd("your folder")
library(tidyr)
library(dplyr)
library(readxl)
library(readr)
library(data.table)
library(haven)
library(stargazer)
library(ggplot2)
library(jtools)
library(ggstance)
library(broom.mixed)
library(stringr)
library(openxlsx)
library(texreg)
library(geosphere)
library(sp)

# read longitudes and latitudes of population centers (decimal points)

decimal_70 = read_csv("decimal_70.csv")
decimal_80 = read_csv("decimal_80.csv")
decimal_90 = read_csv("decimal_90.csv")
decimal_00 = read_csv("decimal_00.csv")
decimal_10 = read_csv("decimal_10.csv")

# write a function to get the distance matrices
get_dis_mat = function(decimal_data){
  dis_mat = matrix(NA, nrow = nrow(decimal_data), ncol = nrow(decimal_data))
  
  for (i in 1:nrow(decimal_data)){
    for (j in 1:nrow(decimal_data)) {
      dis_mat[i, j] = distGeo(c(decimal_data$lon_dec[i], decimal_data$lat_dec[i]), c(decimal_data$lon_dec[j], decimal_data$lat_dec[j]))
      
    }
  }
  return(dis_mat)
}

dis_mat_70 = get_dis_mat(decimal_70)
dis_mat_80 = get_dis_mat(decimal_80)
dis_mat_90 = get_dis_mat(decimal_90)
dis_mat_00 = get_dis_mat(decimal_00)
dis_mat_10 = get_dis_mat(decimal_10)

# write state names
state_name = decimal_70$state


make_dis_df = function(dis_mat){
  dis_mat = as.data.frame(dis_mat)
  dis_mat = cbind(state_name, dis_mat)
  names(dis_mat)[2:(length(state_name)+1)] = state_name
  return(dis_mat)
}

dis_df_70 = make_dis_df(dis_mat_70)
dis_df_80 = make_dis_df(dis_mat_80)
dis_df_90 = make_dis_df(dis_mat_90)
dis_df_00 = make_dis_df(dis_mat_00)
dis_df_10 = make_dis_df(dis_mat_10)

# save the output
write_csv(dis_df_70, "dis_df_70.csv")
write_csv(dis_df_80, "dis_df_80.csv")
write_csv(dis_df_90, "dis_df_90.csv")
write_csv(dis_df_00, "dis_df_00.csv")
write_csv(dis_df_10, "dis_df_10.csv")
