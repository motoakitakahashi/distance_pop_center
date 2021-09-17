# Distances across population centers of US states

The US census bureau provides centers of population in US states and District of Columbia. In a different repository, I provide decimal point representation of longitudes and latitudes of such population centers:
https://github.com/motoakitakahashi/state_centers_population

Here, using the decimal point representation, I compute distances between population centers of US states. I describe the files in this repository in the following:

- decimal_70.csv - decimal_10.csv: longitudes and latitudes of population centers of US states from 1970 to 2010, represented in decimal points
- get_dis_mat.r: an R file that computes a distance matrix across population centers of US states, using the WGS84 ellipsoid
- dis_df_70.csv - dis_df_10.csv: distances across population centers of US states from 1970 to 2010. They are output files of get_dis_mat.r