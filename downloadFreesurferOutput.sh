#!/bin/bash

set -e

MCI_project=5e44ab0a1eafff87c0f93fe3
CN_project=5e563d200f7fa60c683c8fe2
AD_project=5e5f781b82b37fb68b8fa0c9
datatype="neuro/freesurfer"


###############################This part is for MCI data download###################################

# #cache the list of datasets that we could download
# if [ ! -f all.json ]; then
#     bl dataset query --limit 10000 --project $project --datatype $datatype --json > all.json
# fi

# #enumerate subjects
# for subject in $(jq -r '.[].meta.subject' all.json | sort -u)
# do
#     echo "downloading subject:$subject ---------------"
# #    mkdir -p MCI_freesurfer_output/$subject/
#     ids=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | ._id' all.json)
#     for id in $ids
#     do
#         echo $id
# #        tags=$(jq -r '.[] | select(._id=='\"$id\"') | .tags | join(".")' all.json)
#         outdir=MCI_freesurfer_output/$subject
#         if [ ! -d $outdir ]; then
# 	    mkdir -p MCI_freesurfer_output/$subject 
#             bl dataset download $id --directory $outdir
#         fi
#     done
# done


###############################This part is for CN data download###################################

#cache the list of datasets that we could download
if [ ! -f all.json ]; then
    bl dataset query --limit 10000 --project $CN_project --datatype $datatype --json > all.json
fi

#enumerate subjects
for subject in $(jq -r '.[].meta.subject' all.json | sort -u)
do
    echo "downloading subject:$subject ---------------"
    ids=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | ._id' all.json)
    for id in $ids
    do
        echo $id
#        tags=$(jq -r '.[] | select(._id=='\"$id\"') | .tags | join(".")' all.json)
        outdir=CN_freesurfer_output/$subject
        if [ ! -d $outdir ]; then
            mkdir -p CN_freesurfer_output/$subject 
            bl dataset download $id --directory $outdir
            rm -rf CN_freesurfer_output/$subject/output/label #目的是只保留freesurfer输出的stats部分结果
            rm -rf CN_freesurfer_output/$subject/output/mri
            rm -rf CN_freesurfer_output/$subject/output/scripts
            rm -rf CN_freesurfer_output/$subject/output/surf
            rm -rf CN_freesurfer_output/$subject/output/tmp
            rm -rf CN_freesurfer_output/$subject/output/touch
            rm -rf CN_freesurfer_output/$subject/output/trash
        fi
    done
done


###############################This part is for AD data download###################################

## cache the list of datasets that we could download
# if [ ! -f all.json ]; then
#     bl dataset query --limit 10000 --project $project --datatype $datatype --json > all.json
# fi

# #enumerate subjects
# for subject in $(jq -r '.[].meta.subject' all.json | sort -u)
# do
#     echo "downloading subject:$subject ---------------"
# #    mkdir -p MCI_freesurfer_output/$subject/
#     ids=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | ._id' all.json)
#     for id in $ids
#     do
#         echo $id
# #        tags=$(jq -r '.[] | select(._id=='\"$id\"') | .tags | join(".")' all.json)
#         outdir=MCI_freesurfer_output/$subject
#         if [ ! -d $outdir ]; then
# 	    mkdir -p MCI_freesurfer_output/$subject 
#             bl dataset download $id --directory $outdir
#         fi
#     done
# done
