#!/bin/bash

set -e

project=5e563d200f7fa60c683c8fe2
datatype="neuro/anat/t1w"

#cache the list of datasets that we could download
if [ ! -f all.json ]; then
    bl dataset query --limit 10000 --project $project --datatype $datatype --json > all.json
fi

#enumerate subjects
for subject in $(jq -r '.[].meta.subject' all.json | sort -u)
do
    echo $subject
    id=$(jq -r '.[] | select(.meta.subject == '\"$subject\"') | select(.prov.task.config._outputs[].tags == '[]') | ._id' all.json)
    bl dataset update --id $id --add_tag "CN_amyloid_pos"
done
