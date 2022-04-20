

***In this file, I mainly calculate the score of social indicators and governance indicators***

***kld.dta is the original data downloaded from SAS STUDIO****

use "E:\document_0308\kld.dta",clear

***In this step, calculate the social social score for each company****

***The social indicators includes five parts, that is, Community, Human Rights, Employee Relations, Diversity and Product***

***In each part, there are both poistive and negative indicators, which are deneoted by "str" and "con", "str" represents strength while "con" represents con///
   /// the variable is named after the first few letters of each indicator, followed by "str" or "con", then followed by the letter.

su

***1. calculate the social performance score****
edit COM*
***Since *_num in the date denotes the total numbers of relative concerns, delete it, the following parts follow the same cirteria***
drop COM_str_num  COM_con_num

edit HUM*

drop HUM_str_num  HUM_con_num

edit EMP*

drop EMP_str_num  EMP_con_num

edit DIV*

drop DIV_str_num  DIV_con_num

edit PRO*

drop PRO_str_num  PRO_con_num

su COM* HUM*  EMP*  DIV*  PRO*

***Through this step, all variable has a value of 0 or 1, except Pro_con_A with maximum value 2.
***after checking companies with PRO_con_A==2, since the year for the rating is 1995, delete it

drop if PRO_con_A==2


egen social_str=rowtotal( COM_str* HUM_str*  EMP_str* DIV_str*  PRO_str* )

egen social_con=rowtotal( COM_con* HUM_con*  EMP_con* DIV_con*  PRO_con* )

gen social_dif=social_str - social_con

su social_dif
*** for this varaible, the minmium value is -10, the maximum is 14.Do we need normaliza?????

***2. calculate the governance performance score****

edit CGOV*

drop CGOV_str_num  CGOV_con_num

su CGOV*

egen governance_str=rowtotal( CGOV_str*)

egen governance_con=rowtotal( CGOV_con*)

gen governance_dif=governance_str - governance_con

su governance_dif

*** for this varaible, the minmium value is -4, the maximum is 3.


