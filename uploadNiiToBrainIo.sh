#!/bin/bash

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
		--datatype neuro/anat/t1w \
		--subject $filename \
		--session 1 \
		--t1 $nii
    done
done
