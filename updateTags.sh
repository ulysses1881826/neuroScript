#!/bin/bash

set -e


MCI_project=5e44ab0a1eafff87c0f93fe3
CN_project=5e563d200f7fa60c683c8fe2
AD_project=5e5f781b82b37fb68b8fa0c9
anat_datatype="neuro/anat/t1w"
freesurfer_datatype="neuro/freesurfer"
par_datatype="neuro/parcellation/volume"

##############################################Update CN tags##############################################
#cache the list of datasets that we could download
if [ ! -f CN_freesufer_all.json ]; then
    bl dataset query --limit 10000 --project $CN_project --datatype $freesurfer_datatype --json > CN_freesufer_all.json
fi

#enumerate subjects
for CN_subject in $(jq -r '.[].meta.subject' CN_freesufer_all.json | sort -u)
do
    echo $CN_subject
#     id=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | select(.prov.task.config._outputs[].tags == '[]') | ._id' CN_freesufer_all.json)
    CN_id=$(jq -r '.[] | select(.meta.subject == '\"$CN_subject\"') | ._id' CN_freesufer_all.json)
    bl dataset update --id $CN_id --add_tag "CN_freesurfer"
done


##############################################Update MCI tags##############################################
#cache the list of datasets that we could download
if [ ! -f MCI_freesufer_all.json ]; then
    bl dataset query --limit 10000 --project $MCI_project --datatype $freesurfer_datatype --json > MCI_freesufer_all.json
fi

#enumerate subjects
for MCI_subject in $(jq -r '.[].meta.subject' MCI_freesufer_all.json | sort -u)
do
    echo $MCI_subject
#     id=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | select(.prov.task.config._outputs[].tags == '[]') | ._id' MCI_freesufer_all.json)
    MCI_id=$(jq -r '.[] | select(.meta.subject == '\"$MCI_subject\"') | ._id' MCI_freesufer_all.json)
    bl dataset update --id $MCI_id --add_tag "MCI_freesurfer"
done


##############################################Update AD tags##############################################
#cache the list of datasets that we could download
if [ ! -f AD_freesufer_all.json ]; then
    bl dataset query --limit 10000 --project $AD_project --datatype $freesurfer_datatype --json > AD_freesufer_all.json
fi

#enumerate subjects
for AD_subject in $(jq -r '.[].meta.subject' AD_freesufer_all.json | sort -u)
do
    echo $AD_subject
#     id=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | select(.prov.task.config._outputs[].tags == '[]') | ._id' AD_freesufer_all.json)
    AD_id=$(jq -r '.[] | select(.meta.subject == '\"$AD_subject\"') | ._id' AD_freesufer_all.json)
    bl dataset update --id $AD_id --add_tag "AD_freesurfer"
done




