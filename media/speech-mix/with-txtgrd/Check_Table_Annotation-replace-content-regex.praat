# This script helps you to check the annotation and replace the text content of a given tier.
# It assumes that there are pairs of sound files and TextGrid files with the same names.
# It opens every pair in the specified folder, allow you to edit them, and save the changes automatically.
# Author: Jack Bowers using script by Shigeto Kawahara as template
#2016/11/24

form 
	sentence Directory ./
endform

Create Strings as file list... list 'directory$'*.TextGrid
numberOfFiles = Get number of strings
 
##
for ifile to numberOfFiles
	select Strings list
	fileName$ = Get string... ifile
	object_name$ = "'fileName$'" - ".TextGrid"
	Read from file... 'directory$''object_name$'.TextGrid
	
	select TextGrid 'object_name$'

### Run replacement processes for given tier in TextGrid; 
GRT-INF.hello-how_are_you

	Replace interval text: 6, 0, 0, "^(GRT-INF\.hello-how_are_you)$", "hello", "Regular Expressions"


	#Replace interval text: 6, 0, 0, "PRON-EMPH1S\]", "PRON-EMPH.1S", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H)$", "˥", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F)$", "↘", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F_R)$", "↘↗", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(M)$", "˧", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(R)$", "↗", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(L)$", "˩", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(T)$", "∙", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(R_F)$", "↗↘", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(R_F!)$", "↗↘ꜜ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H_F)$", "˥↘", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(F_R!)$", "↘↗ꜜ", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(M\^)$", "˧ꜛ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H!)$", "˥ꜜ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(L\^)$", "˩ꜛ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F\^)$", "↘ꜛ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(R!)$", "↗ꜜ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F!)$", "↘ꜜ", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(H^)$", "˥ꜛ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H_L)$", "˥˩", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H_F^)$", "˥↘ꜛ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(M!)$", "˧ꜜ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F_R_F)$", "↘↗↘", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(M_L)$", "˧˩", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(E)$", "∙", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H_M)$", "˥˧", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F_R_F!)$", "↘↗↘ꜜ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(FF)$", "↘", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(HF)$", "˥↘", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(L_R)$", "˩↗", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(L_H)$", "˩˥", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H_R)$", "˥↗", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(HL)$", "˥˩", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(LM)$", "˩˧", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(HH)$", "˥ꜛ", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(Low)$", "˩", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(H_M^)$", "˥˧ꜛ", "Regular Expressions"
  
	Replace interval text: 1, 0, 0, "^(F_L)$", "↘˩", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(LH)$", "˩˥", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F_R^)$", "↘↗ꜛ", "Regular Expressions"
 
	Replace interval text: 1, 0, 0, "^(M_H)$", "˧˥", "Regular Expressions"

	Replace interval text: 1, 0, 0, "^(F or M)$", "∙", "Regular Expressions"


# Then save it as a text file with "TextGrid" extension.

	Write to text file... 'directory$''object_name$'.TextGrid


# Create Table file from modified textgrid

Down to Table... no 2 no no

	select Table 'object_name$'

	Save as tab-separated file... 'directory$''object_name$'.txt

     	select all
     	minus Strings list
     	Remove

# And it ends if it goes through all the files in the directory.

endfor

# After the loop, let's clear off all the window.

select all
Remove
