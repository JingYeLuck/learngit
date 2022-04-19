

***In this file, I mainly calculate the score of social indicators and governance indicators***

***kld.dta is the original data downloaded from SAS STUDIO****

use "E:\document_0308\kld.dta",clear

***In this step, calculate the social social score for each company****

***The social indicators includes five parts, that is, Community, Human Rights, Employee Relations, Diversity and Product***

***In each part, there are both poistive and negative indicators, which are deneoted by "str" and "con", "str" represents strength while "con" represents con///
   /// the variable is named after the first few letters of each indicator, followed by "str" or "con", then followed by the letter.
   
***calculate the social performance score****

egen social_str=rowtotal( COM_str* HUM_str*  EMP_str* DIV_str*  PRO_str* )

egen social_con=rowtotal( COM_con* HUM_con*  EMP_con* DIV_con*  PRO_con* )

gen social_dif=social_str - social_con

su social_dif

***calculate the governance performance score****

egen governance_str=rowtotal( CGOV_str*)

egen governance_con=rowtotal( CGOV_con*)

gen governance_dif=governance_str - governance_con

su governance_dif




