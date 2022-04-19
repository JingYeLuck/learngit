use "E:\document_0308\kld.dta",clear

**in this step, calculate S

egen s_str=rowtotal( COM_str* HUM_str*  EMP_str* DIV_str*  PRO_str* )

egen s_con=rowtotal( COM_con* HUM_con*  EMP_con* DIV_con*  PRO_con* )
gen s_dif=s_str-s_con




egen g_str=rowtotal( CGOV_str*)

egen g_con=rowtotal( CGOV_con*)

gen g_dif=g_str-g_con