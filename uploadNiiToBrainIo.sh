#!/bin/bash

#FILES=/home/ubuntu/Desktop/ADNI_MRI_Image/nii_MCI/*
FILES=/home/ubuntu/Desktop/ADNI_MRI_Image/nii_CN/*
for f in $FILES
do
	for nii in $f/*
    do 
		filename=$(echo $f | awk -F "/" '{print $NF}')
		echo $filename
		echo $nii
		bl dataset upload \
	        --project 5e563d200f7fa60c683c8fe2 \
		--datatype neuro/anat/t1w \
		--subject $filename \
		--session 1 \
		--t1 $nii
    done
done
