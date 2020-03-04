#!/bin/bash

##This part is for MCI

FILES=/home/ubuntu/Desktop/ADNI_MRI_Image/nii_MCI/*
for f in $FILES
do
	for nii in $f/*
    do 
		filename=$(echo $f | awk -F "/" '{print $NF}')
		echo $filename
		echo $nii
		bl dataset upload \
        --project 5e44ab0a1eafff87c0f93fe3 \
        --desc 'This is subject no matter postive' \
		--datatype neuro/anat/t1w \
		--subject $filename \
		--session 1 \
		--t1 $nii \
        --tag "all"
    done
done



##This part is for CN

# FILES=/home/ubuntu/Desktop/ADNI_MRI_Image/nii_MCI/*
# for f in $FILES
# do
# 	for nii in $f/*
#     do 
# 		filename=$(echo $f | awk -F "/" '{print $NF}')
# 		echo $filename
# 		echo $nii
# 		bl dataset upload \
#         --project 5e44ab0a1eafff87c0f93fe3 \
#         --desc 'This is subject no matter postive' \
# 		--datatype neuro/anat/t1w \
# 		--subject $filename \
# 		--session 1 \
# 		--t1 $nii
#         --tag "all"
#     done
# done


##This part is for AD

# FILES=/home/ubuntu/Desktop/ADNI_MRI_Image/nii_MCI/*
# for f in $FILES
# do
# 	for nii in $f/*
#     do 
# 		filename=$(echo $f | awk -F "/" '{print $NF}')
# 		echo $filename
# 		echo $nii
# 		bl dataset upload \
#         --project 5e44ab0a1eafff87c0f93fe3 \
#         --desc 'This is subject no matter postive' \
# 		--datatype neuro/anat/t1w \
# 		--subject $filename \
# 		--session 1 \
# 		--t1 $nii
#         --tag "all"
#     done
# done




















